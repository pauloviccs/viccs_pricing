# Project Overview

## Project Name
VICCS Pricing

## Description
Ferramenta interna de precificação para a **Viccs Design**. Uma calculadora interativa de orçamentos com seleção de serviços (16 serviços em 6 categorias), suporte para dimensões de impressão personalizadas (metros, centímetros, milímetros), ajustes de complexidade/urgência, formas de pagamento simplificadas com cálculo automático de taxas e parcelas, campo de observações, sistema de desconto manual em reais, barra flutuante fixa para mobile, inclusão de chave PIX nos orçamentos, persistência via localStorage, e exportação do orçamento completo em PDF.

## Tech Stack
- Languages: HTML5, JavaScript (ES6+, JSX)
- Frameworks: React 18 (via CDN), ReactDOM 18 (via CDN)
- Tools: Babel Standalone (in-browser transpilation via CDN), Tailwind CSS v3 (via CDN), html2canvas (via CDN), jsPDF (via CDN)
- Services: localStorage (Web Storage API) para persistência local, Google Fonts (Inter)

## Folder Structure
```text
viccs-pricing/
├── .agent/
│   ├── context/
│   │   ├── architecture.md
│   │   ├── database_schema.md
│   │   ├── stack.md
│   │   └── viccs-pricing-pro-context.md
│   ├── guidelines/
│   │   ├── code_style.md
│   │   └── ui_ux.md
│   ├── memory/
│   │   ├── active_task.md
│   │   ├── changelog.md
│   │   ├── implementation_plan.md
│   │   └── todos.md
│   ├── overview/
│   │   └── PROJECT_STATUS.md
│   ├── workflows/
│   └── media/
│       ├── favicon/
│       │   ├── apple-touch-icon.png
│       │   ├── favicon-16x16.png
│       │   ├── favicon-32x32.png
│       │   ├── favicon.ico
│       │   └── site.webmanifest
│       ├── png/
│       │   └── 2x/
│       │       └── viccs_logo_black@2x.png
│       └── svg/
│           ├── viccs_logo_black.svg
│           └── viccs_logo_white.svg
├── .agents/
│   └── skills/
│       ├── supabase/
│       └── supabase-postgres-best-practices/
├── base64_png.txt
├── base64_svg_white.txt
├── index.html                  ← Aplicação inteira (~780 linhas)
├── skills-lock.json
└── update_index.js
```

## Arquitetura

### Single-File App
Todo o código principal do cliente vive e executa no arquivo `index.html`. A aplicação importa suas dependências (React, ReactDOM, Babel, Tailwind CSS, html2canvas, jsPDF) diretamente de CDNs confiáveis.

### Componente Principal: `PricingApp`
- **State Management:** Controle de estados locais usando `useState` e persistência reativa no `localStorage` por meio de `useEffect` (com prefixo `viccs_`).
- **Cálculos Inteligentes:** `useMemo` é utilizado para computar as fórmulas de preços de forma eficiente, evitando renderizações desnecessárias.

### Dados de Configuração
| Constante | Itens | Descrição |
|---|---|---|
| `BASE_SERVICES` | 16 serviços | id, name, desc?, basePrice, category, icon |
| `COMPLEXITY_LEVELS` | 4 níveis | Multiplicadores de 0.9x a 1.6x |
| `DEADLINE_LEVELS` | 4 níveis | Multiplicadores de 0.95x a 1.6x |
| `PAYMENT_METHODS` | 4 métodos | PIX À Vista, PIX 50% + 50%, Cartão 1x (+4%), Cartão Parcelado (+6%) |
| `CATEGORY_LABELS` | 7 categorias | Todos, Design, Social, Pacotes, Estampas, Impressão, Manutenção |
| `REVISION_COST` | R$50 | Preço cobrado por cada revisão extra solicitada |

### Categorias de Serviço
| Categoria | Serviços |
|---|---|
| `design` | Identidade Visual Completa (R$650), Logotipo (R$200) |
| `social` | Post Instagram Avulso (R$50) |
| `mensal` | Pacote Básico (R$450), Intermediário (R$700), Avançado (R$1000) |
| `print` | Arte para Estampa (R$80), Pacote Estampas (R$350) |
| `impressao` | Banner/m² (R$120), Faixa/m (R$90), Plotagem (R$100) — com entrada por m² ou medida exata (m, cm, mm) |
| `manutencao` | Manutenções de Menu Board (R$80/R$150/R$250), Atualização de Post (R$30), Adaptação de Formato (R$40) |

### Lógica de Cálculo
```text
basePriceArea = basePrice × áreaCalculada (apenas para serviços de impressão)
subtotal = base + complexityAdd + deadlineAdd + revisionsAdd
grandTotal = subtotal + (subtotal × paymentFee)
finalTotal = grandTotal - min(discountBRL, grandTotal)
installmentValue = finalTotal / installments
hourlyRate = finalTotal / estimatedHours
```

## Features Implementadas
- ✅ **16 Serviços em 6 Categorias:** Atualizados e segmentados com tags de fácil visualização.
- ✅ **Filtro de Categoria por Tabs:** Transição suave entre serviços no painel de seleção.
- ✅ **Badge Visual nos Cards:** Facilita a identificação rápida da categoria do serviço.
- ✅ **Cálculo de Área Avançado:** Permite calcular áreas de impressão por slider de m² ou inserção de valores exatos com seletores de unidade (metros, centímetros, milímetros).
- ✅ **Ajustes de Complexidade, Urgência e Revisões:** Customização total do escopo com cálculo automático em tempo real.
- ✅ **Formas de Pagamento Simplificadas:** Reduzidas para 4 opções focadas (PIX À Vista, PIX 50/50, Cartão 1x e Cartão Parcelado), removendo Boleto e Permuta.
- ✅ **Desconto Manual em Reais:** Input para aplicação de descontos na seção de Ajustes Finos, propagando-se em todo o aplicativo (cálculo de parcelas, métrica de hora, resumo, cópia de texto e PDF).
- ✅ **Experiência Mobile Otimizada:** Barra flutuante inferior fixa em dispositivos móveis (< lg) exibindo valor total, parcelas e atalhos rápidos para Copiar Resumo e gerar PDF.
- ✅ **Integração de PIX Automática:** Adiciona automaticamente os dados de Chave PIX (Aleatória) e Titular tanto no texto de cópia rápida para o cliente quanto na proposta exportada em PDF.
- ✅ **Exportação Premium para PDF:** Utilização de `html2canvas` + `jsPDF` renderizando a logo original no documento através de um template estruturado e estilizado.
- ✅ **Botão de Limpeza Completa (Reset):** Reinicia todos os estados da tela e limpa o `localStorage` com confirmação do usuário.
- ✅ **Favicons Universais:** Suporte a ícones de compatibilidade para múltiplos dispositivos salvos na pasta de mídias.
- ✅ **Estética Dark Mode Premium:** UI moderna com degradês, glassmorphism, sombras neon e foco nos contrastes e áreas de clique.

## Known TODOs / Próximos Passos
- ⚠️ CDNs sem versão travada (possível quebra futura caso as CDNs sofram alterações).
- ⚠️ Sem histórico local de propostas geradas (salva apenas o estado ativo do formulário).
- ⚠️ Sem mecanismo de autenticação (acesso aberto local).

---
*Última atualização: 2026-06-25*
