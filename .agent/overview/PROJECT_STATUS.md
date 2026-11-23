# Project Overview

## Project Name
VICCS Pricing Pro

## Description
Plataforma SaaS corporativa para engenharia, montagem e exportação de propostas e orçamentos comerciais da **Viccs Design**. A aplicação funciona como um configurador modular de serviços em lote (estilo carrinho multi-itens), suportando 34 serviços divididos em 11 categorias de atuação (Motion Design, Identidade Visual, Gráfica & Papelaria Nobre, Web Development, Sistemas & Software SaaS/B2B, Social Media, Impressão em Grandes Formatos e Manutenções Técnicas), precificação paramétrica em tempo real, ajustes comerciais de acréscimo e desconto formalmente justificados, condições flexíveis de parcelamento (PIX e Cartão), autenticação via Supabase Auth com controle de permissão por perfil de administrador, persistência relacional (PostgreSQL) com fallback local (`localStorage`) e exportação de propostas em PDF multipágina no padrão executivo de papel timbrado.

A interface e o documento PDF gerado seguem estritamente a **Identidade Visual Oficial da Viccs Design**, empregando a paleta de cores nobre Crimson & Wine (`#a32b2b`, `#5a1515`, `#4e1617`, `#262e2f`, `#2d3636`), acabamento Dark Liquid Glass, réguas tricolores institucionais e uso padronizado dos logotipos vetoriais oficiais sem cortes ou sobreposições.

## Tech Stack
- Languages: HTML5, JavaScript (ES6+, JSX), SQL (PostgreSQL)
- Frameworks: React 18 (UMD via CDN), ReactDOM 18 (UMD via CDN)
- Tools: Babel Standalone v7 (CDN), Tailwind CSS v3 (CDN), html2canvas v1.4.1 (CDN), jsPDF v2.5.1 (CDN), Supabase JS Client v2 (UMD CDN)
- Services: Supabase (Authentication, PostgreSQL Database, Storage), Web Storage API (localStorage Fallback), Google Fonts (Inter)
- Brand Assets: Vetores oficiais em `.agent/assets/logo/` (`VICCS_Design_Icon_BWR.svg`, `VICCS_Design_Icon_WR.svg`, `VICCS_Design_Logo_txt.svg`, `VICCS_Design_Logo_txt_WHITE.svg`, `VICCS_Design_Isotipo.svg`, `VICCS_Design_Isotipo_WHITE.svg`, `VICCS_ColorsLOGO.svg`)

## Folder Structure
```text
viccs-pricing/
├── .agent/
│   ├── assets/
│   │   ├── additional_brand_base64.json
│   │   ├── brand_base64.json
│   │   ├── logo/
│   │   │   ├── VICCS_ColorsLOGO.svg
│   │   │   ├── VICCS_Design_3D_Icon_BWR.svg
│   │   │   ├── VICCS_Design_Icon_BWR.svg
│   │   │   ├── VICCS_Design_Icon_WR.svg
│   │   │   ├── VICCS_Design_Isotipo.svg
│   │   │   ├── VICCS_Design_Isotipo_WHITE.svg
│   │   │   ├── VICCS_Design_Logo_txt.svg
│   │   │   └── VICCS_Design_Logo_txt_WHITE.svg
│   │   └── pdf/
│   │       └── Proposta_Lucineide_Oliveira_VICCS.pdf
│   ├── backup/
│   │   ├── index_backup.html
│   │   ├── index_backup_v2.html
│   │   ├── index_backup_v3.html
│   │   ├── index_backup_v4.html
│   │   └── update_index.js
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
│   └── skills/
├── base64_png.txt
├── base64_svg_white.txt
├── index.html
├── README.md
├── skills-lock.json
└── update_index.js
```

## Arquitetura & Implementação

