# Online course template for R courses

This course template is based on @ines's [R course starter repo](https://github.com/ines/course-starter-r). The front-end is powered by
[Gatsby](http://gatsbyjs.org/) and [Reveal.js](https://revealjs.com) and the
back-end code execution uses [Binder](https://mybinder.org) :heart:

[Deployed website on Netlify](https://trusting-edison-3e928f.netlify.app)


## How to use this template

To create a new course create a fork of this repository and start building :tada:



## Contributors welcome!

Please check out our [contributing guidelines](CONTRIBUTING.md).

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/teaching-data-science/course-template/binder)



## Gatsby-Ubuntu Instructions:

1. Make sure your Linux distribution is ready to go run an update and an upgrade:

sudo apt update
sudo apt -y upgrade

2. Install curl which allows you to transfer data and download additional dependencies:

sudo apt-get install curl

3. After it finishes installing, download the latest nvm version:

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

4. Confirm this has worked. The output should be a version number.

nvm --version

5. Set default Node.js version

nvm install 10
nvm use 10

6. Confirm that this worked:

npm --version
node --version

7. Installing the Gatsby CLI:

npm install -g gatsby-cli

8. Create a Gatsby site:

gatsby new hello-world https://github.com/gatsbyjs/gatsby-starter-hello-world

9. Change into the working directory:

cd hello-world

10. Start the development mode:

gatsby develop


You’ll be able to visit the site locally at http://localhost:8000/ for as long as your development server is running.

Note: There are usually some errors when one tries to run the gatsby. Clearing the npm cache as well as updating old packages can be usefull in such situations:

1. To clear the cache:

npm cache clean --force

2. To find and update the outdated packages, run 

npm outdated

and compare the list of current and wanted versions. Edit the package.json file and run

npm install.