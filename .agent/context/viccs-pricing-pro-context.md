# VICCS Pricing — Arquivo de Contexto para Agente LLM

> **Propósito deste arquivo:** Fornecer contexto completo do mini-website `index.html` para que um agente LLM possa auxiliar na expansão coesa do sistema de precificação, adicionando novos tipos de serviço e formas de pagamento sem quebrar a arquitetura existente.

---

## 1. Visão Geral do Sistema

**Nome:** VICCS Pricing  
**Tipo:** Ferramenta interna de precificação (single-page app)  
**Stack:**

- React 18 (UMD via CDN — `unpkg.com/react@18`)
- ReactDOM 18 (UMD via CDN)
- Babel Standalone (transpila JSX diretamente no browser)
- Tailwind CSS (via CDN — `cdn.tailwindcss.com`)
- Google Fonts — família `Inter` (400, 500, 600, 700)

**Idioma da interface:** Português Brasileiro (pt-BR)  
**Formato de moeda:** BRL via `Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' })`  
**Owner:** Viccs Design — portfólio em `https://viccsdesign.vercel.app/`

---

## 2. Arquitetura do Componente React

O app inteiro é um único componente funcional chamado `PricingApp`, renderizado via `ReactDOM.createRoot` no elemento `<div id="root">`.

### Hooks utilizados

```js
const { useState, useEffect, useMemo } = React;
```

> `useEffect` está importado mas não é usado no código atual — disponível para expansões futuras (ex.: persistência em `localStorage`).

### Estado interno (`useState`)

| Variável de estado | Valor padrão | Descrição |
|---|---|---|
| `selectedServiceId` | `BASE_SERVICES[0].id` → `'id_visual'` | ID do serviço selecionado |
| `complexity` | `'normal'` | ID do nível de complexidade |
| `deadline` | `'padrao'` | ID do nível de prazo |
| `extraRevisions` | `0` | Quantidade de revisões extras |
| `estimatedHours` | `10` | Horas estimadas (slider, 1–80h) |
| `isCopied` | `false` | Controla feedback visual do botão "Copiar" |

### Constante derivada

```js
const REVISION_COST = 50; // R$ 50,00 por revisão extra
```

---

## 3. Estruturas de Dados Existentes

### 3.1 `BASE_SERVICES` — Array de serviços disponíveis

```js
const BASE_SERVICES = [
  { id: 'id_visual',   name: 'Identidade Visual Completa',       basePrice: 650,  category: 'design',  icon: '🎨' },
  { id: 'logo',        name: 'Logotipo (Individual)',             basePrice: 200,  category: 'design',  icon: '✨' },
  { id: 'post_single', name: 'Post Instagram (Avulso)',           basePrice: 50,   category: 'social',  icon: '📱' },
  { id: 'pack_basic',  name: 'Pacote Mensal Básico',  desc: 'Até 10 posts',        basePrice: 450,  category: 'mensal', icon: '📦' },
  { id: 'pack_inter',  name: 'Pacote Mensal Intermediário', desc: '15 posts + 2 motions', basePrice: 700, category: 'mensal', icon: '🚀' },
  { id: 'pack_adv',    name: 'Pacote Mensal Avançado', desc: '20+ posts, motions, menus, etc.', basePrice: 1000, category: 'mensal', icon: '💎' },
];
```

**Schema de cada item:**

```ts
{
  id: string;          // identificador único, usado como chave React e no estado
  name: string;        // nome exibido na interface
  desc?: string;       // descrição curta opcional (exibida abaixo do nome)
  basePrice: number;   // preço base em BRL (antes dos multiplicadores)
  category: string;    // agrupador ('design' | 'social' | 'mensal' | ...)
  icon: string;        // emoji exibido no card do serviço
}
```

**Categorias existentes:**

- `'design'` — identidade visual, logo
- `'social'` — posts avulsos
- `'mensal'` — pacotes recorrentes

---

### 3.2 `COMPLEXITY_LEVELS` — Níveis de complexidade

```js
const COMPLEXITY_LEVELS = [
  { id: 'simples',       name: 'Simples',         multiplier: 0.9,  desc: 'Layouts básicos, poucas variações' },
  { id: 'normal',        name: 'Normal',           multiplier: 1.0,  desc: 'Padrão do portfólio' },
  { id: 'complexo',      name: 'Complexo',         multiplier: 1.3,  desc: 'Muitos detalhes, ilustrações customizadas' },
  { id: 'muito_complexo',name: 'Muito Complexo',   multiplier: 1.6,  desc: 'Exige pesquisa profunda, 3D ou assets difíceis' },
];
```

**Schema:**

```ts
{ id: string; name: string; multiplier: number; desc: string; }
```

