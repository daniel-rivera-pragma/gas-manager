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
    clasp clone "TU_SCRIPT_ID" --rootDir src
    ```

    Asegúrate de reemplazar `"TU_SCRIPT_ID"` con el ID real de tu proyecto. El `appsscript.json` es crucial para la configuración del proyecto en Google Apps Script.
