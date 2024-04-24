#!/bin/bash
chmod +x "script.sh"

# Définition des variables
DESKTOP_PATH="$HOME/Desktop"
FOLDER_PATH="$HOME/Desktop/rphm_library/"
GIT_CLONE_LIBRARY="git@github.com:raph-bard/css-library.git"
FOLDER_LIBRARY_PATH="$HOME/Desktop/rphm_library/css-library"
FILE_STYLE="$FOLDER_LIBRARY_PATH/main.css"
CURRENT_ANGULAR_PROJECT=$(pwd)
LIBRARY_IN_ANGULAR_PROJECT="$CURRENT_ANGULAR_PROJECT/src/main.css"
FILE_ANGULAR_JSON="$CURRENT_ANGULAR_PROJECT/angular.json"
SCRIPT_JS="script.js"
SCRIPT_SH="script.sh"


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

function move_file_on_angular {
    if [ -f "$LIBRARY_IN_ANGULAR_PROJECT" ]; then
        echo "🆗 La librairie existe déjà dans le projet Angular"
    else
        cp "$FILE_STYLE" "$LIBRARY_IN_ANGULAR_PROJECT"
        echo "🆗 La librairie a bien été ajoutée au projet Angular"
    fi
}

function check_angular_json {
    if [ ! -f "$FILE_ANGULAR_JSON" ]; then
        echo "❌ Le fichier angular.json n'existe pas."
        return 1
    fi

}

# function add_dependence_on_angular_json {

# cd $CURRENT_ANGULAR_PROJECT
# }

# Creation de script.js
function creating_of_js_script {
cd $CURRENT_ANGULAR_PROJECT
touch script.js

cat <<EOF > script.js
const fs = require("fs");

/* Variable de dossier et fichier. */
let projectName;
const angularJsonPath = "angular.json";
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
      console.log(\`🆗 Le projet \${projectName} est existant.\`);
    }

    const pathToInjectDependences =
      angularJson.projects[projectName].architect.build.options.styles;

    if (pathToInjectDependences[0] !== libraryPath) {
      pathToInjectDependences.unshift(libraryPath);
      fs.writeFileSync(angularJsonPath, JSON.stringify(angularJson, null, 2));
      console.log(\`🆗 La librairie à bien été ajouté aux dépendences.\`);
    } else {
      console.log(\`🆗 La librairie se trouve déjà dans les dépendences.\`);
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

PROJECT_NAME=$(node "$SCRIPT_JS")
    echo "$PROJECT_NAME"
}

function add_commande_line_for_execute {
  if ! grep -q "alias rphm='./node_modules/rphm/script.sh'" ~/.bashrc; then
    echo "alias rphm='./node_modules/rphm/script.sh'" >> ~/.bashrc
    source ~/.bashrc
    echo "Alias 'rphm' ajouté avec succès."
  else
    echo "L'alias 'rphm' existe déjà dans ~/.bashrc."
  fi

  if ! grep -q "alias rphm='./node_modules/rphm/script.sh'" ~/.zshrc; then
    echo "alias rphm='./node_modules/rphm/script.sh'" >> ~/.zshrc
    source ~/.zshrc
    echo "Alias 'rphm' ajouté avec succès."
  else
    echo "L'alias 'rphm' existe déjà dans ~/.zshrc."
  fi
}

# Destruction de dossiers et fichiers.
function self_destruction {
    echo "✔️ La librairie est correctement installée."
    rm -rf "$CURRENT_ANGULAR_PROJECT/script.js"
    rm -rf $FOLDER_PATH
    echo "🔥 Auto-destruction iminente."
    # rm -rf "$CURRENT_ANGULAR_PROJECT/script.sh"
}

# Appel des fonctions
creating_of_js_script
check_folder_exist
clone_library
move_file_on_angular
check_angular_json
add_commande_line_for_execute
# add_dependence_on_angular_json
self_destruction