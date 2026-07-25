# Bitácora de Sesión — Configuración de Aider en MacBook Pro 2019

**Fecha:** 24 de julio de 2026
**Equipo:** MacBook Pro 15" 2019 (Intel, 16GB RAM, macOS)
**Asistentes:** Claude (Anthropic) + DeepSeek (sesión paralela)
**Objetivo:** dejar Aider funcionando con múltiples modelos y definir estrategia de uso

---

## 1. Instalación

### Aider
```bash
curl -LsSf https://aider.chat/install.sh | sh
aider --version  # 0.86.2
```

**Métodos que fallaron:**
- `pip3 install aider-chat` → bloqueado por macOS (PEP 668).
- `pipx install aider-chat` → numpy==1.24.3 no compila con Python 3.14.
- **Solución:** instalador oficial, único método que funcionó en macOS con Python 3.14.

### VS Code
```bash
brew install --cask visual-studio-code
code .  # funciona desde terminal
```

---

## 2. Configuración final del `~/.zshrc`

```bash
# oh-my-posh
eval "$(oh-my-posh init zsh)"

# PATH node
export PATH="/usr/local/opt/node/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/admin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# pipx
export PATH="$PATH:/Users/admin/.local/bin"

# ── APIs ────────────────────────────────────────────────────
export GEMINI_API_KEY="..."
export GROQ_API_KEY="..."
export DEEPSEEK_API_KEY="..."
export OPENROUTER_API_KEY="..."

# ── Ally X ──────────────────────────────────────────────────
ALLY_IP_LAN="192.168.1.3"
ALLY_IP_TAIL="100.108.163.6"
ALLY_USER="johan-gaming"

alias ally="ssh ${ALLY_USER}@${ALLY_IP_LAN}"
alias ally-r="ssh ${ALLY_USER}@${ALLY_IP_TAIL}"
alias ollama-start="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm start OllamaServer'"
alias ollama-stop="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm stop OllamaServer'"
alias ollama-status="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm status OllamaServer'"
alias ally-apagar="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'shutdown /s /t 0'"
alias ally-local="export OLLAMA_HOST=http://192.168.1.3:11434 && echo 'Ollama → LAN'"
alias ally-remoto="export OLLAMA_HOST=http://100.108.163.6:11434 && echo 'Ollama → Tailscale'"

# ── Aider shortcuts ─────────────────────────────────────────
# Local (Ollama en Ally X)
alias aider-local="aider --model openai/qwen2.5 --openai-api-base http://192.168.1.3:11434/v1 --openai-api-key ollama"

# Groq (gratis, ultrarrápido)
alias aider-groq="aider --model groq/llama-3.3-70b-versatile"
alias aider-groq-fast="aider --model groq/llama-3.1-8b-instant"
alias aider-groq-coder="aider --model groq/qwen-qwq-32b"

# DeepSeek (pago, reservar para código crítico)
alias aider-deepseek="aider --model deepseek/deepseek-chat"
alias aider-deepseek-r="aider --model deepseek/deepseek-reasoner"

# Gemini (pendiente configurar facturación)
alias aider-gemini="aider --model gemini/gemini-2.0-flash"

# OpenRouter (gratis)
alias aider-laguna="aider --model openrouter/poolside/laguna-s-2.1:free"
alias aider-laguna-xs="aider --model openrouter/poolside/laguna-xs-2.1:free"
alias aider-ling="aider --model openrouter/inclusionai/ling-3.0-flash:free"
alias aider-nemotron="aider --model openrouter/nvidia/nemotron-3-nano-30b-a3b:free"
alias aider-gpt-oss="aider --model openrouter/openai/gpt-oss-20b:free"
alias aider-gemma="aider --model openrouter/google/gemma-4-31b:free"
```

---

## 3. Estado de modelos probados

| Alias | Modelo | Estado | Notas |
|---|---|---|---|
| `aider-local` | qwen2.5 en Ally X | ✅ | Sin costo, depende del Ally X |
| `aider-groq` | Llama 3.3 70B | ✅ | $0.0014/msg, rápido |
| `aider-laguna` | Poolside Laguna S 2.1 | ✅ | Gratis, rate limit ocasional |
| `aider-gemini` | Gemini 2.0 Flash | ❌ | Quota 0, falta configurar facturación |
| `aider-deepseek` | DeepSeek Chat | ❌ | Sin saldo, requiere recarga |
| `aider-laguna-xs` | Laguna XS 2.1 | ⏳ | Sin probar |
| `aider-ling` | Ling 3.0 Flash | ⏳ | Sin probar |
| `aider-nemotron` | Nemotron 3 Nano | ⏳ | Sin probar |
| `aider-gpt-oss` | GPT OSS 20B | ⏳ | Sin probar |
| `aider-gemma` | Gemma 4 31B | ⏳ | Sin probar |

---

## 4. Estrategia de uso de modelos (por tarea y presupuesto)

| Tarea | Modelo | Costo |
|---|---|---|
| Código complejo / arquitectura | `aider-laguna` | Gratis |
| Tool calling / funciones | `aider-gpt-oss` | Gratis |
| Razonamiento profundo | `aider-nemotron` | Gratis |
| Fixes rápidos | `aider-groq` | Gratis |
| Documentación en español | `aider-local` | Gratis |
| Decisiones críticas / producción | `aider-deepseek` | ~$0.05-0.15/mes |

