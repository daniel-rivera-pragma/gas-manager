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
gasm add:lib
```

> **Nota:** Solo se puede ejecutar el comando `gasm add:lib` en la raíz de un proyecto iniciado (que tenga el archivo `.clasp.json` y las carpetas que se crean al hacer `gasm init`)

A continuación se listan las clases utilitarias que se incluyen y su proposito:

- `DependencyManager`: Esta clase esta pensada para extenderse en una clase `AppContainer` que sirva para registrar las factorias de las clases mediante el método `register`, de modo que puedan luego instanciarse eficientemente mediante el uso del método `resolve`.
