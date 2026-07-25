# Bitácora de Sesión — Configuración ROG Ally X como Servidor de IA Local

**Fecha:** 23-24 de julio de 2026
**Duración:** sesión extendida (~6 horas)
**Participantes:** estudiante + Claude (Anthropic) + DeepSeek (asistencia paralela)

---

## 1. Objetivo de la sesión

Configurar el ROG Ally X como servidor headless de inteligencia artificial local, accesible desde el MacBook Pro 2019 y el ThinkPad T490 (Debian), tanto en red local como de forma remota.

---

## 2. Lo que se logró

### ✅ Servidor Ollama funcionando
- Ollama instalado en el ROG Ally X (Windows 11 Home).
- Modelo `qwen2.5:7b` descargado y operativo.
- Ollama expuesto en toda la red (`OLLAMA_HOST=0.0.0.0:11434`).
- Configurado como servicio del sistema con NSSM (arranque automático antes del login).

### ✅ SSH habilitado
- OpenSSH Server instalado y corriendo como servicio del sistema.
- Accesible desde el Mac y el ThinkPad por red local e IP de Tailscale.
- Puerto 22 abierto en el firewall de Windows.

### ✅ Tailscale configurado
- Tailscale instalado en el Ally X y el Mac.
- IP fija del Ally X en Tailscale: `100.108.163.6`
- Conexión directa confirmada: `active; direct 192.168.1.3:41641`

### ✅ Firewall configurado
- Puerto 11434 (Ollama) abierto para conexiones entrantes.
- Puerto 22 (SSH) abierto automáticamente por OpenSSH.

### ✅ Anti-suspensión configurado
- Suspensión AC desactivada (`0x00000000`).
- Hibernación AC desactivada (`0x00000000`).
- Pantalla se apaga a los 5 minutos (ahorra energía sin suspender el sistema).

### ✅ Acceso desde el Mac confirmado
- Ollama responde desde el Mac vía Tailscale (`http://100.108.163.6:11434`).
- Prueba exitosa con APIDog: `POST /api/generate` con `qwen2.5`, respuesta 200 ✅.
- Prueba exitosa con `curl` desde terminal del Mac.

---

## 3. Datos del servidor (anotar y guardar)

```
IP LAN del Ally X:        192.168.1.3
IP Tailscale del Ally X:  100.108.163.6
MAC LAN (Ethernet 2):     60-6D-3C-4C-6B-53
MAC Wi-Fi:                EC-91-61-9B-03-9F
Usuario Windows:          johan-gaming
Email Tailscale:          johanvargasdev@gmail.com
Modelo activo:            qwen2.5:7b
Puerto Ollama:            11434
Puerto SSH:               22
```

---

## 4. Dificultades encontradas

### 4.1 Windows 11 Home sin RDP
- El Ally X tiene Windows 11 **Home**, que no incluye escritorio remoto (RDP).
- **Solución:** se instaló **RustDesk** como alternativa gratuita de escritorio remoto.
- Esto permitió hacer toda la configuración desde el Mac con teclado cómodo.

### 4.2 Confusión entre WSL y PowerShell
- Al intentar correr comandos de Windows desde el terminal del Ally X, se estaba en el subsistema Ubuntu (WSL) en lugar de PowerShell nativo.
- Los comandos `ipconfig` y `Get-NetAdapter` fallaban con "command not found".
- **Solución:** usar `powershell.exe -Command "ipconfig"` desde WSL, o abrir PowerShell directamente.

### 4.3 IP del Ally X desconocida (equipo en movimiento)
- El Ally X estaba conectado por WiFi cuando se obtuvieron los primeros datos de red.
- La IP real por LAN (`192.168.1.3`) y la MAC del adaptador Ethernet se obtuvieron después al conectarlo por cable.
- **Lección:** usar siempre la IP de Tailscale (`100.108.163.6`) como referencia estable — nunca cambia.

### 4.4 Qwen3.6 demasiado lento para el Ally X
- Se intentó descargar `qwen3.6` (MoE 35B) como upgrade sobre `qwen2.5:7b`.
- El pull tardó más de una hora sin mostrar progreso visible (bug visual de Ollama en Windows).
- Al probarlo, la inferencia fue notablemente más lenta para el hardware del Ally X (iGPU sin VRAM dedicada).
- **Decisión:** quedarse con `qwen2.5:7b` — mejor balance calidad/velocidad para este hardware.

