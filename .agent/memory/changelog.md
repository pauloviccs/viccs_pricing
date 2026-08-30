# Changelog

## 2026-08-30 — VICCS Pricing Pro (Supabase Auth, Motion Engine, Multi-Cart & Liquid Glass)

### Novas Features & Módulos
- **Autenticação Supabase com Restrição Admin:**
  - Login e Cadastro restritos a E-mail/Senha (sem provedores sociais invasivos).
  - Tela de espera para usuários pendentes; liberação apenas quando `is_admin = true` no Supabase.
  - Modo de visualização direta de Administrador para desenvolvimento local ágil.
- **Engine Paramétrica de Motion Design:**
  - Slider dinâmico de segundos (5s a 120s+) com precificação escalonada por segundo.
  - Seletores de estilo & complexidade visual (*Tipografia Cinética / Stories*, *2D Vetorial / Médio*, *Ilustração Complexa / 3D*).
  - Toggle de *Sound Design & Trilha Sonora* comercial (+R$ 120,00).
- **Sistema de Carrinho Multi-Itens (Empilhamento de Serviços):**
  - Permite adicionar múltiplos serviços e pacotes em um único orçamento.
  - Controles de quantidade (+ / -) e remoção instantânea por item.
  - Badge de contagem em tempo real no header.
- **Ajustes Comerciais com Justificativa:**
  - Inputs para Acréscimos (+R$) e Descontos (-R$) com justificativas textuais impressas na proposta em PDF e no WhatsApp.
- **Design System Dark Liquid Glass & Vetores SVG:**
  - Interface baseada nas referências visuais oficiais (Workly, SmartShort e Liquid Glass Card).
  - Fundo escuro profundo `#070709` com painéis foscos `backdrop-blur-2xl bg-[rgba(16,16,24,0.70)]` e reflexos de luz superiores `border-t-white/18`.
  - Remoção de emojis amadores, substituídos por ícones vetoriais SVG de traço fino (Lucide/Heroicons).
- **Persistência no Supabase & Histórico de Propostas:**
  - Gravação relacional nas tabelas `proposals` e `proposal_items`.
  - Drawer lateral para busca e reabertura de orçamentos antigos no editor.
- **Exportação Otimizada de PDF Multipágina:**
  - Renderização contínua com quebra de página inteligente, tabela de escopo e dados PIX automáticos.
