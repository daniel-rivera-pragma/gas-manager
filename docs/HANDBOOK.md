# Manual de Uso del Artefacto

Este manual aborda los principales aspectos para el correcto uso de este artefacto.

## Creando una Nueva Aplicación

1. **Crea un nuevo proyecto en Google Apps Script:** Ve a [script.google.com](https://script.google.com) y crea un nuevo proyecto. Anota su **Script ID** desde la configuración del proyecto.
2. **Inicializa el proyecto con el comando `gasm`:**

   ```bash
   # Ubicarse en la ruta donde quiere crear el proyecto
   gasm init <nombre-app>
   ```

3. **Inicializa el proyecto con `clasp`:**
   Una vez que tengas el Script ID de tu nuevo proyecto de Apps Script, navega a la carpeta de tu nueva aplicación y usa `clasp clone` para inicializarla. Esto creará el archivo `.clasp.json` y descargará el `appsscript.json`.

   ```bash
   cd <nombre-app>
   npx clasp clone "TU_SCRIPT_ID" --rootDir src
   ```

   Asegúrate de reemplazar `"TU_SCRIPT_ID"` con el ID real de tu proyecto. El `appsscript.json` es crucial para la configuración del proyecto en Google Apps Script.

## Actualizar archivos de GASM

Cada vez que se quiera, es posible actualizar los archivos de GASM excepto el README. Para ello solo es necesario ejecutar estando dentro del directorio de un proyecto el siguiente comando:

   ```bash
   gasm update
   ```

## Incluyendo libreria de clases utilitarias

Una vez en un proyecto iniciado, se puede añadir mediante un comando un conjunto de clases que pueden agilizar el desarrollo de proyectos con Google Apps Script.

```bash
# Ubicarse en el directorio de un proyecto ya iniciado
cd <directorio-app>
# Agregar o actualizar clases utilitarias
gasm include <lib_name_1> <lib_name_2> ...
```

> **Nota:** Solo se puede ejecutar el comando `gasm include` en la raíz de un proyecto iniciado (que tenga el archivo `.clasp.json` y las carpetas que se crean al hacer `gasm init`)

A continuación se listan los **lib_name** que se pueden usar, cada uno corresponde a un archivo `lib_name.js` que una vez incluido queda ubicado en `src/lib/` de modo que pueda ser usado en el proyecto de Apps Script.

> **Nota:** Si se intenta incluir más de una vez el mismo archivo, lo que se generaría es una "sobre-escritura" del contenido, así que re-inlcuir una librería es el mecanismo adecuado para actualizarla, en caso que haya cambios en la fuente.

- `dependency-manager`

   Habilita el uso de la clase `DependencyManager`, que sirve como un administrador de dependencias con el que gestionar el cableado entre las clases que se usen en el código.

- `spreadsheets-manager`

   Habilita el uso de la clase `SpreadsheetsManager`, que permite envolver la logica de gestión de datos mediante Google Spreadsheets, considerando que cada hoja del archivo puede ser usada como una tabla de datos. Realiza validaciones de integridad en la estructura de los datos y permite un CRUD completo (get, save, insert, update, replace y delete). Necesita el scope `https://www.googleapis.com/auth/spreadsheets` para funcionar correctamente.

- `cache-manager`

   Habilita el uso de la clase `CacheManager`, que sirve como gestor de memoizacion del retorno de cualquier método en cualquier clase y su limpieza. Establece métodos básicos de administracion (set, get y flush) para establecer, recuperar y eliminar métodos del cache. Además una metodo recomendado de orden superior (handle) que envuelve la ejecución de un método interno de una clase para manejarlo a través del cache.

- `app-client`

   Habilita el uso de la clase `AppClient`, que sirve para enviar solicitudes POST a otras Apps de Google Apps Script implementadas como WebApp, simplemente especificando el id de la implementación y además, gestionando el envío de OAuth token cuando así se requiera. Necesita los scopes `https://www.googleapis.com/auth/script.external_request` y `https://www.googleapis.com/auth/drive` para funcionar correctamente.

## Gestionando diferentes ambientes

Lo mencionado en la sección "Creando una Nueva Aplicación" representa la forma más elemental de trabajar con GAS, sin embargo, GASM proporciona herramientas para manejar diferentes apps de GAS conectadas a un mismo repositorio de código. Esto le logra mediante los comandos descritos a continuación:

- `gasm add ${env_name} ${env_id}`

   Este comando permite conectar el repositorio a diferentes apps como si fueran ambientes aislados de la misma aplicación, proporcionando para cada una un `env_name` que correspondería al nombre del ambiente (pdn, dev, qa, etc) y un `env_id` que correspondería al ID de la app de GAS.

- `gasm switch ${env_name}`

   Este comando permite alternar entre diferentes apps de GAS configuradas en el repositorio para ejecutar tareas mediante el CLI de GAS.

- `gasm list`

   Listar las apps configuradas en el repositorio, disponibles para usarse con los demás comandos de gestion de GASM.

- `gasm push ${env_name}`

   Permite ejecutar de forma segura el comando `npm run push` asegurando que antes de la ejecución se realice un cambio de apuntamiento hacia la app de GAS configurada con el `env_name` especificado.