### 4.5 Frustración con variables en APIDog (sesión con DeepSeek)
- Se intentó parametrizar el prompt en APIDog usando variables tipo `{{prompt}}`.
- APIDog no tiene las variables en "Settings" como se esperaba — están en el ícono de gestión de entornos (≡) en la esquina superior derecha.
- La sesión con DeepSeek fue larga y frustrante antes de encontrar la ubicación correcta.
- **Solución final:** variables globales en APIDog bajo "Environment Management" → `{{mi_prompt}}` en el Body.
- **Alternativa más simple:** editar el JSON directamente o usar `curl` desde terminal.

### 4.6 Pull de qwen3.6 sin progreso visible
- `ollama pull qwen3.6` se quedó sin mostrar barra de progreso por más de una hora.
- No era un cuelgue real — Ollama en Windows tiene un bug conocido donde el progreso no se muestra en algunas versiones.
- **Solución:** cancelar con `Ctrl+C` y verificar con `ollama list` si algo se descargó parcialmente.

---

## 5. Estado actual del stack

| Componente | Estado | Notas |
|---|---|---|
| Ollama en Ally X | ✅ Corriendo | Servicio NSSM, arranque automático |
| Modelo qwen2.5:7b | ✅ Disponible | Modelo definitivo para este hardware |
| SSH | ✅ Activo | Puerto 22, servicio del sistema |
| Tailscale | ✅ Conectado | IP fija 100.108.163.6 |
| Firewall | ✅ Configurado | Puertos 22 y 11434 abiertos |
| Anti-suspensión | ✅ Configurado | Nunca suspende enchufado |
| RustDesk | ✅ Instalado | Escritorio remoto alternativo a RDP |
| Acceso desde Mac | ✅ Confirmado | vía Tailscale y red local |
| Aider en Mac | ⏳ Pendiente | Siguiente paso |
| Aider en ThinkPad | ⏳ Pendiente | Siguiente paso |
| AnythingLLM | ⏳ Pendiente | Para gestión documental SENA |
| Clave SSH sin contraseña | ⏳ Pendiente | Comodidad de acceso |

---

## 6. Siguiente paso (próxima sesión)

### Prioridad 1 — Configurar el Mac como cliente completo

```bash
# 1. Instalar Aider
pip3 install aider-chat

# 2. Agregar al ~/.zshrc
export GEMINI_API_KEY="tu_key"
export GROQ_API_KEY="tu_key"
export OPENROUTER_API_KEY="tu_key"
export OLLAMA_BASE_URL="http://100.108.163.6:11434"

ALLY_IP_LAN="192.168.1.3"
ALLY_IP_TAIL="100.108.163.6"
ALLY_USER="johan-gaming"

alias ally="ssh ${ALLY_USER}@${ALLY_IP_LAN}"
alias ally-r="ssh ${ALLY_USER}@${ALLY_IP_TAIL}"
alias ollama-start="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm start OllamaServer'"
alias ollama-stop="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm stop OllamaServer'"
alias ollama-status="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'nssm status OllamaServer'"
alias ally-apagar="ssh ${ALLY_USER}@${ALLY_IP_LAN} 'shutdown /s /t 0'"

# 3. Aplicar cambios
source ~/.zshrc

# 4. Probar Aider contra el Ally X
aider --model ollama/qwen2.5:7b \
      --openai-api-base http://100.108.163.6:11434/v1 \
      --openai-api-key ollama
```

### Prioridad 2 — Clave SSH sin contraseña (Mac → Ally X)
```bash
ssh-keygen -t ed25519 -C "mac-ally"
ssh-copy-id johan-gaming@192.168.1.3
```

### Prioridad 3 — Configurar el ThinkPad (Debian)
- Mismo esquema que el Mac.
- Instalar Tailscale en Debian.
- Instalar Aider.
- Configurar alias en `~/.bashrc`.

### Prioridad 4 — AnythingLLM en Mac o ThinkPad
- Conectarlo al Ollama del Ally X.
- Crear workspace con documentos académicos del SENA.
- Base para el flujo de 4 artefactos documentales.

---

## 7. Notas para la próxima sesión

- El Ally X **no necesita ser tocado físicamente** — todo se maneja por SSH o RustDesk.
- Si el Ally X parece no responder, verificar primero con `ping 192.168.1.3` antes de asumir que está apagado.
- La IP de Tailscale (`100.108.163.6`) es la referencia estable — usar esta cuando hay duda sobre la IP local.
