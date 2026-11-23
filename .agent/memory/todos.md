# Backlog & Próximos Passos (TODOs) — VICCS Pricing Pro

## Tarefas de Infraestrutura & Banco de Dados
- [ ] **Executar script SQL no Supabase:** Rodar o arquivo `.agent/context/supabase_fix.sql` no SQL Editor do painel Supabase para aplicar as políticas RLS sem recursão e conceder cargo de administrador a `pauloviccsdesign@gmail.com`.
- [ ] **Configurar Bucket de Storage:** Criar o bucket `proposals-pdf` no Supabase Storage caso deseje arquivamento centralizado na nuvem das propostas exportadas.

## Melhorias de Catálogo & Negócio (Concluídas)
- [x] **Expansão de Catálogo (Gráfica, Web Dev e Software):** Adicionados 15 novos serviços e 3 novas categorias com preços de mercado justos (total de 34 serviços em 11 categorias).
- [x] **Overhaul Visual com Identidade Oficial (IDV):** Aplicação das cores Crimson & Wine (`#a32b2b` / `#5a1515`), logos vetoriais em SVG sem duplicações, barra flutuante e gaveta mobile.
- [x] **Identidade Visual Completa no PDF de Orçamento:** Reestruturação do template `#pdf-proposal` com logotipo horizontal oficial, isótipo em cores, marca d'água sutil, régua cromática da marca e tabelas em Gunmetal Charcoal.
- [x] **Padronização de Logos sem Cortes & Dados Comerciais no PDF:** Logotipos oficiais ajustados com dimensões nativas SVG (`VICCS_Design_Logo_txt.svg` no cabeçalho e `VICCS_Design_Icon_BWR.svg` no badge e rodapé), remoção de sobreposições, Chave PIX (CPF `049.081.945-13`, `Paulo Vinicios Oliveira da Silva`) e dados de emissor (`Paulo Vinicios O. Silva - VICCS Design`, `pauloviccsdesign@gmail.com`).

## Melhorias Futuras (Roadmap Opcional)
- [ ] **Painel de Aprovação de Usuários:** Adicionar na interface visual um botão ou modal onde administradores possam listar usuários cadastrados e alternar o switch `is_admin` diretamente pelo app.
- [ ] **Templates Rápidos de Proposta:** Criar atalhos na tela para pacotes pré-definidos (ex: "Branding + Papelaria", "Lançamento Web + Landing Page", "Pacote SaaS Starter").
