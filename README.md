### Note.

- This library is only available for Angular applications.
- In the near future, React applications will also be supported.

# Installation & Usage

<h3>

1. Installation of the package on your Angular project.

```
npm install rphm
```

2. Script execution for install & update.

```
npm run rphm
```

# Description.

This library promotes atomic design, which involves breaking down user interfaces into elementary components called atoms, molecules, organisms, etc..

This approach fosters code reusability, consistency, and maintainability. The design system file provides the necessary basic elements for building these atoms and their associated components by defining their structure and style.

However, when assembling website pages, it may be necessary to adjust certain visual or functional aspects of the components without altering their basic structure. This is where the library comes into play: by providing a set of additional CSS classes, it allows for the rapid application of predefined styles for elements such as margins, spacing, positioning, etc.

The library and the design system work in synergy, offering a comprehensive and modular approach for frontend development, where the atoms defined in the design system serve as a solid foundation to which the library's classes add functionality and styles specific to the usage context.

Documentation and tutorial for the CSS library are available by opening the french-index.html document.

# Operation.

1. The installation of the package from the root of your Angular project via **Node Package Manager** is mandatory for using the library.

2. To install the library in your Angular project, execute the second command from the root of your application. Each time you wish to update the library, there is no need to repeat step 1; simply execute the second command.

# Details.

<h4>

> 1. Package installation.

- _+1 file_ package.json
- _+1 file_ README.md
- _+1 file_ script.sh
- _+1 file_ update.js

> 2.  Executing the script from the command line.

- Creation of a _folder_ on the desktop.
- Cloning of the library _folder_.
- Transfer of the _file_ **main.css** to the project _folder_.
- Creation of a _file_ **script.js**.
- Execution of the **script.js**.
- Addition of the absolute path of the _file_ **main.css** in **angular.json**.
- Addition of an environment variable to execute the _file_ script.sh with the command **rphm**.
- Adding the **script** to the **package.json** _file_.
- Permanent deletion of the _file_ **script.js**.
- Permanent deletion of the _file_ **script.sh**.
