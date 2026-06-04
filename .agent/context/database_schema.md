# Persistência de Dados (localStorage)

O **VICCS Pricing** é uma ferramenta puramente cliente-side. Ele não possui um banco de dados relacional (SQL) ou não-relacional hospedado em servidor. Toda a persistência é feita via **Web Storage API (localStorage)**.

## Chaves de Persistência

Todas as chaves salvas no localStorage possuem o prefixo `viccs_` para evitar colisões com outros aplicativos rodando na mesma origem.

| Chave | Tipo | Valor Padrão | Descrição |
|---|---|---|---|
| `viccs_serviceId` | `string` | `"id_visual"` | Identificador único do serviço selecionado. Corresponde a um `id` em `BASE_SERVICES`. |
| `viccs_complexity` | `string` | `"normal"` | Nível de complexidade selecionado. Corresponde a um `id` em `COMPLEXITY_LEVELS`. |
| `viccs_deadline` | `string` | `"padrao"` | Nível de urgência/prazo. Corresponde a um `id` em `DEADLINE_LEVELS`. |
| `viccs_revisions` | `number` | `0` | Quantidade de revisões adicionais contratadas. |
| `viccs_hours` | `number` | `10` | Quantidade estimada de horas de dedicação ao projeto (para cálculo de valor/hora). |
| `viccs_payment` | `string` | `"pix_avista"` | Forma de pagamento selecionada. Corresponde a um `id` em `PAYMENT_METHODS`. |
| `viccs_installments` | `number` | `1` | Número de parcelas. Válido principalmente quando `payment` é `"cartao_parcelado"`. |
| `viccs_dimension` | `number` | `1` | Área ou dimensão em m² para serviços da categoria `impressao`. |
| `viccs_obs` | `string` | `""` | Texto livre contendo anotações gerais ou descrições especiais (como detalhes da permuta). |

## Ciclo de Vida da Persistência

### Leitura (Load)
No carregamento da aplicação, o estado do React é inicializado lendo do `localStorage` com um bloco `try/catch` para segurança contra cookies desativados ou quota excedida:
```javascript
const loadState = (key, fallback) => {
  try {
    const v = localStorage.getItem('viccs_' + key);
    return v !== null ? JSON.parse(v) : fallback;
  } catch {
    return fallback;
  }
};
```

### Escrita (Save)
Um hook `useEffect` reativo escuta todas as mudanças nos estados configurados e atualiza o `localStorage` atomicamente:
```javascript
useEffect(() => {
  const data = {
    serviceId: selectedServiceId,
    complexity,
    deadline,
    revisions: extraRevisions,
    hours: estimatedHours,
    payment: paymentMethod,
    installments,
    dimension: dimensionM2,
    obs: observacoes
  };
  
  Object.entries(data).forEach(([k, v]) => {
    try {
      localStorage.setItem('viccs_' + k, JSON.stringify(v));
    } catch (e) {
      console.error("Erro ao salvar no localStorage", e);
    }
  });
}, [selectedServiceId, complexity, deadline, extraRevisions, estimatedHours, paymentMethod, installments, dimensionM2, observacoes]);
```
