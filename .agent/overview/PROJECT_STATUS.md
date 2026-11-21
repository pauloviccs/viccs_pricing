# Project Overview

## Project Name
VICCS Pricing Pro

## Description
Plataforma SaaS de engenharia e gestão de orçamentos comerciais da **Viccs Design**. A aplicação opera como um montador de propostas inteligente (estilo carrinho de compras modular), permitindo o empilhamento de múltiplos serviços (Motion Design, Identidade Visual, Gráfica & Papelaria, Web Development, Sistemas & Software SaaS/B2B, Social Media, Impressão de Grandes Formatos e Manutenção), precificação paramétrica em tempo real, ajustes comerciais com justificativa formal, autenticação restrita via Supabase Auth com validação de administrador, sincronização em banco de dados relacional (PostgreSQL/Supabase), histórico de propostas salvas com busca rápida e exportação contínua de PDF multipágina com chave PIX embutida.

A interface segue rigorosamente a **Identidade Visual Oficial (IDV) da Viccs Design**, utilizando a paleta nobre Crimson & Wine (`#a32b2b`, `#5a1515`, `#262e2f`), superfícies Dark Liquid Glass, logotipo vetorial e layout totalmente responsivo para mobile (iOS/Android), tablets e desktop.

## Tech Stack
- Languages: HTML5, JavaScript (ES6+, JSX), SQL (PostgreSQL)
- Frameworks: React 18 (via CDN), ReactDOM 18 (via CDN)
- Tools: Babel Standalone v7 (via CDN), Tailwind CSS v3 (via CDN), html2canvas v1.4.1 (via CDN), jsPDF v2.5.1 (via CDN), Supabase JS Client v2 (UMD via CDN)
- Services: Supabase (Auth, PostgreSQL Database, Storage), localStorage (Cache/Fallback Offline), Google Fonts (Inter)
- Brand Assets: Vetores oficiais em `.agent/assets/logo/` (`VICCS_Design_Icon_BWR.svg`, `VICCS_Design_Logo_txt.svg`)

## Folder Structure
```text
viccs-pricing/
├── .agent/
│   ├── assets/
│   │   ├── brand_base64.json
│   │   └── logo/
│   │       ├── VICCS_ColorsLOGO.svg
│   │       ├── VICCS_Design_3D_Icon_BWR.svg
│   │       ├── VICCS_Design_Icon_BWR.svg
│   │       ├── VICCS_Design_Icon_WR.svg
│   │       ├── VICCS_Design_Isotipo.svg
│   │       ├── VICCS_Design_Isotipo_WHITE.svg
│   │       ├── VICCS_Design_Logo_txt.svg
│   │       └── VICCS_Design_Logo_txt_WHITE.svg
│   ├── backup/
│   │   ├── index_backup.html
│   │   ├── index_backup_v2.html
│   │   └── index_backup_v3.html
│   ├── context/
│   │   ├── architecture.md
│   │   ├── database_schema.md
│   │   ├── stack.md
│   │   ├── supabase_fix.sql
│   │   └── viccs-pricing-pro-context.md
│   ├── guidelines/
│   │   ├── code_style.md
│   │   └── ui_ux.md
│   ├── media/
│   │   ├── favicon/
│   │   ├── pdf/
│   │   ├── png/
│   │   └── svg/
│   ├── memory/
│   │   ├── active_task.md
│   │   ├── changelog.md
│   │   ├── implementation_plan.md
│   │   └── todos.md
│   ├── overview/
│   │   └── PROJECT_STATUS.md
│   └── workflows/
│       ├── create_component_skill.md
│       └── review_pr_skill.md
├── .agents/
├── apply_brand_idv.js
├── index.html
├── README.md
├── skills-lock.json
└── update_index.js
```

## Arquitetura & Implementação

### 1. Sistema de Identidade Visual Oficial (Crimson & Wine IDV)
- **Cores da Marca:**
  - *Crimson Primário (`#a32b2b`):* Acento de destaque, botões de ação e sombras difusas `shadow-glow-crimson`.
  - *Deep Wine (`#5a1515`):* Profundidade visual em gradientes e botões secundários.
  - *Gunmetal Charcoal (`#262e2f`) & Titanium (`#2d3636`):* Superfícies metálicas e contrastes sóbrios.
  - *Deep Obsidian (`#08090b`):* Fundo escuro imersivo.
- **Logotipos Oficiais:**
  - Ícone de topo e Login: `VICCS_Design_Icon_BWR.svg`.
  - Proposta Comercial (PDF): `VICCS_Design_Logo_txt.svg` em alta definição para impressão A4.
- **Sem Duplicações:** Tipografia e logos distribuídos cirurgicamente sem elementos repetidos.

### 2. Responsividade Total & Otimização Mobile (iOS, Android, Tablet)
- **Top Navbar:** Fixa com efeito glassmorphism e acesso rápido a Histórico e Carrinho.
- **Barra Flutuante Mobile:** Em telas `< lg`, uma barra inferior fixa mantém o total e o botão de adicionar/visualizar sempre ao alcance do polegar.
- **Mobile Cart Drawer:** Gaveta lateral fluida para gerenciar itens, alterar quantidades e exportar sem rolagem excessiva.

### 3. Autenticação & Permissões (Supabase Auth)
- Login/Cadastro seguro com e-mail e senha, restrição de acesso até liberação por administrador (`is_admin = true`). Modo preview local para desenvolvimento ágil.

### 4. Motor de Precificação Polimórfica (34 serviços em 11 categorias)
- Módulos específicos para Motion Design (segundos + estilos), Grandes Formatos (m²) e Standard (Gráfica, Web Development, Software SaaS B2B, Social Media, etc.). Piso mínimo de R$ 50,00 respeitado.

### 5. Carrinho Multi-Itens & Exportação
- Empilhamento de serviços, ajustes com justificativa, persistência local/Supabase e geração de PDF contínuo com dados PIX.

## Estado Atual do Projeto
- **Status Operacional:** Completo, testado, 100% responsivo e alinhado à IDV da Viccs Design.

---
*Sincronizado em: 2026-11-21*