---

### 3.3 `DEADLINE_LEVELS` — Níveis de prazo/urgência

```js
const DEADLINE_LEVELS = [
  { id: 'flexivel', name: 'Flexível',            multiplier: 0.95, desc: 'Sem pressa (15+ dias)' },
  { id: 'padrao',   name: 'Padrão',              multiplier: 1.0,  desc: 'Prazo normal (7-14 dias)' },
  { id: 'urgente',  name: 'Urgente',             multiplier: 1.3,  desc: 'Prioridade (3-6 dias)' },
  { id: 'rush',     name: 'Para Ontem (Rush)',   multiplier: 1.6,  desc: 'Menos de 48h (Fura-fila)' },
];
```

---

## 4. Lógica de Cálculo (`calculationDetails` via `useMemo`)

```js
let base          = selectedService.basePrice;
let complexityAdd = (base * activeComplexity.multiplier) - base;   // pode ser negativo (Simples: -10%)
let deadlineAdd   = (base * activeDeadline.multiplier) - base;     // pode ser negativo (Flexível: -5%)
let revisionsAdd  = extraRevisions * REVISION_COST;                // sempre positivo ou zero

let total         = base + complexityAdd + deadlineAdd + revisionsAdd;
let hourlyRate    = estimatedHours > 0 ? total / estimatedHours : 0;
```

**Fórmula resumida:**

```
Total = basePrice × complexityMultiplier × deadlineMultiplier + (extraRevisions × 50)
```

> ⚠️ Atenção: na implementação atual, `complexityAdd` e `deadlineAdd` são calculados **individualmente sobre `base`** e somados — não são multiplicados em cascata. Isso é um comportamento intencional a preservar para não alterar precificações já comunicadas ao cliente.

**Retorno do `useMemo`:**

```ts
{
  base: number;
  complexityAdd: number;    // pode ser negativo
  deadlineAdd: number;      // pode ser negativo
  revisionsAdd: number;
  total: number;
  hourlyRate: number;
}
```

**Métrica de qualidade da hora:**

- Verde (`bg-green-500/10 text-green-400`) → `hourlyRate > 40`
- Vermelho (`bg-red-500/10 text-red-400`) → `hourlyRate <= 40`

---

## 5. Funcionalidade de Cópia de Proposta (`handleCopyProposal`)

Gera um texto formatado e copia para o clipboard via `document.execCommand('copy')` (compatibilidade ampla, incluindo browsers antigos).

**Template do texto gerado:**

```
Olá! Segue o orçamento para o projeto:

Serviço: {selectedService.name} ({selectedService.desc})
Complexidade: {activeComplexity.name}
Prazo: {activeDeadline.name}
Revisões Extras: {extraRevisions}

Investimento Total: {formatCurrency(total)}

*Valores sujeitos a alteração caso o escopo mude.*
Qualquer dúvida, estou à disposição! 
- Viccs Design (viccsdesign.vercel.app)
```

---

## 6. Layout / Interface (Estrutura JSX)

```
<div> (min-h-screen)
  <div> (max-w-6xl, mx-auto)
    <header>               → Título "VICCS Pricing" + link portfólio
    <div> (grid 12 colunas)
      <!-- col-span-8: controles -->
      <section>            → Seção 1: Serviço Base (grid de cards)
      <div> (grid 2 col)
        <section>          → Seção 2: Nível de Complexidade (radio buttons)
        <section> (espaço)
          <div>            → Seção 3: Prazo/Urgência (radio buttons)
          <div>            → Seção 4: Ajustes Finos (revisões + slider de horas)
      <!-- col-span-4: resultado sticky -->
      <div> (sticky top-8) → Resumo do Orçamento
        breakdown de itens
        Preço Final (texto grande)
        Métrica $/hora
        Botão "Copiar Resumo p/ Cliente"
```

### Paleta de cores (Tailwind classes chave)

| Elemento | Classes |
|---|---|
| Background geral | `bg-slate-950` |
| Cards/seções | `bg-slate-900`, `border-slate-800` |
| Serviço selecionado | `bg-purple-900/20 border-purple-500` |
| Complexidade selecionada | `bg-blue-900/20 border-blue-500` |
| Prazo selecionado | `bg-orange-900/20 border-orange-500` |
| Texto principal | `text-slate-200`, `text-white` |
| Texto secundário | `text-slate-400` |
| Preço base dos cards | `text-purple-400` |
| Valor positivo no breakdown | `text-red-400` |
| Desconto no breakdown | `text-green-400` |
| Botão de cópia normal | `bg-purple-600 hover:bg-purple-500` |
| Botão de cópia confirmado | `bg-green-600 hover:bg-green-500` |

