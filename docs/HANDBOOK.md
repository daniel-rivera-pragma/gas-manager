# Manual de Uso del Artefacto

Este manual aborda los principales aspectos para el correcto uso de este artefacto.

## Creando una Nueva Aplicación

1. **Crea un nuevo proyecto en Google Apps Script:** Ve a [script.google.com](https://script.google.com) y crea un nuevo proyecto. Anota su **Script ID** desde la configuración del proyecto.
2. **Inicializa el proyecto con el comando `gasm`:**

    ```bash
    # Ubicarse en la ruta donde quiere crear el proyecto
    gasm init <nombre-app>
    ```

3. **Instala las dependencias de `npm`:** Una vez inicializado, debes ingresar al proyecto e instalar las dependencias de NPM.

    ```bash
    # Ubicarse dentro de la carpeta del proyecto
    cd <directorio-app>
    # Instalar dependencias
    npm install
    ```

4. **Inicializa el proyecto con `clasp`:**
    Una vez que tengas el Script ID de tu nuevo proyecto de Apps Script, navega a la carpeta de tu nueva aplicación y usa `clasp clone` para inicializarla. Esto creará el archivo `.clasp.json` y descargará el `appsscript.json`.

    ```bash
    cd <nombre-app>
    clasp clone "TU_SCRIPT_ID" --rootDir src
    ```

    Asegúrate de reemplazar `"TU_SCRIPT_ID"` con el ID real de tu proyecto. El `appsscript.json` es crucial para la configuración del proyecto en Google Apps Script.

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

- `dependency-manager`: Habilita el uso de la clase `DependencyManager`, que sirve como un administrador de dependencias con el que gestionar el cableado entre las clases que se usen en el código.
- `spreadsheets-manager`: Habilita el uso de la clase `SpreadsheetsManager`, que permite envolver la logica de gestión de datos mediante Google Spreadsheets, considerando que cada hoja del archivo puede ser usada como una tabla de datos. Realiza validaciones de integridad en la estructura de los datos y permite un CRUD completo (get, save, insert, update, replace y delete). Necesita el scope `https://www.googleapis.com/auth/spreadsheets` para funcionar correctamente.
- `cache-manager`: Habilita el uso de la clase `CacheManager`, que sirve como gestor de memoizacion del retorno de cualquier método en cualquier clase y su limpieza. Establece métodos básicos de administracion (set, get y flush) para establecer, recuperar y eliminar métodos del cache. Además una metodo recomendado de orden superior (handle) que envuelve la ejecución de un método interno de una clase para manejarlo a través del cache.
- `app-client`: Habilita el uso de la clase `AppClient`, que sirve para enviar solicitudes POST a otras Apps de Google Apps Script implementadas como WebApp, simplemente especificando el id de la implementación y además, gestionando el envío de OAuth token cuando así se requiera. Necesita los scopes `https://www.googleapis.com/auth/script.external_request` y `https://www.googleapis.com/auth/drive` para funcionar correctamente.
