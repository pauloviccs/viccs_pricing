# Code Style Guidelines — VICCS Pricing Pro

## 1. Princípios da Arquitetura Single-File (SFA)

O projeto é mantido intencionalmente no arquivo `index.html` com React 18 e Babel Standalone para velocidade de iteração e distribuição sem dependência de build steps complexos.

### Regras Fundamentais:
1. **Sem Dependências Node no Runtime:** Não use `import`/`export` dentro do bloco Babel de `index.html`. Desestruture de objetos globais expostos por scripts UMD (ex: `const { useState, useEffect, useMemo, useRef } = React;`).
2. **Componentes Funcionais & Hooks:** Utilize exclusivamente componentes funcionais e hooks nativos. Não introduza classes React.
3. **Imutabilidade de Estado:** Estados complexos (como o array `cart`) devem ser sempre atualizados por meio de novas referências (`[...prev, newItem]` ou `.map()` / `.filter()`).
4. **Resiliência e Fallbacks:** Toda interação assíncrona (como chamadas ao cliente do Supabase ou à API de Clipboard) DEVE conter tratamento de erro com `try/catch` e fallback (ex: fallback para `localStorage` e `<textarea>` legado para cópia).

---

## 2. Nomenclatura e Convenções

- **Constantes Globais de Negócio:** `UPPER_SNAKE_CASE` (ex: `BASE_SERVICES`, `MOTION_STYLES`, `COMPLEXITY_LEVELS`, `PAYMENT_METHODS`).
- **Manipuladores de Eventos:** Prefixados com `handle` (ex: `handleAddToCart`, `handleAuth`, `handleSaveProposal`, `handleCopyProposal`).
- **Formatadores Utilitários:** Prefixados com `format` (ex: `formatCurrency(val)`).
- **Hooks de Estado:** Padrão `[value, setValue] = useState(...)`.

---

## 3. Padrões de Estilização (Tailwind CSS)

- **Cores de Superfície:** Use as extensões configuradas em `tailwind.config`:
  - `bg-surface-base` (`#070709`) para o background root.
  - `bg-surface-card` com `backdrop-blur-2xl` para cartões e modais.
  - `border-surface-border` para divisores sutis e `border-surface-borderHighlight` para topos iluminados.
- **Acentos e Glows:**
  - Botões primários: gradientes roxos (`from-purple-600 to-indigo-600`) ou rosa/magenta para autenticação.
  - Sombras luminosas: `shadow-glow-purple`, `shadow-glow-pink`, `shadow-glass`.
- **Iconografia:** Utilize o componente helper `Icon` com nomes compatíveis (ex: `<Icon name="check" className="w-4 h-4 text-emerald-400" />`). Proibido o uso de emojis em labels de interface.

---

## 4. Persistência e Chaves de Cache

- Todas as chaves salvas no `localStorage` devem utilizar o namespace oficial:
  - `viccs_pro_cart`: Array de itens do orçamento atual.
  - `viccs_pro_client`: Nome do cliente em edição.
  - `viccs_pro_contact`: Contato do cliente.
  - `viccs_pro_obs`: Observações adicionais.
  - `viccs_dev_bypass`: Flag booleana para bypass de autenticação em ambiente de testes.

