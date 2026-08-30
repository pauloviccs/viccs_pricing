# UI/UX Guidelines — VICCS Pricing Pro

## Estética Central: Dark Liquid Glass & Linear/Shadcn Influence

Baseado nas referências visuais oficiais (Workly, SmartShort, Lunor e Liquid Glass Card):

### 1. Paleta de Cores & Fundos
- **Fundo da Aplicação:** `#08080a` com degradê radial sutil e nós de luz difusa.
- **Placas de Vidro (Glass Surface):** `rgba(18, 18, 24, 0.65)` com `backdrop-blur-2xl`.
- **Bordas Espelhadas (Liquid Border):** `border border-white/[0.08]` com realce superior `border-t-white/[0.18]`.
- **Acentos de Cor:**
  - Roxo Neon Principal: `from-purple-600 to-indigo-600` com sombra difusa `0 0 25px rgba(147, 51, 234, 0.35)`.
  - Gradiente de Ação: Rosa/Magenta a Vermelho suave para botões de destaque (estilo card de login).
  - Indicador Lateral Ativo: Barra vertical `w-1.5 h-6 bg-purple-500 rounded-full shadow-[0_0_12px_#a855f7]`.

### 2. Tipografia & Hierarquia
- **Fonte:** `Inter, sans-serif` (pesos 400, 500, 600, 700).
- **Contraste:**
  - Valores e Títulos Principais: Branco puro `#FFFFFF` (Weight 700 / 600).
  - Labels Secundários / Ajuda: `#94A3B8` (Slate 400).
  - Badges e Tags: Pílulas escuras translúcidas com bordas sutis e tipografia média `#F8FAFC`.

### 3. Iconografia
- **Regra Inegociável:** Sem excesso de emojis amadores.
- **Padrão:** Ícones vetoriais SVG limpos (traço de 1.5px / 2px - Lucide/Heroicons) para serviços, ações de navegação, status e controles.

### 4. Componentes Chave
- **Login / Auth:** Card centralizado Liquid Glass com efeito de reflexo de luz, inputs arredondados escuros com focus ring roxo/rosa e botão de ação circular com seta.
- **Carrinho / Slide-over Drawer:** Gaveta lateral fluida com listagem de itens adicionados, remoção rápida e campos de acréscimo/desconto com justificativa obrigatória.
- **Indicador Flutuante Mobile/Desktop:** Pílula fosca com contador de itens e valor total, disparando pulso luminoso a cada alteração.
