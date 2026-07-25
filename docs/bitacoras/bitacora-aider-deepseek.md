# Bitácora de Sesión — Viernes 24 de Julio de 2026 (Completa)

| Propiedad | Detalle |
| :--- | :--- |
| **Fecha** | Viernes 24 de julio de 2026 |
| **Duración** | ~8–9 horas (3 bloques) |
| **Participantes** | Estudiante, Claude, DeepSeek |

### Equipos Involucrados
* **MacBook Pro 15" 2019:** Intel, 16GB RAM, macOS
* **ThinkPad T490:** Debian Trixie, Python 3.13.5
* **ROG Ally X:** Windows 11 Home, 24GB RAM, Servidor Ollama

> **Objetivo del día:** Finalizar la configuración técnica completa de Aider en Mac y ThinkPad, consolidar la integración con el Ally X, documentar el stack completo y reajustar el calendario del proyecto.

---

## 1. Logros de la Sesión

### 💻 MacBook Pro 2019
* **Aider instalado:** Vía script oficial (`curl -LsSf https://aider.chat/install.sh | sh`)
* **Versión:** `0.86.2`
* **Configuración:** Alias definidos en `~/.zshrc` para todos los modelos
* **APIs activas:** GROQ, DEEPSEEK y OPENROUTER (Gemini descartado)
* **Conectividad:** SSH verificado hacia Ally X (`100.108.163.6`) y ThinkPad (`100.109.51.29`)

### 🐧 ThinkPad T490
* **Aider instalado:** Vía `pipx install aider-chat`
* **Versión:** `0.86.3.dev53+g5dc9490bb`
* **Configuración:** Alias en `~/.zshrc` adaptados para entorno Linux
* **Ajustes de Sistema:** Anti-suspensión habilitada (`HandleLidSwitch=ignore` en `logind.conf`)
* **Red:** Tailscale activo (IP: `100.109.51.29`) y SSH accesible desde Mac

### 🎮 ROG Ally X (Servidor)
* **Ollama:** Instalado y ejecutándose como servicio vía NSSM
* **Modelos:** `qwen2.5:7b` descargado y operativo
* **Red y Seguridad:**
  * Ollama expuesto en `0.0.0.0:11434`
  * SSH activo en puerto 22
  * Tailscale con IP fija: `100.108.163.6`
  * Firewall con puertos 22 y 11434 abiertos
* **Energía:** Anti-suspensión configurada para uso continuo enchufado
* **Acceso:** Conexión remota validada desde Mac y ThinkPad

---

### 🤖 Modelos Probados en Clientes

| Modelo | Mac | ThinkPad | Costo Est. | Notas |
| :--- | :---: | :---: | :---: | :--- |
| `aider-local` (qwen2.5) | ✅ | ✅ | $0 | Vía Ally X, muy rápido |
| `aider-nemotron` | ✅ | ✅ | $0 | Buen razonamiento |
| `aider-laguna-m1` | ⏳ | ✅ | $0 | Optimizado para SWE |
| `aider-north` | ⏳ | ✅ | $0 | Especializado en código |
| `aider-gpt-oss` | ⏳ | ✅ | $0 | Tool calling y estructuras |
| `aider-groq` (Llama 3.3) | ✅ | ✅ | ~$0.0014 / msg | Respuesta ultrarrápida |
| `aider-deepseek` | ✅ | ✅ | ~$0.05 - 0.15 / msg | Entorno de pago (código crítico) |

---

### 📄 Artefactos y Documentación Generada
1. `bitacora_aider_incompleta.md` — Configuración de Aider en Mac (sesión con Claude)
2. `bitacora_sesion_ally.md` — Configuración del Ally X (sesión con DeepSeek)
3. `contexto_proyecto.md` — Contexto de transición (académico → real)
4. `Proyecto_Tienda_Virtual_APA.docx` — Documento base bajo normas APA
5. `bitacora_24_julio_2026_COMPLETA.md` — Consolidación completa de la sesión

---

## 2. Resolución de Problemas

### 🍎 MacBook Pro
| Problema | Solución |
| :--- | :--- |
| `pip3 install` bloqueado por PEP 668 | Instalación oficial vía script (`curl -LsSf ...`) |
| Incompatibilidad de `pipx` con `numpy` | Resolver usando el instalador oficial de Aider |
| Sintaxis corrupta en `~/.zshrc` | Reescritura limpia con `cat > ~/.zshrc << 'EOF'` |
| Exposición accidental de API Keys | Revocación inmediata y recreación de llaves |

### 🐧 ThinkPad T490
| Problema | Solución |
| :--- | :--- |
| Ausencia de `ssh.service` | Instalar paquete `openssh-server` |
| Timeout en SSH | Iniciar demonio de Tailscale |
| Suspensión al cerrar la tapa | Configurar `HandleLidSwitch=ignore` en `logind.conf` |
| Bloqueo de apt por `packagekitd` | Matar proceso (`sudo kill -9`) y deshabilitarlo |
| Falla de `numpy` en Python 3.13 | Instalar `numpy 2.5.1` previa con `--prefer-binary` |
| Entorno administrado (`externally-managed`) | Instalar vía `pipx install aider-chat` |

### 🎮 ROG Ally X
| Problema | Solución |
| :--- | :--- |
| Falta de RDP en Windows 11 Home | Usar RustDesk para gestión remota |
| IP variable en WiFi | Fijar uso exclusivo de IP Tailscale (`100.108.163.6`) |
| Rendimiento bajo en Qwen3.6 | Usar `qwen2.5:7b` por mejor balance velocidad/calidad |

---

## 3. Plan de Trabajo & Cronograma

### Sábado 25 de Julio — Tablero + AnythingLLM (6h)
* **09:00 - 12:00:** Creación del proyecto en GitHub Projects y migración de backlog (completadas/pendientes).
* **13:00 - 15:00:** Instalación de AnythingLLM en Ally X y vinculación con Ollama (`localhost:11434`).
* **15:00 - 17:00:** Creación del Workspace "SENA" y configuración de prompts para el flujo documental.

### Domingo 26 de Julio — Artefactos y Wiki (4h)
* **09:00 - 11:00:** Generación del artefacto consolidado del proyecto previo.
* **11:00 - 13:00:** Creación de la Wiki técnica en inglés.
* **14:00 - 16:00:** Validaciones de formato APA y ajuste de prompts.

### Semana 27 de Julio – 31 de Julio (1h / día)
* **Lunes 27:** Estudio de mercado y análisis de proveedores.
* **Martes 28:** Definición formal de la temática con el socio gestor.
* **Miércoles 29:** Estructuración del catálogo base (10–15 productos).
* **Jueves 30:** Documentación de la nueva línea de negocio mediante el flujo de 4 artefactos.
* **Viernes 31:** Planificación del Sprint 1 y revisión de convocatorias.

---

## 4. Comandos y Accesos Rápidos

```bash
# Estado de la red Mesh
tailscale status

# Acceso SSH al ThinkPad desde Mac
ssh johan@100.109.51.29

# Acceso SSH al Ally X desde Mac/ThinkPad
ssh johan-gaming@100.108.163.6

# Validación de estado de Ollama en el Servidor
curl http://100.108.163.6:11434/api/generate -d '{
  "model": "qwen2.5:7b",
  "prompt": "ping",
  "stream": false
}'
```