---

## 7. Novos Serviços Planejados para Inclusão

A seguir, os novos tipos de serviço que devem ser adicionados ao array `BASE_SERVICES` e/ou tratados com lógica customizada:

### 7.1 Estampas de Camisa

- **Natureza:** Serviço de arte para impressão em vestuário
- **Precificação sugerida:** por arte/arquivo entregue (não por peça)
- **Possível categoria:** `'print'`
- **Considerações:** pode precisar de campo extra para quantidade de cores ou tipo de impressão (serigrafia, sublimação, DTF)
- **Exemplos de itens:**
  - Arte para estampa (avulsa)
  - Pacote de artes para coleção (ex.: 5 estampas)

### 7.2 Artes por Metro (Banners, Faixas, Lonas)

- **Natureza:** Design proporcional à dimensão física do material
- **Precificação sugerida:** basePrice por metro linear ou por m²
- **Possível categoria:** `'impressao'`
- **Lógica customizada necessária:** campo de input para `largura` × `altura` em metros, com cálculo `área × preçoPorM²`
- **Isso requer um desvio da lógica atual** (que usa `basePrice` fixo) — ver seção 9 para orientação de implementação

### 7.3 Manutenção / Edição de Menu Boards

- **Natureza:** Atualização de peças já criadas anteriormente (menu de lanchonete, restaurante, etc.)
- **Precificação sugerida:** valor fixo por sessão de manutenção, ou por quantidade de itens alterados
- **Possível categoria:** `'manutencao'`
- **Exemplos de itens:**
  - Manutenção de Menu Board (até 5 alterações)
  - Manutenção de Menu Board (até 15 alterações)
  - Redesign parcial de Menu Board

### 7.4 Outros Serviços de Manutenção

- Posts já criados que precisam de atualização de data/info
- Reenvio de arquivos em formato diferente
- Adaptação de peça para outro formato/rede social

---

## 8. Formas de Pagamento — Expansão Planejada

Atualmente, o sistema **não tem nenhum módulo de forma de pagamento**. A expansão deve incluir uma nova seção na interface que permita informar ao cliente como o pagamento será estruturado.

### Formas sugeridas a incluir

| ID sugerido | Nome | Comportamento no preço |
|---|---|---|
| `pix_avista` | PIX / À Vista | sem acréscimo (multiplicador 1.0) |
| `pix_50_50` | PIX — 50% entrada + 50% entrega | sem acréscimo |
| `cartao_1x` | Cartão de Crédito (1x) | acréscimo de ~3–5% (configurável) |
| `cartao_parcelado` | Cartão Parcelado (2–12x) | acréscimo configurável + exibir valor da parcela |
| `boleto` | Boleto Bancário | pode ter desconto ou sem acréscimo |
| `permuta` | Permuta / Escambo | campo de texto descritivo livre |

### Nova variável de estado necessária

```js
const [paymentMethod, setPaymentMethod] = useState('pix_avista');
const [installments, setInstallments] = useState(1); // só ativo para cartão parcelado
```

### Novo array de dados

```js
const PAYMENT_METHODS = [
  { id: 'pix_avista',      name: 'PIX / À Vista',         fee: 0,    icon: '⚡' },
  { id: 'pix_50_50',       name: 'PIX 50% + 50%',         fee: 0,    icon: '🤝' },
  { id: 'cartao_1x',       name: 'Cartão 1x',             fee: 0.04, icon: '💳' }, // +4%
  { id: 'cartao_parcelado',name: 'Cartão Parcelado',       fee: 0.06, icon: '💳' }, // +6% + lógica de parcelas
  { id: 'boleto',          name: 'Boleto',                fee: 0,    icon: '🧾' },
];
```

### Impacto no cálculo

```js
// Adicionar ao calculationDetails:
let paymentFee = total * activePayment.fee;
let grandTotal = total + paymentFee;
let installmentValue = installments > 1 ? grandTotal / installments : grandTotal;
```

---

## 9. Orientações Técnicas para Expansão Segura

### 9.1 Adicionando novos serviços ao `BASE_SERVICES`

Simplesmente adicionar um novo objeto ao array respeitando o schema:

```js
{ id: 'stamp_art',    name: 'Arte para Estampa (Avulso)', basePrice: 80,  category: 'print',     icon: '👕' },
{ id: 'banner_m2',    name: 'Banner / Lona (por m²)',     basePrice: 120, category: 'impressao', icon: '🖼️' },
{ id: 'menu_manut5',  name: 'Manutenção Menu Board (5 alt.)', basePrice: 80, category: 'manutencao', icon: '🍽️' },
```

Isso é **não-destrutivo** — a UI de grid de cards renderiza qualquer item no array automaticamente.

