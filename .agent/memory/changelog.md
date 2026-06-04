# Changelog

## 2026-06-04 — Ajustes V2: Pagamento, Desconto e Responsividade

### Remoções
- Removido Boleto (🧾) das formas de pagamento
- Removido Permuta / Escambo (🔄) das formas de pagamento e bloco condicional de textarea
- PAYMENT_METHODS reduzido de 6 para 4 opções

### Novas Features
- **Desconto Manual (R$):** Input numérico na seção "Ajustes Finos" que subtrai valor do total final
  - Persistido no localStorage (`viccs_discount`)
  - Integrado no cálculo (`calculationDetails.discount` + `finalTotal`)
  - Aparece no Resumo lateral, texto de cópia (WhatsApp) e PDF exportado
  - Validação: desconto não pode exceder o grandTotal
- **Barra Flutuante Mobile:** Fixa no rodapé em telas < lg (1024px)
  - Mostra preço final, parcelas (se aplicável), botão Copiar e botão PDF
  - `backdrop-blur-md` com estética premium

### Responsividade
- Container principal: `pb-28 lg:pb-8` (espaço para barra flutuante)
- Header: texto adaptivo (`hidden sm:inline` / `sm:hidden`)
- Botões header: `text-xs sm:text-sm`, `px-3 sm:px-4`, `gap-1 sm:gap-2`
- Preço final: `text-2xl sm:text-4xl md:text-5xl`

### Melhorias Técnicas
- `calculationDetails` retorna: `discount`, `finalTotal` (além do `grandTotal` preservado)
- Fórmula: `finalTotal = grandTotal - min(discountBRL, grandTotal)`
- Parcelas e hora/valor agora calculados sobre `finalTotal`

## 2026-06-04 — Expansão Completa do Sistema de Precificação

### Novos Serviços (9 adicionados)
- Arte para Estampa (Avulso) — R$80, categoria 'print'
- Pacote Estampas (5 artes) — R$350, categoria 'print'
- Banner / Lona (por m²) — R$120/m², categoria 'impressao'
- Faixa (por metro linear) — R$90/m², categoria 'impressao'
- Manutenção Menu Board (até 5 alt.) — R$80, categoria 'manutencao'
- Manutenção Menu Board (até 15 alt.) — R$150, categoria 'manutencao'
- Redesign Parcial Menu Board — R$250, categoria 'manutencao'
- Atualização de Post Existente — R$30, categoria 'manutencao'
- Adaptação de Formato — R$40, categoria 'manutencao'

### Novas Features
- Filtro por categoria (tabs: Todos, Design, Social, Pacotes, Estampas, Impressão, Manutenção)
- Badge de categoria nos cards de serviço
- Sistema de formas de pagamento (PIX, Cartão 1x/Parcelado, Boleto, Permuta)
- Taxas de pagamento no cálculo (+4% cartão 1x, +6% parcelado)
- Slider de parcelas (2x–12x) condicional
- Campo de dimensão m² para serviços de impressão
- Campo de observações (texto livre)
- Persistência completa via localStorage
- Clipboard API moderna com fallback

### Melhorias Técnicas
- Migrado `document.execCommand('copy')` → `navigator.clipboard.writeText()` com fallback
- `calculationDetails` agora retorna: base, complexityAdd, deadlineAdd, revisionsAdd, subtotal, paymentFee, grandTotal, installmentValue, hourlyRate
- Proposta de cópia inclui forma de pagamento, dimensão e observações
