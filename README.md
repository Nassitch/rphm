### Note.

- This library is only available for Angular applications.
- In the near future, React applications will also be supported.

# Installation & Usage

<h3>
1. Installation of the package on your Angular project.

```
npm install rphm
```

2. Script execution (first usage only).

```
./node_modules/rphm/script.sh
```

3. Script execution (from the second usage).

```
> rphm
```

# Operation.

1. The installation of the package from the root of your Angular project via **Node Package Manager** is mandatory for using the library.

2. Upon the first usage of the library on your computer, you must manually navigate to the package to execute the script file from your terminal.

3. After the initial launch of the **script.sh** on your project, a function runs adding an environment variable on your computer allowing to execute this script file on any Angular project with the command **rphm**, provided that the package is installed.

# Details.

<h4>

> 1. Package installation.

- _+1 file_ package.json
- _+1 file_ README.md
- _+1 file_ script.sh

> 2.  Execution of the script from the relative path.

- Creation of a _folder_ on the desktop.
- Cloning of the library _folder_.
- Transfer of the _file_ **main.css** to the project _folder_.
- Creation of a _file_ **script.js**.
- Execution of the **script.js**.
- Addition of the absolute path of the _file_ **main.css** in **angular.json**.
- Addition of an environment variable to execute the _file_ script.sh with the command **rphm**.
- Permanent deletion of the _file_ **script.js**.
- Permanent deletion of the _file_ **script.sh**.

> 3. Execution of the script using the command _rphm_.

- Creation of a _folder_ on the desktop.
- Cloning of the library _folder_.
- Transfer of the _file_ **main.css** to the project _folder_.
- Creation of a _file_ **script.js**.
- Execution of the **script.js**.
- Addition of the absolute path of the _file_ **main.css** in **angular.json**.
- Permanent deletion of the _file_ **script.js**.
- Permanent deletion of the _file_ **script.sh**.