### 9.2 Filtragem por categoria (nova feature recomendada)

Para evitar que a seção "1. Serviço Base" fique longa demais com muitos serviços, adicionar tabs/filtros por categoria:

```js
const [activeCategory, setActiveCategory] = useState('all');
const filteredServices = activeCategory === 'all'
  ? BASE_SERVICES
  : BASE_SERVICES.filter(s => s.category === activeCategory);
```

### 9.3 Serviços com lógica de preço não-padrão (ex.: por m²)

Para serviços como "Arte por Metro", o `basePrice` deve ser o **preço por unidade** (ex.: R$120/m²), e um campo extra de dimensão deve multiplicar esse valor antes de entrar no pipeline de cálculo:

```js
// Novo estado:
const [dimensionM2, setDimensionM2] = useState(1);

// Modificar o início do calculationDetails:
const isAreaBased = selectedService.category === 'impressao';
let base = isAreaBased
  ? selectedService.basePrice * dimensionM2
  : selectedService.basePrice;
```

O restante da lógica de `complexityAdd`, `deadlineAdd`, etc. continua **intacta**.

### 9.4 Seção nova de Forma de Pagamento

Adicionar como **Seção 5** no grid de controles (col-span-8), antes do painel sticky de resumo. Seguir o padrão visual das outras seções:

- Wrapper: `<section className="bg-slate-900 rounded-2xl p-6 border border-slate-800 shadow-xl">`
- Título: `<h2 className="text-xl font-semibold mb-4 text-white">5. Forma de Pagamento</h2>`
- Itens: botões/radio seguindo a mesma estrutura de `COMPLEXITY_LEVELS`

### 9.5 Atualizar o texto do `handleCopyProposal`

Incluir a forma de pagamento e, se parcelado, o valor da parcela:

```js
const text = `...
Forma de Pagamento: ${activePayment.name}${installments > 1 ? ` — ${installments}x de ${formatCurrency(installmentValue)}` : ''}
...`;
```

### 9.6 Atualizar o painel de Resumo (col-span-4)

Adicionar no breakdown:

```jsx
{calculationDetails.paymentFee > 0 && (
  <div className="flex justify-between items-center text-sm">
    <div className="text-slate-400">Taxa ({activePayment.name})</div>
    <div className="text-red-400">+{formatCurrency(calculationDetails.paymentFee)}</div>
  </div>
)}
```

---

## 10. Pontos de Atenção / Riscos

| Risco | Mitigação |
|---|---|
| Muitos serviços → UI poluída | Implementar filtro por `category` (ver 9.2) |
| Serviços de manutenção têm escopo ambíguo | Adicionar campo de texto livre `observacoes` no estado, exibido na proposta copiada |
| Babel Standalone em produção é lento | Para uso pessoal/interno, aceitável. Se distribuir, considerar build Vite |
| `document.execCommand('copy')` depreciado | Funciona em todos os browsers atuais; substituir por `navigator.clipboard.writeText()` com fallback se necessário |
| Sem persistência entre sessões | `useEffect` + `localStorage` pode salvar o último estado; não implementado ainda |

---

## 11. Checklist de Implementação Sugerida

- [ ] Adicionar novos serviços ao `BASE_SERVICES` (estampas, artes por metro, manutenção menu boards)
- [ ] Adicionar campo de `category` display + filtro de tabs na Seção 1
- [ ] Criar array `PAYMENT_METHODS` e estado `paymentMethod`
- [ ] Adicionar Seção 5 — Forma de Pagamento na interface
- [ ] Adaptar `calculationDetails` para incluir `paymentFee` e `grandTotal`
- [ ] Adaptar painel de Resumo para exibir taxa de pagamento e valor de parcela
- [ ] Adaptar `handleCopyProposal` para incluir forma de pagamento
- [ ] (Opcional) Adicionar lógica de campo de dimensão para serviços por m²
- [ ] (Opcional) Adicionar campo `observacoes` de texto livre
- [ ] (Opcional) Persistência via `localStorage` + `useEffect`

---

## 12. Referências Rápidas

- **Portfólio:** <https://viccsdesign.vercel.app/>
- **React 18 UMD:** `https://unpkg.com/react@18/umd/react.production.min.js`
- **Tailwind CDN:** `https://cdn.tailwindcss.com`
- **Babel Standalone:** `https://unpkg.com/@babel/standalone/babel.min.js`
- **Script type:** `<script type="text/babel">` — necessário para o Babel processar o JSX

---

*Arquivo gerado automaticamente por análise profunda do `index.html` — VICCS Pricing.*  
*Use este contexto para guiar qualquer expansão do sistema de precificação.*
