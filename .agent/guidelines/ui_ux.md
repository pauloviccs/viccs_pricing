# UI/UX Guidelines — VICCS Pricing Pro

## Estética Central: Dark Liquid Glass & Identidade Visual VICCS (Crimson & Wine)

Baseado no manual e assets oficiais da marca em `.agent/assets/logo/`:

### 1. Paleta de Cores Oficial da Marca (IDV)
- **Fundo da Aplicação:** `#08090b` (Deep Obsidian / Grafite Noturno) com reflexos radiais profundos.
- **Placas de Vidro (Liquid Glass Surface):** `rgba(18, 20, 25, 0.75)` com `backdrop-blur-2xl`.
- **Bordas Espelhadas (Liquid Borders):** `border border-white/[0.08]` com realce superior `border-t-white/[0.18]` e acentos `border-[#a32b2b]/40`.
- **Cores Oficiais de Marca:**
  - **Crimson Primário:** `#a32b2b` (Acento vivo, foco de ação, estados selecionados e glows principais).
  - **Deep Wine:** `#5a1515` (Degradês de profundidade, botões primários e caixas nobres).
  - **Dark Maroon:** `#4e1617` (Subtons e superfícies escuras ricas).
  - **Gunmetal Charcoal:** `#262e2f` (Bordas metálicas e tipografia gráfica para fundos claros).
  - **Titanium Slate:** `#2d3636` (Acentos neutros e contrastes).
- **Sombras & Glows:**
  - Glow Crimson: `box-shadow: 0 0 25px -3px rgba(163, 43, 43, 0.45)`.
  - Glow Wine: `box-shadow: 0 0 30px -4px rgba(90, 21, 21, 0.50)`.
  - Glass Shadow: `box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.55)`.

### 2. Regras de Assets & Identidade Visual (Sem Duplicações)
- **Regra de Ouro:** Não duplicar elementos da marca no mesmo bloco visual.
  - **Navbar / Topo:** Usar o ícone oficial `VICCS_Design_Icon_BWR.svg` (36px a 40px) com badge `PRO` em vidro crimson. Não duplicar texto de logotipo longo colado ao ícone.
  - **Login / Auth Screen:** Hero badge centralizado com `VICCS_Design_Icon_BWR.svg` (64px a 80px), iluminação difusa carmesim/vinho e tipografia limpa.
  - **PDF Proposta Comercial:** Usar o vetor horizontal oficial `VICCS_Design_Logo_txt.svg` no cabeçalho superior direito com tipografia nativa e dados de contato.
  - **Favicon:** Carregar o SVG vetorial `VICCS_Design_Icon_BWR.svg` com fallback para `.ico`.

### 3. Responsividade & Compatibilidade Mobile-First (iOS / Android / Tablets)
- **Top Navbar:** Fixa, translúcida com `backdrop-blur-2xl`, altura e touch targets confortáveis (`min-h-[44px]`).
- **Barra Flutuante Mobile:** Em telas `< lg`, uma barra inferior fixa mantém o total do orçamento e os botões de ação sempre acessíveis sem obrigar o usuário a rolar 34 cartões.
- **Drawer de Carrinho Mobile:** Modal lateral com rolagem independente que abre ao clicar em "Carrinho" em qualquer dispositivo touch.
- **Grade de Serviços:** Responsiva com `grid-cols-1 sm:grid-cols-2` e rolagem vertical contida em painel de vidro líquido.

### 4. Iconografia & Tipografia
- **Tipografia:** `Inter, sans-serif` (300 a 800) com contraste alto em branco puro `#FFFFFF` e secundários em `#94A3B8`.
- **Ícones Vetoriais SVG:** Traço fino de 1.75px / 2.0px (sem emojis amadores na interface).

### 5. Identidade Visual em Orçamentos e Documentos (PDF)
- **Cabeçalho Corporativo:** Deve conter a logo horizontal tipográfica oficial (`VICCS_Design_Logo_txt.svg`), slogan institucional do estúdio e régua com os 5 pontos de cor da marca.
- **Isótipo Oficial:** O símbolo (`VICCS_Design_Isotipo.svg`) deve aparecer em destaque no card de metadados da proposta e no rodapé timbrado.
- **Marca D'Água (Watermark):** Aplicação do isótipo no centro do documento com opacidade sutil (3% a 4%) para atestar autenticidade sem prejudicar legibilidade.
- **Faixas Tricolores:** Bordas decorativas no topo (2px/8px) e na base (1.5px/6px) com a proporção oficial: Carmim (50%), Vinho (25%) e Gunmetal (25%).
- **Tabelas & Destaques:** Cabeçalhos em Gunmetal Charcoal (`#262e2f`), badges de categoria em tom Carmim suave e caixas de total/pagamento com acento em `#a32b2b`.
