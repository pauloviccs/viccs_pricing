# Tech Stack — VICCS Pricing

Esta página detalha a pilha de tecnologia utilizada no projeto, bem como suas dependências externas via CDN.

## Stack Principal

| Tecnologia | Função | Versão / Origem | Descrição |
|---|---|---|---|
| **HTML5** | Estruturação básica do documento | Nativo do Navegador | Elementos estruturais e ponto de montagem do React (`#root`). |
| **Vanilla JavaScript (ES6+)** | Lógica de precificação, estado e interações | Nativo do Navegador | Utiliza recursos modernos como `Intl.NumberFormat`, Promises, ES Modules e APIs nativas. |
| **React 18** | Renderização declarativa e UI reativa | CDN (`unpkg.com/react@18`) | Framework core da aplicação, permitindo estados fluidos e renderização de componentes reativos. |
| **ReactDOM 18** | Renderização no DOM real | CDN (`unpkg.com/react-dom@18`) | Módulo de montagem do React no container principal do HTML. |
| **Babel Standalone** | Transpilação JSX em tempo de execução | CDN (`unpkg.com/@babel/standalone`) | Traduz o JSX contido no bloco script diretamente no navegador, eliminando a necessidade de compiladores de linha de comando. |
| **Tailwind CSS v3** | Sistema de estilos e design responsivo | CDN (`cdn.tailwindcss.com`) | Biblioteca utility-first para estilização rápida, responsiva e com suporte a efeitos visuais como glows, gradientes e dark-mode. |
| **Google Fonts** | Tipografia | `fonts.googleapis.com` | Família de fontes **Inter** (pesos 400, 500, 600, 700) aplicada globalmente. |
| **localStorage API** | Banco de dados cliente | Nativo do Navegador | Persistência simples para salvar as escolhas do usuário entre atualizações e recarregamentos. |

## Dependências e Endpoints de CDN

No cabeçalho do `index.html`, as seguintes URLs são utilizadas:
1. **Tailwind CSS:** `https://cdn.tailwindcss.com`
2. **React:** `https://unpkg.com/react@18/umd/react.production.min.js`
3. **ReactDOM:** `https://unpkg.com/react-dom@18/umd/react-dom.production.min.js`
4. **Babel Standalone:** `https://unpkg.com/@babel/standalone/babel.min.js`
5. **Google Fonts (Inter):** `https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap`