**Distribución estimada:** 90% modelos gratuitos + 10% DeepSeek para código crítico = ~$0.20/mes.

---

## 5. Dificultades encontradas

### Keys expuestas accidentalmente
Se publicaron keys de Gemini, Groq y DeepSeek en el chat.
**Acción:** keys revocadas y nuevas creadas inmediatamente.
**Regla:** nunca compartir keys en chats. Siempre editar directo en `~/.zshrc`.

### Modelos de OpenRouter desactualizados
Varios slugs `:free` dejaron de ser gratuitos a julio de 2026.
**Regla:** verificar en https://openrouter.ai/models filtrando por $0 antes de usar un slug nuevo.

### `.zshrc` mal formateado
Todo quedó en una sola línea al editar con nano.
**Solución:** usar `cat > ~/.zshrc << 'EOF'` para reescribir limpio.

### GitHub Copilot del SENA
**Decisión:** no usar Copilot con Aider — riesgo de suspensión de cuenta institucional por uso no previsto.
**Pendiente:** verificar términos del SENA antes de activarlo.

---

## 6. Pendientes

- [ ] Configurar facturación en Google Cloud para activar Gemini free tier.
- [ ] Cargar saldo mínimo en DeepSeek (~$2-5 USD).
- [ ] Probar aliases sin probar (laguna-xs, ling, nemotron, gpt-oss, gemma).
- [ ] Verificar GitHub Copilot del SENA y sus términos de uso.
- [ ] Explorar Aider en un proyecto real antes de replicar en ThinkPad.
- [ ] Replicar configuración en ThinkPad (ver sección 7).

---

## 7. Exportar configuración al ThinkPad (Debian)

Una vez definida la configuración final, correr esto desde el Mac:

```bash
# Copiar el script de setup al ThinkPad
scp ~/.zshrc_aider_export usuario@ip-thinkpad:~/aider_setup.sh
```

O más simple, crear un script de setup en el Mac y ejecutarlo remotamente:

```bash
# Crear script de instalación para Debian
cat > ~/setup_thinkpad_aider.sh << 'SCRIPT'
#!/bin/bash

# 1. Instalar Aider
curl -LsSf https://aider.chat/install.sh | sh

# 2. Agregar configuración al .bashrc
cat >> ~/.bashrc << 'BASHRC'

# ── APIs ────────────────────────────────────────────────────
export GEMINI_API_KEY="REEMPLAZAR"
export GROQ_API_KEY="REEMPLAZAR"
export DEEPSEEK_API_KEY="REEMPLAZAR"
export OPENROUTER_API_KEY="REEMPLAZAR"

# ── Ally X ──────────────────────────────────────────────────
ALLY_IP_LAN="192.168.1.3"
ALLY_IP_TAIL="100.108.163.6"
ALLY_USER="johan-gaming"

alias ally="ssh ${ALLY_USER}@${ALLY_IP_LAN}"
alias ally-r="ssh ${ALLY_USER}@${ALLY_IP_TAIL}"
alias ollama-start="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm start OllamaServer'"
alias ollama-stop="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm stop OllamaServer'"
alias ollama-status="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm status OllamaServer'"
alias ally-apagar="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'shutdown /s /t 0'"
alias ally-local="export OLLAMA_HOST=http://192.168.1.3:11434 && echo 'Ollama → LAN'"
alias ally-remoto="export OLLAMA_HOST=http://100.108.163.6:11434 && echo 'Ollama → Tailscale'"

# ── Aider shortcuts ─────────────────────────────────────────
alias aider-local="aider --model openai/qwen2.5 --openai-api-base http://192.168.1.3:11434/v1 --openai-api-key ollama"
alias aider-groq="aider --model groq/llama-3.3-70b-versatile"
alias aider-groq-fast="aider --model groq/llama-3.1-8b-instant"
alias aider-groq-coder="aider --model groq/qwen-qwq-32b"
alias aider-deepseek="aider --model deepseek/deepseek-chat"
alias aider-deepseek-r="aider --model deepseek/deepseek-reasoner"
alias aider-gemini="aider --model gemini/gemini-2.0-flash"
alias aider-laguna="aider --model openrouter/poolside/laguna-s-2.1:free"
alias aider-laguna-xs="aider --model openrouter/poolside/laguna-xs-2.1:free"
alias aider-ling="aider --model openrouter/inclusionai/ling-3.0-flash:free"
alias aider-nemotron="aider --model openrouter/nvidia/nemotron-3-nano-30b-a3b:free"
alias aider-gpt-oss="aider --model openrouter/openai/gpt-oss-20b:free"
alias aider-gemma="aider --model openrouter/google/gemma-4-31b:free"
BASHRC

source ~/.bashrc
echo "✅ Configuración completada en el ThinkPad"
SCRIPT

chmod +x ~/setup_thinkpad_aider.sh

# Copiar y ejecutar en el ThinkPad (reemplaza IP y usuario)
scp ~/setup_thinkpad_aider.sh usuario-thinkpad@ip-thinkpad:~/
ssh usuario-thinkpad@ip-thinkpad "bash ~/setup_thinkpad_aider.sh"
```

**Importante:** antes de ejecutar, edita el script y pon las API keys reales en los campos `REEMPLAZAR`. No corras el script sin reemplazar las keys.

