#!/bin/bash
chmod +x "$CURRENT_PROJECT/node_modules/rphm/script.sh"

# Définition des variables
DESKTOP_PATH="$HOME/Desktop"
FOLDER_PATH="$HOME/Desktop/rphm_library/"
GIT_CLONE_LIBRARY="git@github.com:raph-bard/css-library.git"
FOLDER_LIBRARY_PATH="$HOME/Desktop/rphm_library/css-library"
FILE_STYLE="$FOLDER_LIBRARY_PATH/main.css"
CURRENT_PROJECT=$(pwd)
LIBRARY_IN_PROJECT="$CURRENT_PROJECT/src/main.css"
FILE_ANGULAR_JSON="$CURRENT_PROJECT/angular.json"
FILE_REACT_JSX="$CURRENT_PROJECT/src/main.jsx"
SCRIPT_JS="script.js"


function check_folder_exist {
    if [ -d "$FOLDER_PATH" ]; then
        echo "🆗 Le dossier 'rphm_library' est existant"
    else
        cd "$DESKTOP_PATH"
        mkdir -p "rphm_library"
        echo "🆗 Le dossier 'rphm_library' a bien été créé"
    fi
}

function clone_library {
    if [ -d "$FOLDER_LIBRARY_PATH" ]; then
        echo "🆗 Le dossier 'library' est existant"
    else
        git clone "$GIT_CLONE_LIBRARY" "$FOLDER_LIBRARY_PATH"
        echo "🆗 Le dossier 'library' a bien été créé"
    fi
}

function move_file_on_project {
    if [ -f "$LIBRARY_IN_PROJECT" ]; then
        echo "🆗 La librairie existe déjà dans votre projet."
    else
        cp "$FILE_STYLE" "$LIBRARY_IN_PROJECT"
        echo "🆗 La librairie a bien été ajoutée a votre projet."
    fi
}

function check_angular_project {
    if [ -f "$FILE_ANGULAR_JSON" ]; then
        echo "🆗 L'application Angular est compatible."
        inject_dependencies_on_angular
    fi

}

function check_react_project {
    if [ -f "$FILE_REACT_JSX" ]; then
      echo "🆗 L'application React est compatible."
      inject_dependencies_on_react
    fi
}

# Creation de script.js
function inject_dependencies_on_angular {
cd "$CURRENT_PROJECT/"
touch script.js

cat <<EOF > script.js
const fs = require("fs");

/* Variable de dossier et fichier. */
let projectName;
const angularJsonPath = "angular.json";
const packageJson = "package.json";
const libraryPath = "src/main.css";
/* Variable formatage. */
let angularJsonContent = fs.readFileSync(angularJsonPath, "utf8");
let angularJson = JSON.parse(angularJsonContent);

function getProjectName() {
  try {
    const projectKeys = Object.keys(angularJson.projects);
    projectName = projectKeys[0];
    return projectName;
  } catch (error) {
    console.error(
      "Une erreur s'est produite lors de la lecture de angular.json :",
      error
    );
    return projectName;
  }
}

if (projectName) {
  console.log(projectName);
}

function insertLibraryPath() {
  try {
    if (!projectName) {
      console.log(
        "❌ Le nom du projet n'a pas été trouvé dans angular.json..........."
      );
      return;
    } else {
      console.log(`🆗 Le projet ${projectName} est existant.`);
    }
    

    const pathToInjectDependences =
      angularJson.projects[projectName].architect.build.options.styles;

    if (pathToInjectDependences[0] !== libraryPath) {
      pathToInjectDependences.unshift(libraryPath);
      fs.writeFileSync(angularJsonPath, JSON.stringify(angularJson, null, 2));
      console.log(`🆗 La librairie à bien été ajouté aux dépendences.`);
    } else {
      console.log(`🆗 La librairie se trouve déjà dans les dépendences.`);
    }
  } catch (error) {
    console.log(
      "❌ Une erreur s'est produite lors de la lecture/écriture de angular.json :",
      error
    );
  }
}

getProjectName();
insertLibraryPath();
EOF

  node "$SCRIPT_JS"
}

function inject_dependencies_on_react {
cd "$CURRENT_PROJECT/"
touch script.js

cat <<EOF > script.js
import fs from "fs";

const reactJsxPath = "./src/main.jsx";
const libraryPath = 'import "./main.css";';

function insertLibraryPath() {
  try {
    let reactJsxContent = fs.readFileSync(reactJsxPath, "utf8");
    if (!reactJsxContent.includes(libraryPath)) {
      reactJsxContent = libraryPath + "\n" + reactJsxContent;
      fs.writeFileSync(reactJsxPath, reactJsxContent);

      console.log("🆗 La librairie a été ajoutée aux dépendances.");
    } else {
      console.log("🆗 La librairie se trouve déjà dans les dépendances.");
    }
  } catch (error) {
    console.log(
      "❌ Une erreur s'est produite lors de la lecture/écriture de main.jsx:",
      error
    );
  }
}

insertLibraryPath();
EOF

  node "$SCRIPT_JS"
}

# Destruction de dossiers et fichiers.
function self_destruction {
    echo "✔️ La librairie est correctement installée."
    rm -rf "$CURRENT_PROJECT/script.js"
    rm -rf "$FOLDER_PATH"
    echo "🔥 Auto-destruction iminente."
}

# Appel des fonctions
check_folder_exist
clone_library
move_file_on_project
check_angular_project
check_react_project
self_destruction