# Requerimientos Previos

Este artefacto, asume que los siguientes elementos fueron previamente instalados:

## 1. Gestor de Versiones de Node (NVM)

Recomendamos encarecidamente usar [NVM (Node Version Manager)](https://github.com/nvm-sh/nvm) para gestionar las versiones de Node.js y evitar conflictos entre proyectos. Para instalarlo, puedes seguir las instrucciones en su repositorio.

Una vez instalado, instala y utiliza la versión LTS más reciente de Node.js:

```bash
# Instala la última versión LTS (ej. 20.x)
nvm install --lts

# Establece la versión recién instalada como la predeterminada
nvm use --lts
nvm alias default 'lts/*'

# Actualiza la version de NPM
nvm install --latest-npm
```

## 2. Herramientas de Línea de Comandos

- **`@google/clasp`**: La herramienta oficial para gestionar proyectos de Google AppsScript. Instálala de forma global vía npm:

    ```bash
    npm install -g @google/clasp
    ```

- **Gemini CLI**: Esta herramienta se utiliza para interactuar con el asistente de IA que apoya este proyecto. Instálala de forma global vía npm:

    ```bash
    npm install -g @google/gemini-cli
    ```