### 1. Sistema de Identidade Visual Oficial (Crimson & Wine IDV)
- **Paleta Cromática Oficial:**
  - *Crimson Primário (`#a32b2b`):* Acento de destaque, botões de ação e sombras difusas `shadow-glow-crimson`.
  - *Deep Wine (`#5a1515`):* Transições tonais, gradientes e superfícies nobres.
  - *Dark Maroon (`#4e1617`):* Tons escuros profundos e contraste suave.
  - *Gunmetal Charcoal (`#262e2f`) & Titanium (`#2d3636`):* Superfícies metálicas e cabeçalhos de tabela.
  - *Deep Obsidian (`#08090b`):* Fundo imersivo com acabamento Liquid Glass.
- **Logotipos Vetoriais Padronizados:**
  - *Navbar & Login Hero:* Ícone vetorial oficial `VICCS_Design_Icon_BWR.svg` de alta definição.
  - *Cabeçalho do PDF (Esquerda):* Logotipo tipográfico `VICCS_Design_Logo_txt.svg` (`250px x 69px`), com atributos intrínsecos de largura e altura injetados no SVG, garantindo proporção matemática 3.61:1 sem corte por renderizadores.
  - *Badge da Proposta (PDF - Direita):* Ícone oficial `VICCS_Design_Icon_BWR.svg` (`48px x 48px`) em cartão de identificação da proposta.
  - *Rodapé Institucional do PDF:* Ícone oficial `VICCS_Design_Icon_BWR.svg` (`22px x 22px`) com dados de contato oficiais.
  - *Faixas Tricolores Oficiais:* Faixas decorativas proporcionais de marca (Carmim, Vinho e Gunmetal) posicionadas no topo e na base do documento.
  - *Sem Sobreposição ou Marcas d'Água Invasivas:* Elementos de fundo que geravam ruído ou colisão foram removidos.

### 2. Dados Comerciais & Emissão Padronizados
- **Chave PIX Oficial:** CPF `049.081.945-13`
- **Titularidade:** Paulo Vinicios Oliveira da Silva • VICCS Design
- **Responsável Técnico / Emissor:** Paulo Vinicios O. Silva - VICCS Design
- **E-mail Institucional:** pauloviccsdesign@gmail.com
- **Website / Portfolio:** viccsdesign.vercel.app

### 3. Responsividade Total & Otimização Mobile (iOS, Android, Tablet)
- **Top Navbar:** Fixa com efeito glassmorphism e acesso rápido a Histórico e Carrinho.
- **Barra Flutuante Mobile:** Em telas `< lg`, uma barra inferior fixa mantém o total e o botão de adicionar/visualizar sempre ao alcance do polegar.
- **Mobile Cart Drawer:** Gaveta lateral fluida para gerenciar itens, alterar quantidades e exportar sem rolagem excessiva.
- **Áreas de Toque:** Hit targets com no mínimo 44px de altura/largura.

### 4. Autenticação & Permissões (Supabase Auth)
- Login/Cadastro seguro com e-mail e senha, restrição de acesso até liberação por administrador (`is_admin = true`). Modo preview local para desenvolvimento ágil.

### 5. Motor de Precificação Polimórfica (34 serviços em 11 categorias)
- Módulos específicos para Motion Design (segundos + estilos), Grandes Formatos (m²) e Standard (Gráfica, Web Development, Software SaaS B2B, Social Media, etc.). Piso mínimo de R$ 50,00 respeitado.

### 6. Carrinho Multi-Itens & Exportação Executiva
- Empilhamento de serviços, ajustes com justificativa, persistência local/Supabase e geração de PDF em padrão de papel timbrado de alto padrão com renderização contínua via `html2canvas` + `jsPDF`.

## Estado Atual do Projeto
- **Status Operacional:** Completo, testado em navegador via Chrome DevTools MCP, 100% responsivo e sincronizado com o repositório remoto Git (`https://github.com/pauloviccs/viccs_pricing.git` branch `master`).
- **Validação de Produção:** Renderização do PDF validada com proporção de imagem nítida, zero erros de console e conformidade com os dados comerciais oficiais.

---
*Sincronizado em: 2026-11-23*
