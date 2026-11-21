# Tech Stack — VICCS Pricing Pro

Esta página detalha a pilha completa de tecnologia utilizada na plataforma, incluindo bibliotecas de interface, utilitários visuais e serviços em nuvem.

## Stack Principal

| Tecnologia | Função | Versão / Origem | Descrição |
|---|---|---|---|
| **HTML5** | Estruturação e Container | Nativo | Ponto de montagem da aplicação (`#root`) e metadados responsivos. |
| **JavaScript (ES6+)** | Lógica de Negócio e Estado | Nativo | Programação funcional, manipulação de arrays/objetos e chamadas assíncronas. |
| **React 18** | Camada Reativa e Componentes | CDN (`unpkg.com/react@18`) | Componentes funcionais, hooks (`useState`, `useEffect`, `useMemo`, `useRef`). |
| **ReactDOM 18** | Renderizador DOM | CDN (`unpkg.com/react-dom@18`) | Renderização dos elementos visuais no DOM do navegador. |
| **Babel Standalone** | Transpilador JSX Client-Side | CDN (`unpkg.com/@babel/standalone@7.26.2`) | Converte código JSX e ES6+ moderno em tempo real diretamente no navegador. |
| **Tailwind CSS v3** | Design System Utility-First | CDN (`cdn.tailwindcss.com`) | Estilização reativa, classes de vidro fosco, sombras neon e dark theme profundo. |
| **Supabase JS Client v2** | SDK de Nuvem (Auth & Database) | CDN (`cdn.jsdelivr.net/.../supabase.min.js`) | Gerenciamento de sessões de usuário, autorização e persistência relacional. |
| **html2canvas v1.4.1** | Captura de Interface para Imagem | CDN (`cdnjs.cloudflare.com/.../html2canvas.min.js`) | Renderiza os nós do DOM da proposta em canvas de alta resolução para PDF. |
| **jsPDF v2.5.1** | Compilador de Documentos PDF | CDN (`cdnjs.cloudflare.com/.../jspdf.umd.min.js`) | Gera o arquivo PDF multipágina A4 com formatação contínua e download direto. |
| **Google Fonts** | Tipografia Oficial | `fonts.googleapis.com` | Família tipográfica **Inter** (pesos 400, 500, 600, 700). |
| **localStorage API** | Armazenamento e Cache Offline | Nativo | Garante tolerância a falhas na internet, preservando carrinho e dados digitados. |

---

## Dependências e Endpoints de CDN

```html
<!-- Tailwind CSS v3 -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Supabase JS Client v2 -->
<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js"></script>

<!-- Exportação em PDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!-- React 18, ReactDOM 18 & Babel Standalone -->
<script src="https://unpkg.com/react@18/umd/react.production.min.js" crossorigin></script>
<script src="https://unpkg.com/react-dom@18/umd/react-dom.production.min.js" crossorigin></script>
<script src="https://unpkg.com/@babel/standalone@7.26.2/babel.min.js"></script>
```
