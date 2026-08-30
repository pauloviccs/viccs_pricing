-- ==============================================================================
-- VICCS PRICING PRO — SCRIPT SQL CORRIGIDO (SEM RECURSÃO DE RLS)
-- Execute este script no SQL Editor do seu painel do Supabase
-- ==============================================================================

-- 1. Habilitar extensão UUID
create extension if not exists "uuid-ossp";

-- 2. Limpar políticas antigas para evitar conflito de recursão
drop policy if exists "Usuários podem ver seu próprio perfil" on public.profiles;
drop policy if exists "Admins podem visualizar todos os perfis" on public.profiles;
drop policy if exists "Admins podem atualizar perfis" on public.profiles;
drop policy if exists "Users can view own profile" on public.profiles;
drop policy if exists "Users can update own profile" on public.profiles;
drop policy if exists "Admins têm acesso total a propostas" on public.proposals;
drop policy if exists "Admins têm acesso total a itens de proposta" on public.proposal_items;
drop policy if exists "Authenticated users can manage proposals" on public.proposals;
drop policy if exists "Authenticated users can manage proposal items" on public.proposal_items;

-- 3. Criar tabela de Perfis
create table if not exists public.profiles (
  id uuid references auth.users on delete cascade primary key,
  email text not null,
  full_name text,
  is_admin boolean default false,
  role text default 'member',
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Habilitar RLS em profiles
alter table public.profiles enable row level security;

-- Política SEM RECURSÃO para profiles: cada usuário acessa seu próprio perfil
create policy "profiles_select_own"
  on public.profiles for select
  using (auth.uid() = id);

create policy "profiles_insert_own"
  on public.profiles for insert
  with check (auth.uid() = id);

create policy "profiles_update_own"
  on public.profiles for update
  using (auth.uid() = id);

-- 4. Função helper SECURITY DEFINER para checar admin sem disparar RLS recursivo
create or replace function public.is_admin(user_id uuid)
returns boolean as $$
  select coalesce(
    (select is_admin from public.profiles where id = user_id),
    false
  );
$$ language sql security definer;

-- Trigger para criar perfil automaticamente no signup
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email, is_admin, role)
  values (new.id, new.email, false, 'member')
  on conflict (id) do nothing;
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- 5. Tabela de Propostas / Orçamentos
create table if not exists public.proposals (
  id uuid default gen_random_uuid() primary key,
  created_by uuid references public.profiles(id) on delete set null,
  client_name text not null,
  client_contact text,
  subtotal numeric(10, 2) not null default 0.00,
  additions numeric(10, 2) not null default 0.00,
  additions_reason text,
  discount numeric(10, 2) not null default 0.00,
  discount_reason text,
  total_value numeric(10, 2) not null default 0.00,
  payment_method text not null,
  installments integer default 1,
  payment_fee numeric(10, 2) default 0.00,
  installment_value numeric(10, 2) default 0.00,
  status text default 'saved',
  observations text,
  pdf_storage_path text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists idx_proposals_client on public.proposals(client_name);
create index if not exists idx_proposals_created_at on public.proposals(created_at desc);

-- 6. Tabela de Itens da Proposta
create table if not exists public.proposal_items (
  id uuid default gen_random_uuid() primary key,
  proposal_id uuid references public.proposals(id) on delete cascade not null,
  service_id text not null,
  service_name text not null,
  category text not null,
  quantity integer default 1 not null,
  unit_price numeric(10, 2) not null,
  total_price numeric(10, 2) not null,
  item_details jsonb not null default '{}'::jsonb,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists idx_proposal_items_proposal_id on public.proposal_items(proposal_id);

-- Habilitar RLS em proposals e proposal_items
alter table public.proposals enable row level security;
alter table public.proposal_items enable row level security;

-- Políticas para proposals (Usuários autenticados podem ler/criar/atualizar)
create policy "proposals_authenticated_all"
  on public.proposals for all
  to authenticated
  using (true)
  with check (true);

create policy "proposal_items_authenticated_all"
  on public.proposal_items for all
  to authenticated
  using (true)
  with check (true);

-- 7. Promover pauloviccsdesign@gmail.com para Administrador se já existir
update public.profiles
set is_admin = true, role = 'admin'
where email = 'pauloviccsdesign@gmail.com';
