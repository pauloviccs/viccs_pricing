# Plano de Implementação — Expansão VICCS Pricing

## Fases de Execução

### Fase 1: Dados e Constants

- Novos serviços no `BASE_SERVICES`
- Novo array `PAYMENT_METHODS`
- Novo array `CATEGORY_LABELS`

### Fase 2: Estado e Lógica

- Novos `useState`: paymentMethod, installments, activeCategory, dimensionM2, observacoes
- Adaptar `calculationDetails` com paymentFee, grandTotal, installmentValue
- localStorage persistence via useEffect
- Migrar clipboard API

### Fase 3: UI - Seção de Serviços com Filtros

- Tabs de categoria na Seção 1
- Campo condicional de dimensão (m²)

### Fase 4: UI - Seção Pagamento + Observações

- Seção 5 Forma de Pagamento
- Slider de parcelas condicional
- Campo observações

### Fase 5: UI - Painel Resumo Atualizado

- Taxa de pagamento no breakdown
- Grand Total com parcelas
- Proposta de cópia atualizada

## Status: Em execução
