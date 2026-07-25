# TendencIA

> La tendencia inteligente | AI-powered fashion e-commerce

[![Status](https://img.shields.io/badge/status-pre--development-yellow)](https://github.com/johanjaguardev/tendencIA)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)

---

## 📋 Description

**TendencIA** is a next-generation fashion e-commerce platform that leverages artificial intelligence to deliver personalized shopping experiences. Built on Shopify's Storefront API, it combines the robustness of a proven commerce platform with AI-driven features for product recommendations, intelligent catalog management, and adaptive user experiences.

This project represents the evolution from an academic exercise into a real-world business venture, developed as part of the SENA Technology in Software Analysis and Development program.

### ✨ Key Features (Planned)

- **AI-Powered Recommendations**: Personalized product suggestions based on user preferences and behavior
- **Intelligent Catalog**: Smart product categorization and search
- **Adaptive UX**: Dynamic user experience based on interaction patterns
- **Headless Architecture**: Built on Shopify Storefront API with GraphQL
- **Document Automation**: 4-artifact document flow for academic and technical documentation

---

## 🏗️ Architecture
=======
# Bitácora de Sesión — Sábado 25 de Julio de 2026

**Fecha:** Sábado 25 de julio de 2026
**Duración:** ~8 horas
**Participantes:** Estudiante + DeepSeek
**Equipos involucrados:** ThinkPad T490 (Debian), MacBook Pro 2019 (macOS)
**Objetivo del día:** Configurar el repositorio, tablero de trabajo, sistema de gestión de tareas en GitHub y sincronizar ambos equipos (ThinkPad y Mac).

---

## 1. Resumen de la Sesión

Jornada completa de configuración y organización del proyecto TendencIA. Se completó la infraestructura de gestión en GitHub, se sincronizaron ambos equipos de trabajo (ThinkPad y MacBook Pro) y se documentó todo el proceso. Se crearon milestones, issues y se estructuró la documentación del proyecto.

---

## 2. Logros de la Sesión

### 🐧 ThinkPad T490 (Equipo Principal)

#### Repositorio Local
- [x] Repositorio `tendencIA` inicializado localmente
- [x] Rama `master` renombrada a `main`
- [x] Configuración global de Git: usuario y email
- [x] README.md creado con descripción del proyecto
- [x] Primer commit y push a GitHub

#### GitHub CLI
- [x] `gh` instalado y autenticado vía navegador
- [x] Verificación de autenticación: `gh auth status`

#### Estructura de Carpetas
- [x] Creación de carpetas: `docs/`, `docs/bitacoras/`, `docs/artefactos/`, `prompts/`, `data/`

### 💻 MacBook Pro 2019

#### SSH y Clonación
- [x] Generación de clave SSH (`ssh-keygen -t ed25519`)
- [x] Clave pública agregada a GitHub (Settings → SSH Keys)
- [x] Verificación de autenticación: `ssh -T git@github.com` ✅
- [x] Clonación del repositorio: `git clone git@github.com:johanjaguardev/tendencIA.git`

#### Configuración de Git
- [x] Configuración de identidad:
  - `user.name = Johan Vargas Sánchez`
  - `user.email = johanvargasdev@gmail.com`

#### Remote Login (SSH)
- [x] Activación de Remote Login en macOS (System Settings → Sharing)
- [x] Verificación: `sudo systemsetup -getremotelogin` → On

### 🌐 GitHub (Repositorio Remoto)

#### Project Board
- [x] Creación del tablero: `TendencIA`
- [x] Columnas configuradas:
  - 📋 Backlog
  - 🔨 En Desarrollo
  - 👀 Revisión
  - ✅ Hecho

#### Milestones
| Milestone | Descripción | Fecha |
| :--- | :--- | :--- |
| **Phase 0 - Initial Setup (Completed)** | Infraestructura base | 2026-07-24 |
| **Phase 1 - Infrastructure & Setup** | AnythingLLM, Workspace, prompts | 2026-07-25 |
| **Phase 2 - Content & Documentation** | Catálogo, artefactos, Wiki | 2026-07-26 |

#### Issues Creados (8 total)

**Phase 1 - Infrastructure & Setup:**
| # | Title | Labels |
| :--- | :--- | :--- |
| #2 | Configure AnythingLLM on Ally X | infrastructure, ai-models |
| #3 | Create SENA Workspace in AnythingLLM | documentation, ai-models |
| #4 | Setup Document Flow Prompts | documentation, ai-models |
| #5 | Validate Connectivity ThinkPad ↔ Ally X | documentation, infrastructure |

**Phase 2 - Content & Documentation:**
| # | Title | Labels |
| :--- | :--- | :--- |
| #6 | Structure Base Catalog (10-15 Products) | content |
| #7 | Generate Consolidated APA Artifact | documentation |
| #8 | Create Technical Wiki in English | documentation |
| #9 | Define Artifact Generation Prompts | documentation, ai-models |

#### Issues de Documentación
- [x] Issue #1: `docs: document initial setup completed (Phase 0)` actualizado con toda la documentación de la sesión

### 📄 Documentación Generada

- [x] `bitacora-tablero-gh.md` — Bitácora completa de la configuración del tablero GitHub (ThinkPad)
- [x] README.md actualizado con:
  - Descripción del proyecto
  - Stack tecnológico
  - Infraestructura (IPs Tailscale)
  - Roadmap por fases
  - Equipo de trabajo
  - Enlaces a documentación y bitácoras
- [x] `.gitignore` agregado para ignorar `.DS_Store`

### 🔗 Conexiones entre Equipos

- [x] SSH ThinkPad → Mac: probado y verificado
- [x] Remote Login activado en Mac
- [x] Ambos equipos sincronizados con el mismo repositorio GitHub

---

## 3. Problemas y Soluciones

### Problema 1: Git inició con `master` en lugar de `main`
**Descripción:** Al inicializar el repositorio, la rama por defecto era `master`.
**Solución:**
```bash
git checkout -b main
git branch -d master
git config --global init.defaultBranch main
Problema 2: Git no reconocía al usuario
Descripción: Al hacer el primer commit, Git pedía configurar nombre y email.
Solución:

bash
git config --global user.name "Johan Vargas Sánchez"
git config --global user.email "johanvargasdev@gmail.com"
Problema 3: src refspec main no concuerda con ninguno
Descripción: Intenté hacer git push sin tener commits en la rama.
Solución: Crear el README, hacer commit y luego push.

Problema 4: GitHub CLI no autenticado
Descripción: Al ejecutar gh issue create, aparecía error de autenticación.
Solución:

bash
gh auth login
Autenticación vía navegador con código OTP.

Problema 5: gh milestone no existe como comando
Descripción: Intenté crear milestones desde terminal con gh milestone.
Solución: Crear milestones desde la interfaz web de GitHub (Issues → Milestones).

Problema 6: SSH fallaba en el Mac (Permission denied)
Descripción: Al hacer ssh -T git@github.com desde el Mac, fallaba porque no había clave SSH generada ni agregada a GitHub.
Solución:

bash
ssh-keygen -t ed25519 -C "johanvargasdev@gmail.com"
# Agregar ~/.ssh/id_ed25519.pub a GitHub Settings → SSH Keys
Problema 7: Carpeta documentacion/ duplicada
Descripción: El Mac tenía archivos en documentacion/bitacoras/ mientras el repositorio usaba docs/.
Solución:

bash
mv documentacion/bitacoras/*.md docs/bitacoras/
mv documentacion/bitacoras/*.docx docs/artefactos/
rm -rf documentacion/
Problema 8: .DS_Store en el repositorio
Descripción: Archivos de sistema macOS aparecían como untracked.
Solución: Agregar .gitignore con .DS_Store y **/.DS_Store.

4. Comandos Útiles Usados en la Sesión
ThinkPad
bash
# Configuración de Git
git config --global user.name "Johan Vargas Sánchez"
git config --global user.email "johanvargasdev@gmail.com"

# Configurar rama por defecto
git config --global init.defaultBranch main

# Crear estructura de carpetas
mkdir -p docs/bitacoras docs/artefactos prompts data

# Crear .gitignore
echo ".DS_Store" >> .gitignore
echo "**/.DS_Store" >> .gitignore

# GitHub CLI
gh auth login
gh issue list
gh issue create --title "..." --body "..." --label "..." --milestone "..."

# Git
git add .
git commit -m "mensaje"
git push origin main
MacBook Pro
bash
# Generar clave SSH
ssh-keygen -t ed25519 -C "johanvargasdev@gmail.com"
cat ~/.ssh/id_ed25519.pub

# Verificar SSH con GitHub
ssh -T git@github.com

# Clonar repositorio
git clone git@github.com:johanjaguardev/tendencIA.git
cd tendencIA

# Configurar Git
git config --global user.name "Johan Vargas Sánchez"
git config --global user.email "johanvargasdev@gmail.com"

# Activar Remote Login (SSH)
# System Settings → General → Sharing → Remote Login
sudo systemsetup -getremotelogin

# Sincronizar cambios
git pull origin main
5. Estado Actual del Proyecto
Componente	Estado	Notas
Repositorio GitHub	✅	johanjaguardev/tendencIA
README	✅	Actualizado completo
Project Board	✅	Columnas configuradas
Milestones	✅	3 creados (Phase 0, 1, 2)
Issues	✅	8 issues + 1 de documentación
ThinkPad T490	✅	Repositorio clonado, Git configurado
MacBook Pro 2019	✅	Repositorio clonado, SSH configurado
SSH ThinkPad ↔ Mac	✅	Verificado y funcionando
.gitignore	✅	Configurado para macOS
Estructura de carpetas	✅	docs/, prompts/, data/
6. Enlaces Rápidos
Repositorio: https://github.com/johanjaguardev/tendencIA

Issues: https://github.com/johanjaguardev/tendencIA/issues

Project Board: https://github.com/johanjaguardev/tendencIA/projects

Milestones: https://github.com/johanjaguardev/tendencIA/milestones

7. Próximos Pasos (Domingo 26 de Julio)
Phase 1 — Infrastructure & Setup
□ #2: Install AnythingLLM on ROG Ally X
□ #3: Create SENA Workspace in AnythingLLM
□ #4: Setup document flow prompts
□ #5: Validate connectivity ThinkPad ↔ Ally X
Fase de Preparación para la Semana
□ Revisar el estado de los issues
□ Planificar las tareas de la semana (Lunes 27 - Viernes 31)
□ Confirmar fechas con el calendario del proyecto
8. Notas para la Próxima Sesión
Ambos equipos están sincronizados con el mismo repositorio

Cualquier cambio debe hacerse desde la rama main y subirse a GitHub

Los issues deben moverse en el Project Board según su estado

La documentación debe ir a docs/bitacoras/ con formato bitacora-YYYY-MM-DD.md

Bitácora generada al finalizar la sesión del Sábado 25 de Julio de 2026.
Próxima sesión: Domingo 26 de Julio — AnythingLLM + Workspace SENA
