# Contexto del Proyecto — Tienda Virtual (SENA → Negocio Real)

> Este documento resume una sesión de planificación completa. Úsalo como contexto base para continuar el trabajo sin repetir decisiones ya tomadas.

---

## Quién soy

Estudiante del SENA, programa Tecnología en Análisis y Desarrollo de Software. Tengo conocimientos de React, TypeScript, Vite y la Storefront API de Shopify (GraphQL). No soy experto en agentes de IA ni en automatizaciones — parte de la preparación es capacitarme en eso.

---

## El proyecto académico (ya hecho)

- Tienda virtual de **ciclismo**, solo con fines académicos.
- Stack: **React 19 + TypeScript + Vite + Shopify Storefront API (GraphQL)**.
- Demo publicada en GitHub Pages (no operación real, sin clientes ni pagos).
- Repositorio: `github.com/johanjaguardev/SENA-ecommerce`
- Demo: `johanjaguardev.github.io/SENA-ecommerce`
- Cubre el ciclo completo: requerimientos → diseño → implementación → manuales.
- **No se usó tablero de tareas** en esta etapa (seguimiento informal).
- Documentos académicos dispersos en PDF y Word a lo largo del año — pendientes de consolidar.

---

## El proyecto real (nuevo, en planificación)

- Tienda virtual real, **temática por definir (NO será de ciclismo)**.
- Con inversión propia, inventario físico, operación real.
- Misma arquitectura base: **Shopify headless + Storefront API (GraphQL)**.
- Frontend: React, con evaluación de migrar a **Next.js** (más demandado laboralmente, mejor SEO).
- Pagos: **por definir** (Shopify Payments u otro gateway); Wompi que aparece en el repo académico es un error/resabio de plantilla, no una decisión.
- Control de versiones: Git + GitHub.
- Gestión de tareas: **por definir** entre Azure Boards (si el SENA da acceso institucional) o GitHub Projects, organizado por épicas.
- Hay una **convocatoria en agosto de 2026** que marca el inicio formal del desarrollo.

---

## Hardware disponible

| Equipo | RAM | Rol definido |
|---|---|---|
| **ROG Ally X** | 24 GB compartidos (iGPU Radeon 780M, sin VRAM dedicada) | Servidor de IA local en casa (Ollama expuesto en red) |
| **MacBook Pro 15" 2019 (Intel)** | 16 GB | Estación principal de trabajo; cliente de Ollama del Ally X en casa; Ollama local en CPU como respaldo fuera de casa |
| **ThinkPad T490 o E14 Gen 1** | 16 GB (por confirmar) | Pendiente de decidir cuál quedarse; mismo esquema de cliente que el Mac |

**Nota sobre el MacBook Pro 2019:** es Intel, no Apple Silicon. Ollama corre en CPU puro (sin aceleración GPU útil); velocidad ~3-6 tokens/seg. Suficiente para redacción de documentos, no para pair-programming en tiempo real. El Ally X es el servidor porque tiene más RAM.

---

## Stack de IA definido

### IA local (español, documentación académica)
- **Motor:** Ollama, instalado en el ROG Ally X.
- **Modelo:** `qwen2.5:7b` (buen desempeño en español, cabe bien en el Ally X). Alternativa: `qwen2.5:14b` si se necesita más calidad.
- **Interfaz:** AnythingLLM (RAG sobre PDFs/DOCs del SENA, apunta al servidor Ollama del Ally X).
- **Acceso desde otros equipos:** Ollama expuesto en `0.0.0.0:11434`; Mac/ThinkPad apuntan a la IP local del Ally X.
- **Acceso fuera de casa:** Tailscale (gratis hasta 3 dispositivos).
- **Fuera de casa sin Tailscale:** Ollama local en CPU en el Mac (lento pero funcional para documentos).

### IA en la nube (inglés, código)
- **Terminal:** Aider (BYOK, multi-modelo, git integrado nativo con commits automáticos y `/undo`).
- **Modelos rotativos:**
  - `gemini/gemini-2.0-flash` — razonamiento, contexto amplio (API gratuita de Google).
  - `groq/llama-3.3-70b-versatile` — fixes rápidos, inferencia muy rápida (tier gratuito Groq).
  - OpenRouter `:free` — backup cuando se agotan los otros.
- **IDE:** Continue.dev (VS Code) → Gemini API; GitHub Copilot Free como autocompletado adicional.
- **Variables de entorno necesarias:** `GEMINI_API_KEY`, `GROQ_API_KEY`, `OPENROUTER_API_KEY`.

