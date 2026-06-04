# Changelog

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
