# VICCS Pricing Pro — Gestão & Engenharia de Propostas

> Plataforma SaaS comercial para cálculo, gestão e exportação de propostas comerciais da **Viccs Design**.

---

## ⚡ Visão Geral

O **VICCS Pricing Pro** é uma aplicação web moderna construída com arquitetura de arquivo único (*Single-File Application*), focada em velocidade, confiabilidade, compatibilidade universal (mobile iOS/Android, tablets e desktop) e alinhada 100% à **Identidade Visual Oficial (IDV) da Viccs Design**.

---

## 🎨 Identidade Visual & Design System Oficial

A aplicação utiliza os elementos e a paleta oficial da Viccs Design:
- **Crimson Primário (`#a32b2b`):** Cor de acento vibrante, botões de ação e sombras de destaque (`shadow-glow-crimson`).
- **Deep Wine (`#5a1515`):** Tom de vinho profundo para gradientes de transição e cards nobres.
- **Dark Maroon (`#4e1617`):** Superfícies escuras ricas em detalhes.
- **Gunmetal Charcoal (`#262e2f`) & Titanium (`#2d3636`):** Tons metálicos para contraste sóbrio e cabeçalhos de escopo.
- **Deep Obsidian (`#08090b`):** Fundo imersivo com superfícies Liquid Glass (`backdrop-blur-2xl bg-[rgba(18,20,25,0.75)]`).
- **Logotipos Vetoriais Padronizados:** 
  - Ícone oficial `VICCS_Design_Icon_BWR.svg` na navbar, tela de login, badge de proposta comercial no PDF e rodapé timbrado.
  - Logotipo horizontal tipográfico oficial `VICCS_Design_Logo_txt.svg` no cabeçalho do PDF, renderizado com dimensões vetoriais nativas sem cortes ou distorções.

---

## 📱 Responsividade & Mobile-First (iOS, Android, Tablet)

- **Barra Flutuante no Rodapé (Mobile):** Mantém o valor do orçamento e atalhos rápidos ("Adicionar" e "Ver Carrinho") sempre visíveis em smartphones.
- **Drawer de Carrinho Lateral (Mobile/Tablet):** Gaveta deslizante para editar itens, quantidades e exportar orçamentos sem rolar a página inteira.
- **Touch Targets Otimizados:** Elementos interativos dimensionados com área mínima confortável de toque (`min-h-[44px]`).

---

## 🚀 Funcionalidades Principais

- **Catálogo de 34 Serviços em 11 Categorias:**
  - **Motion Design:** Animações com slider de segundos (5s a 120s+), 3 estilos visuais e sound design comercial opcional.
  - **Gráfica & Papelaria:** Cartões de visita, papéis timbrados, convites de casamento nobres impressos, cardápios e flyers.
  - **Web Development:** Convites interativos (webapps), landing pages de alta conversão, sites institucionais, portfólios e e-commerces.
  - **Sistemas & Software:** Painéis web (CRUDs), MVPs / Micro-SaaS, plataformas SaaS B2B completas, sistemas sob medida e aplicativos mobile.
  - **Identidade & Design, Social Media, Pacotes Mensais, Estampas, Grandes Formatos e Manutenções.**
- **Carrinho Multi-Itens & Ajustes Comerciais:** Adicione múltiplos serviços ao mesmo orçamento com acréscimos e descontos formais justificados.
- **Condições de Pagamento Dinâmicas:** PIX À Vista, PIX 50%+50%, Cartão 1x (+4%) e Cartão Parcelado (+6%, de 2x a 12x parcelas).
- **Exportação Multipágina em PDF com Padrão Executivo de Papel Timbrado:** 
  - Logotipo tipográfico corporativo oficial (`VICCS_Design_Logo_txt.svg`) no cabeçalho.
  - Ícone oficial (`VICCS_Design_Icon_BWR.svg`) no selo de proposta e no rodapé institucional.
  - Faixas tricolores de marca nas margens (Carmim, Vinho e Gunmetal).
  - Tabela de escopo detalhado com cabeçalho Gunmetal sólido e badges de categoria.
  - Chave PIX oficial destacada (CPF `049.081.945-13`, titular `Paulo Vinicios Oliveira da Silva`).
  - Dados do responsável técnico/emissor oficiais (`Paulo Vinicios O. Silva - VICCS Design`, `pauloviccsdesign@gmail.com`, `viccsdesign.vercel.app`).
  - Renderização de alta fidelidade contínua via `html2canvas` + `jsPDF`.
- **Autenticação Segura via Supabase:** Acesso com e-mail e senha, restrito a administradores aprovados. Fallback offline automático no `localStorage`.

---

## 🛠️ Tech Stack

| Camada | Tecnologia | Detalhes |
|---|---|---|
| **Linguagens** | HTML5, JavaScript (ES6+, JSX), SQL | Componentes funcionais React com tipografia moderna |
| **Framework UI** | React 18 & ReactDOM 18 | Importados via CDN (UMD) |
| **Compilação** | Babel Standalone v7 | Transpilação JSX em tempo real direto no cliente |
| **Estilização** | Tailwind CSS v3 | Design System Dark Liquid Glass customizado com paleta Crimson & Wine |
| **Banco & Auth** | Supabase (PostgreSQL & GoTrue Auth) | Client JS v2 via CDN, tabelas relacionais com RLS |
| **Exportação** | html2canvas + jsPDF | Geração de propostas visuais em formato PDF A4 multipágina |
| **Cache Local** | Web Storage API (`localStorage`) | Fallback automático que garante funcionamento sem internet |

---

## 💻 Como Executar

### 1. Execução Local Direta
Como a aplicação é uma *Single-File Application* baseada em CDN, basta abrir o arquivo `index.html` em qualquer navegador moderno:
- Clique duplo no arquivo `index.html`, ou
- Inicie um servidor local de desenvolvimento (ex: extensão *Live Server* no VS Code ou executando `npx serve .`).

### 2. Configuração do Supabase (Opcional para Nuvem)
1. Acesse o console do seu projeto no [Supabase](https://supabase.com).
2. Abra o **SQL Editor**.
3. Copie e cole todo o conteúdo do arquivo [`.agent/context/supabase_fix.sql`](.agent/context/supabase_fix.sql).
4. Execute o script para ativar a persistência em nuvem e permissões de administrador.

---
*Atualizado em: 23 de Novembro de 2026*
