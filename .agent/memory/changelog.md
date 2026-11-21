# Changelog

## 2026-11-21 — Sincronização de Visão Geral & Memória do Agente (Release 2.1)

### Governança & Memória (.agent Cortex)
- **Atualização do Project Status Overview:** Documento `PROJECT_STATUS.md` e `README.md` atualizados com todo o ecossistema de 34 serviços, layout responsivo mobile e template executivo de PDF.
- **Limpeza de Active Task:** Tarefas ativas concluídas e arquivadas; `active_task.md` definido como livre/em espera para novas demandas.
- **Commit & Push Remoto:** Alterações consolidadas no commit `9671ce3` e enviadas para `origin/master` (`https://github.com/pauloviccs/viccs_pricing.git`).

---

## 2026-11-21 — Reestruturação da Identidade Visual Oficial nos Orçamentos em PDF

### Identidade Visual & Engenharia de Propostas (PDF)
- **Implementação do Padrão Executivo de Papel Timbrado:**
  - **Faixas Tricolores Oficiais:** Adicionada barra decorativa no topo e na base do PDF com a proporção cromática exata da VICCS: Carmim (`#a32b2b`), Vinho Nobre (`#5a1515`) e Gunmetal Charcoal (`#262e2f`).
  - **Isótipo Oficial Integrado (`VICCS_Design_Isotipo.svg`):** Integrado em cores reais no card de identificação da proposta no cabeçalho e no selo do rodapé.
  - **Marca D'Água Sutil (Watermark):** Aplicação do Isótipo em escala generosa no fundo do documento com rotação de -4° e opacidade ultra suave (3.5%), garantindo aspecto premium sem prejudicar legibilidade.
  - **Logo Tipográfica Oficial (`VICCS_Design_Logo_txt.svg`):** Exibição da tipografia corporativa no cabeçalho acompanhada do slogan institucional e da régua gráfica de 5 cores (`#a32b2b`, `#5a1515`, `#4e1617`, `#262e2f`, `#2d3636`).
  - **Tabela de Escopo com Identidade:** Cabeçalho com fundo Gunmetal Charcoal (`#262e2f`), texto branco, linhas zebradas suaves e badges de categoria em Carmim suave.
  - **Blocos Comerciais & PIX:** Caixa de pagamento em tom Carmim suave com chave PIX em destaque e discriminação detalhada de subtotal, acréscimos, descontos e total.
- **Auditoria de Execução:** Validação via `html2canvas` + `jsPDF` com zero erros no console do navegador.

---

## 2026-11-21 — Overhaul Visual com Identidade Oficial da Marca (Crimson & Wine IDV)

### Identidade Visual & Design System
- **Paleta Oficial da Marca Injetada:** Substituição completa do padrão roxo genérico pelas cores reais extraídas de `.agent/assets/logo/`:
  - Crimson Oficial (`#a32b2b`), Deep Wine (`#5a1515`), Dark Maroon (`#4e1617`), Gunmetal Charcoal (`#262e2f`) e Titanium Slate (`#2d3636`).
  - Novos tokens de iluminação: `shadow-glow-crimson` e `shadow-glow-wine`.
- **Logotipos Vetoriais Oficiais Integrados (Sem Duplicações):**
  - **Header Navbar:** Inserido o ícone vetorial `VICCS_Design_Icon_BWR.svg` de alta nitidez com badge `PRO` em vidro crimson.
  - **Tela de Autenticação / Login:** Hero badge com `VICCS_Design_Icon_BWR.svg` com luz difusa carmesim e botão primário em degradê de marca.
  - **PDF Comercial (A4):** Cabeçalho profissional renderizando o logotipo horizontal oficial `VICCS_Design_Logo_txt.svg` em 300 DPI, eliminando duplicação de texto e acentuando valores e caixa de PIX nas cores da marca.
- **Experiência Mobile & Responsividade (iOS / Android / Tablets):**
  - **Barra Flutuante Inferior Mobile:** Componente fixo em telas menores exibindo o valor total e botões de ação rápida ("Adicionar" e "Ver Carrinho").
  - **Drawer de Carrinho Mobile:** Gaveta deslizante lateral acionada ao tocar no botão de carrinho em smartphones e tablets.
- **Governânça Atualizada:** Arquivos `ui_ux.md`, `PROJECT_STATUS.md`, `README.md` e `active_task.md` sincronizados.

---

## 2026-11-21 — Adição de 15 Novos Serviços (Gráfica, Web Dev & Software)

### Expansão de Catálogo
- **3 Novas Categorias:** `grafica`, `webdev` e `software`.
- **15 Novos Serviços Inseridos:** Totalizando 34 serviços no catálogo em 11 categorias.
- **Iconografia SVG:** Adicionados ícones vetoriais dedicados para `code`, `terminal` e `globe`.

---

## 2026-11-21 — Sincronização Holística de Visão Geral & Memória (.agent Cortex)
- Criação do `README.md`, atualização de `PROJECT_STATUS.md`, `architecture.md`, `stack.md`, `code_style.md` e `todos.md`.
