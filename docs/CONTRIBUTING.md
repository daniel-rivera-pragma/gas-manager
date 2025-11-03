# Lineamientos de Contribución y Desarrollo

Para asegurar un proceso fluido y colaborativo, por favor sigue estas directrices.

## Modelo de Ramas: Scaled Trunk Based Development

Este proyecto sigue una estrategia de **Scaled Trunk Based Development (TBD)**. Esto significa que todos los cambios se integran continuamente en una única rama principal (`main`), que siempre debe estar en un estado desplegable. Las `features` se desarrollan en ramas de corta duración que se originan y se fusionan de nuevo en `main`.

Para más información sobre este modelo, puedes consultar [trunkbaseddevelopment.com](https://trunkbaseddevelopment.com/).

## Convenciones de Nomenclatura

Para mantener la consistencia y la legibilidad en todo el proyecto, seguimos convenciones estrictas para nombrar ramas, mensajes de commit y títulos de Pull Request.

### Nomenclatura de Ramas

Nombra tu rama usando un prefijo que indique su propósito general, seguido de una descripción corta separada por guiones. Esto ayuda a entender rápidamente el objetivo de cada rama.

- `feat/...`: Para nuevas funcionalidades (ej. `feat/autenticacion-google`).
- `issue/...`: Para la solución de errores o problemas específicos (ej. `issue/bug-reporte-vacio`).
- `support/...`: Para tareas de mantenimiento, actualizaciones de dependencias, configuraciones o soporte general (ej. `support/actualizar-dependencias-eslint`).

### Mensajes de Commit

Utilizamos una versión simplificada de Conventional Commits. El formato es `<TIPO>: <Descripción>`.

- **`<TIPO>`**: Un prefijo en mayúsculas que describe la naturaleza del cambio.
  - `ADD`: Para añadir una nueva funcionalidad, archivo o dependencia.
  - `DEL`: Para eliminar una nueva funcionalidad, archivo o dependencia.
  - `UPD`: Para cambios que modifican funcionalidades, archivos o dependencias existentes.
  - `FIX`: Para corregir un bug.
  - `FORMAT`: Para cambios que actualizan archivos solo para gestionar formato, sin aportar o modificar funcionalidad.
  - `REFACTOR`: Para cambios en el código que no arreglan un bug ni añaden una funcionalidad.
  - `DOCS`: Para cambios en la documentación.
  - `TEST`: Para añadir o mejorar pruebas.
  - `CONF`: Para tareas de mantenimiento, configuración o builds.
  - `INIT`: Usado únicamente para el commit inicial del proyecto.

- **`<Descripción>`**: Una descripción corta y en imperativo del cambio.

**Ejemplo:** `ADD: Agregar sistema de autenticación de usuarios`

## Flujo de Trabajo Detallado

1. **Actualiza tu entorno de trabajo**
   Siempre inicia tu flujo desde el estado actual y limpio del repo:

   ```bash
   git fetch origin
   git remote prune origin
   ```

2. **Crea y Publica tu Rama:**
   Para partir de la última versión de `main` sin tener una copia local, usa:

   ```bash
   git switch -c feat/nombre-descriptivo origin/main
   git push -u origin feat/nombre-descriptivo
   ```

3. **Desarrolla y Comitea:**
   Realiza tus cambios y commitea siguiendo la convención de mensajes.

   > **NOTA:** Antes de confirmar cualquier cambio, asegurate que todas las verificaciones de calidad definidas sean ejecutadas y pasen correctamente.
   >
   > - Formateo (Ej. Prettier)
   > - Linter (Ej. Eslint)
   > - Chequeo de Tipos (Ej. TypeScript)
   > - Pruebas Unitarias (Ej. Jest)

4. **Mantén tu Rama Actualizada (rebase):**
   Antes de crear tu PR, actualiza tu rama con los últimos cambios de `main`:

   ```bash
   git fetch origin
   git rebase origin/main
   ```

   Resuelve cualquier conflicto en tu rama. Esto mantiene el historial limpio.

5. **Crea el Pull Request (PR):**
   Con tu rama lista y actualizada, envía un Pull Request a `main`. Utiliza la plantilla de PR y sigue la convención para el título.

## Guía para Pull Requests

### Título del PR

El título de tu Pull Request debe ser conciso y seguir el formato:

`PR: <Descripción básica del PR>`

**Ejemplo:** `PR: Implementar autenticación de usuarios`

### Plantilla de Descripción

Cuando crees un Pull Request, por favor, utiliza la siguiente plantilla para la descripción:

```markdown
## Descripción

<!-- Una o dos frases que expliquen el propósito de este PR. -->

## Cambios Realizados

- <!-- Cambio 1 -->
- <!-- Cambio 2 -->
- <!-- ... -->
```

## Ciclo de Vida de la Rama (Post-Merge)

Una vez que tu Pull Request ha sido fusionado en `main`, es crucial mantener el repositorio limpio.

- **No Reutilizar Ramas:** Las ramas fusionadas nunca deben ser reutilizadas. Para cualquier cambio nuevo, crea una nueva rama desde `main`.
- **Eliminación de la Rama en Origen:** La rama debe ser eliminada del repositorio remoto (`origin`) inmediatamente después del merge. Puedes hacerlo desde la interfaz de tu proveedor de Git o manualmente:

  ```bash
  git push origin :feat/nombre-de-la-rama
  ```

- **Eliminación de la Rama Local:** Borra tu copia local de la rama:

  ```bash
  git branch -d feat/nombre-de-la-rama
  ```