---

## Gestión documental — flujo automatizado de 4 artefactos

Toda la documentación nueva parte de una **fuente única en Markdown**, redactada/consolidada por la IA local (Qwen vía Ollama), y genera automáticamente:

1. **Word parcial** — documento académico puntual (español, normas APA 7.ª ed.).
2. **PDF del Word parcial** — mismo documento exportado a PDF.
3. **PDF consolidado** — documento maestro del proyecto donde cada parcial se encola/anexa.
4. **Wiki en inglés** — misma información traducida, repositorio técnico vivo.

### Normas APA que aplica la IA local (prompt de sistema fijo)
- Citas en texto: autor-fecha `(Apellido, año)`.
- Referencias al final en orden alfabético.
- Títulos jerárquicos Nivel 1-3 APA.
- Times New Roman 12 pt, interlineado doble al exportar a Word.
- Portada con título, autor, institución y fecha.
- Evitar primera persona en el cuerpo del documento.

---

## Equipo de trabajo del proyecto real

| Perfil | Momento | Conocimientos técnicos | Notas clave |
|---|---|---|---|
| **Estudiante** | Todo el proyecto | Desarrollador (React, Shopify, Git) | Dirección técnica y documental |
| **Socio gestor** | Desde mes 3 | Cero programación | Opera el panel admin de Shopify; capacitación desde cero |
| **Freelancer UI** | Mes 2-3 | Diseño UI/UX, Figma, React básico | Solo maquetas y componentes de presentación (sin lógica ni API); entrega componentes "tontos" basados en props |
| **Vendedor** | Mes 6 (lanzamiento) | Cero programación | Atención al cliente y ventas; manual de operación versión ventas |

---

## Cronograma

### Fase de preparación (29 jun – convocatoria agosto 2026)

| Fecha | Actividad |
|---|---|
| 29 jun | Definir tablero de tareas (Azure Boards o GitHub Projects) y estructura de épicas — **primer paso antes que todo** |
| 29 jun – 6 jul | Capacitación en agentes de IA y skills |
| 7 jul – 13 jul | Configurar entorno de desarrollo (editor, terminal, Git, APIs) |
| 7 jul – 13 jul | Configurar servidor Ollama en Ally X + AnythingLLM + flujo de 4 artefactos |
| 14 jul – 20 jul | Definir temática de la tienda y esbozo de catálogo |
| 21 jul – 31 jul | Definir roles y criterios de selección del equipo |
| Agosto 2026 | Resultado de convocatoria → inicio del desarrollo |

### Dedicación semanal (ritmo base)
- **Entre semana:** 2-3 días × 2 horas → documentación.
- **Domingo:** bloque de 4 horas → código.

### Desarrollo (6 meses post-convocatoria)

| Mes | Foco | Hitos clave |
|---|---|---|
| 1 | Arranque | Confirmar convocatoria, cerrar temática, comprar inventario, formalizar roles |
| 2 | Requerimientos | Levantamiento formal, recepción de inventario, contratar freelancer |
| 3 | Diseño y arquitectura | Maquetas, arquitectura definitiva, configurar Shopify, iniciar capacitación socio gestor |
| 4 | Desarrollo e integración | Catálogo, carrito, checkout, pagos reales con Storefront API |
| 5 | Pruebas y documentación | Pruebas integrales, manuales técnico y de operación, revisión legal/fiscal colombiana |
| 6 | Lanzamiento | Publicar tienda, capacitar socio gestor y vendedor, entregar docs al SENA |

---

## Decisiones pendientes (aún sin resolver)

- [ ] Temática definitiva de la tienda (no ciclismo).
- [ ] Tablero: Azure Boards (confirmar acceso SENA) o GitHub Projects.
- [ ] React vs Next.js para el proyecto real.
- [ ] Mecanismo de pago (Shopify Payments u otro gateway colombiano).
- [ ] Cuál ThinkPad quedarse: T490 (2019) vs E14 Gen 1 (2020).
- [ ] Candidatos concretos para socio gestor y vendedor.

---

## Documentos generados en esta sesión

- `Proyecto_Tienda_Virtual_Avance.md` — fuente en Markdown con todo el contexto del proyecto.
- `Proyecto_Tienda_Virtual_APA.docx` — versión Word con normas APA, portada, resumen, índice y conclusiones, para presentar a la profesora.
