const fs = require("fs");

const angularPackageJsonPath = "../../package.json";
const angularPackageJson = require(angularPackageJsonPath);
const scriptPath = "sh node_modules/rphm/script.sh";

angularPackageJson.scripts.rphm = scriptPath;

if (angularPackageJson.scripts.rphm) {
  fs.writeFileSync(
    angularPackageJsonPath,
    JSON.stringify(angularPackageJson, null, 2)
  );
} else {
  console.error("La propriété est déjà existante.");
}
