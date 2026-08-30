# Project Overview

## Project Name
VICCS Pricing

## Description
Ferramenta interna de precificação da **Viccs Design**. Uma aplicação interativa single-page para cálculo e geração de orçamentos em tempo real. Possui catálogo com 16 serviços divididos em 6 categorias, suporte a cálculo de medidas personalizadas para impressão (m², cm, mm), multiplicadores de complexidade e prazo de entrega, taxas de formas de pagamento (PIX e Cartão), desconto manual em reais, observações personalizadas, persistência reativa no `localStorage`, barra flutuante otimizada para mobile e exportação profissional da proposta em PDF com paginação contínua e inclusão de dados para pagamento via PIX.

## Tech Stack
- Languages: HTML5, JavaScript (ES6+, JSX)
- Frameworks: React 18 (via CDN), ReactDOM 18 (via CDN)
- Tools: Babel Standalone v7 (via CDN), Tailwind CSS v3 (via CDN), html2canvas v1.4.1 (via CDN), jsPDF v2.5.1 (via CDN)
- Services: localStorage (Web Storage API), Google Fonts (Inter)

## Folder Structure
```text
viccs-pricing/
├── .agent/
│   ├── backup/
│   │   ├── index_backup.html
│   │   └── update_index.js
│   ├── context/
│   │   ├── architecture.md
│   │   ├── database_schema.md
│   │   ├── stack.md
│   │   └── viccs-pricing-pro-context.md
│   ├── guidelines/
│   │   ├── code_style.md
│   │   └── ui_ux.md
│   ├── media/
│   │   ├── favicon/
│   │   │   ├── apple-touch-icon.png
│   │   │   ├── favicon-16x16.png
│   │   │   ├── favicon-32x32.png
│   │   │   ├── favicon.ico
│   │   │   └── site.webmanifest
│   │   ├── pdf/
│   │   │   ├── Proposta_Identidade_Visual_Completa (2).pdf
│   │   │   └── Proposta_Identidade_Visual_Completa.pdf
│   │   ├── png/
│   │   │   └── 2x/
│   │   │       └── viccs_logo_black@2x.png
│   │   └── svg/
│   │       ├── viccs_logo_black.svg
│   │       └── viccs_logo_white.svg
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
│       ├── supabase/
│       └── supabase-postgres-best-practices/
├── base64_png.txt
├── base64_svg_white.txt
├── index.html
├── skills-lock.json
└── update_index.js
```

## Arquitetura & Implementação

### Single-File Application
O núcleo da aplicação reside em `index.html`, executando React e JSX transpilados no cliente via Babel Standalone, eliminando necessidade de build steps complexos para uso direto no navegador.

### Componente Central: `PricingApp`
- **Gerenciamento de Estado:** Hooks `useState` associados a sincronização em tempo real com `localStorage` via `useEffect` (chaves prefixadas com `viccs_`).
- **Pipeline de Cálculo Reativo (`useMemo`):**
  1. `basePriceArea`: cálculo condicional para mídias de impressão com base na área computada.
  2. `subtotal = base + complexityAdd + deadlineAdd + revisionsAdd`
  3. `grandTotal = subtotal + (subtotal × paymentFee)`
  4. `finalTotal = grandTotal - min(discountBRL, grandTotal)`
  5. `installmentValue = finalTotal / installments`
  6. `hourlyRate = finalTotal / estimatedHours`

### Tabelas de Domínio
| Configuração | Total | Detalhes |
|---|---|---|
| `BASE_SERVICES` | 16 itens | `design`, `social`, `mensal`, `print`, `impressao`, `manutencao` |
| `COMPLEXITY_LEVELS` | 4 níveis | Simples (0.9x), Normal (1.0x), Complexo (1.3x), Muito Complexo (1.6x) |
| `DEADLINE_LEVELS` | 4 níveis | Flexível (0.95x), Padrão (1.0x), Urgente (1.3x), Rush 48h (1.6x) |
| `PAYMENT_METHODS` | 4 opções | PIX À Vista (0%), PIX 50%+50% (0%), Cartão 1x (+4%), Cartão Parcelado (+6%) |
| `CATEGORY_LABELS` | 7 filtros | Todos, Design, Social, Pacotes, Estampas, Impressão, Manutenção |
| `REVISION_COST` | R$ 50,00 | Custo fixo unitário por rodada adicional de alteração |

## Features Implementadas
- ✅ **Catálogo Completo de Serviços (16 itens):** Categorizados e segmentados com ícones e descrições.
- ✅ **Filtro de Categoria em Tabs:** Navegação fluida entre os nichos de serviço.
- ✅ **Badges Visuais nos Cards:** Identificação imediata da categoria do serviço.
- ✅ **Calculadora de Impressão e Área:** Slider rápido de m² e entrada manual de medidas com conversão de unidades (m, cm, mm).
- ✅ **Ajustes de Complexidade, Urgência e Revisões:** Customização de escopo e recalculo em tempo real.
- ✅ **Formas de Pagamento Otimizadas:** Opções focadas com cálculo automatizado de taxas e número de parcelas configurável (2x a 12x).
- ✅ **Desconto Manual em Reais:** Input na seção de Ajustes Finos que propaga o abatimento para todos os totais, parcelas, resumo e PDF.
- ✅ **Barra Flutuante Fixa para Mobile:** Acesso rápido ao valor final, parcelamento, cópia de resumo e geração de PDF em telas menores.
- ✅ **Automação de Dados PIX:** Inserção automática de chave e titular na proposta de texto (WhatsApp) e no PDF.
- ✅ **Exportação em PDF com Offset Multipágina:** Geração visual da proposta via `html2canvas` e `jsPDF` sem quebra indesejada de blocos.
- ✅ **Persistência Completa Local:** Restauração do último orçamento editado via `localStorage`.
- ✅ **Botão de Limpeza / Reset Geral:** Limpa todos os campos e o cache local mediante confirmação.
- ✅ **Identidade Visual e Dark Theme:** UI em tons escuros slate/roxo com glassmorphism e tipografia Inter.

## Estado Atual do Projeto & Work in Progress
- **Status Operacional:** Estável e pronto para uso interno diário.
- **Skills Locais Instaladas:** Plugins de Supabase adicionados em `.agents/skills/` para futura expansão de banco de dados e autenticação.

## Known TODOs / Próximos Passos
- ⚠️ **Versionamento e Build Local:** Avaliar migração futura para Vite/React com dependências npm travadas caso o escopo aumente.
- ⚠️ **Histórico de Propostas:** Implementar persistência de múltiplos orçamentos salvos (histórico/CRUD).
- ⚠️ **Camada de Backend / Cloud:** Integrar Supabase (banco e auth) para sincronização multi-dispositivo da equipe.

---
*Sincronizado em: 2026-08-30*
