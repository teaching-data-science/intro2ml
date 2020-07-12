# Contributing guide

This guide helps you to get started in working with this repo.

## Workflow

Found a problem? Open an issue.

Fixed a  problem? Create a pull request.

Thank you so much :sunflower:


## ✅ Quickstart

1. [Import](https://github.com/new/import) this repo, install it and make sure
   the app is running locally.
2. Customize the [`meta.json`](meta.json) and
   [`binder/install.R`](binder/install.R).
3. Build a [Binder](https://mybinder.org) from the `binder` branch of this repo.
4. Add content (chapters, exercises and slides) and optionally add separate
   content license.
5. Customize the UI theme in [`theme.sass`](theme.sass) and update images in
   [`static`](static) as needed.
6. Deploy the app, e.g. to [Netlify](https://netlify.com).


### Installing Gatsby on Ubuntu (for the first time):

0. On Windows and Mac you may need to use `yarn` instead of `npm`.
You can also [run the app using Docker](https://ines.github.io/course-starter-python/#creating-your-website-without-installing-dependencies-using-docker-compose).

1. Make sure your Linux distribution is ready to go run an update and an upgrade:

```bash     
sudo apt update 
sudo apt -y upgrade               
```

2. Install `curl`:

```bash 
sudo apt-get install curl
```

3. Download the latest nvm version:

```bash 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
```

4. Confirm this has worked. The output should be a version number.

```bash 
nvm --version
```

5. Set default Node.js version:

```bash       
nvm install 10
nvm use 10              
```

6. Confirm that this worked:

```bash       
npm --version
node --version           
```

7. Installing the Gatsby CLI:

```bash 
npm install -g gatsby-cli
```

8. Create a Gatsby site:

```bash 
gatsby new local-site https://github.com/teaching-data-science/intro2ml
```

9. Change into the working directory:

```bash 
cd local-site
```

10. Start the development mode:

```bash 
gatsby develop
```

You’ll be able to visit the site locally at http://localhost:8000/ for as long as your development server is running.

### Running a previously created Gatsby website:

1. Set default Node.js version:

```bash       
nvm use 10              
```

2. Change into the working directory:

```bash 
cd local-site
```

4. Start the development mode:

```bash 
gatsby develop
```

## How to access different homepage parts?

![code-execution](https://github.com/teaching-data-science/intro2ml/blob/master/static/screenshot.png)

The five indicated parts can be costomized by changing the following files:

1. `static/logo.csv`

2. `src/pages/index.js`

3. `src/components/layout.js`

4. `static/profile.jpg`

5. `meta.json`


## 🎨 Customization

The app separates its source and content – so you usually shouldn't have to dig
into the JavaScript source to change things. The following points of
customization are available:

| Location             | Description                                                                                                                           |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `meta.json`          | General config settings, title, description etc.                                                                                      |
| `theme.sass`         | Color theme.                                                                                                                          |
| `binder/install.R`   | Packages to install.                                                                                                                  |
| `binder/runtime.txt` | YYYY-MM-DD snapshot at MRAN that will be used for installing libraries. [See here](https://github.com/binder-examples/r) for details. |
| `chapters`           | The chapters, one Markdown file per chapter.                                                                                          |
| `slides`             | The slides, one Markdown file per slide deck.                                                                                         |
| `static`             | Static assets like images, will be copied to the root.                                                                                |

### `meta.json`

The following meta settings are available. **Note that you have to re-start
Gatsby to see the changes if you're editing it while the server is running.**

| Setting              | Description                                                                                                                                |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `courseId`           | Unique ID of the course. Will be used when saving completed exercises to the browser's local storage.                                      |
| `title`              | The title of the course.                                                                                                                   |
| `slogan`             | Course slogan, displayed in the page title on the front page.                                                                              |
| `description`        | Course description. Used for site meta and in footer.                                                                                      |
| `bio`                | Author bio. Used in the footer.                                                                                                            |
| `siteUrl`            | URL of the deployed site (without trailing slash).                                                                                         |
| `twitter`            | Author twitter handle, used in Twitter cards meta.                                                                                         |
| `fonts`              | [Google Fonts](https://fonts.google.com) to load. Should be the font part of the URL in the embed string, e.g. `Lato:400,400i,700,700i`.   |
| `testTemplate`       | Template used to validate the answers. `${solution}` will be replaced with the user code and `${test}` with the contents of the test file. |
| `juniper.repo`       | Repo to build on Binder in `user/repo` format. Usually the same as this repo.                                                              |
| `juniper.branch`     | Branch to build. Ideally not `master`, so the image is not rebuilt every time you push.                                                    |
| `juniper.lang`       | Code language for syntax highlighting.                                                                                                     |
| `juniper.kernelType` | The name of the kernel to use.                                                                                                             |
| `juniper.debug`      | Logs additional debugging info to the console.                                                                                             |
| `showProfileImage`   | Whether to show the profile image in the footer. If `true`, a file `static/profile.jpg` needs to be available.                             |
| `footerLinks`        | List of objects with `"text"` and `"url"` to display as links in the footer.                                                               |
| `theme`              | Currently only used for the progressive web app, e.g. as the theme color on mobile. For the UI theme, edit `theme.sass`.                   |

### Static assets

All files added to `/static` will become available at the root of the deployed
site. So `/static/image.jpg` can be referenced in your course as `/image.jpg`.
The following assets need to be available and can be customized:

| File              | Description                                              |
| ----------------- | -------------------------------------------------------- |
| `icon.png`        | Custom [favicon](https://en.wikipedia.org/wiki/Favicon). |
| `logo.svg`        | The course logo.                                         |
| `profile.jpg`     | Photo or profile image.                                  |
| `social.jpg`      | Social image, displayed in Twitter and Facebook cards.   |
| `icon_check.svg`  | "Check" icon displayed on "Mark as completed" button.    |
| `icon_slides.svg` | Icon displayed in the corner of a slides exercise.       |

## ✏️ Content

### File formats

#### Chapters

Chapters are placed in [`/chapters`](/chapters) and are Markdown files
consisting of `<exercise>` components. They'll be turned into pages, e.g.
`/chapter1`. In their frontmatter block at the top of the file, they need to
specify `type: chapter`, as well as the following meta:

```yaml
---
title: The chapter title
description: The chapter description
prev: /chapter1 # exact path to previous chapter or null to not show a link
next: /chapter3 # exact path to next chapter or null to not show a link
id: 2 # unique identifier for chapter
type: chapter # important: this creates a standalone page from the chapter
---

```

#### Slides

Slides are placed in [`/slides`](/slides) and are markdown files consisting of
slide content, separated by `---`. They need to specify the following
frontmatter block at the top of the file:

```yaml
---
type: slides
---

```

The **first and last slide** use a special layout and will display the headline
in the center of the slide. **Speaker notes** (in this case, the script) can be
added at the end of a slide, prefixed by `Notes:`. They'll then be shown on the
right next to the slides. 

### Custom Elements

When using custom elements, make sure to place a newline between the
opening/closing tags and the children. Otherwise, Markdown content may not
render correctly.

#### `<exercise>`

Container of a single exercise.

| Argument     | Type            | Description                                                    |
| ------------ | --------------- | -------------------------------------------------------------- |
| `id`         | number / string | Unique exercise ID within chapter.                             |
| `title`      | string          | Exercise title.                                                |
| `type`       | string          | Optional type. `"slides"` makes container wider and adds icon. |
| **children** | -               | The contents of the exercise.                                  |


#### `<codeblock>`

| Argument     | Type            | Description                                                                                  |
| ------------ | --------------- | -------------------------------------------------------------------------------------------- |
| `id`         | number / string | Unique identifier of the code exercise.                                                      |
| `source`     | string          | Name of the source file (without file extension). Defaults to `exc_${id}` if not set.        |
| `solution`   | string          | Name of the solution file (without file extension). Defaults to `solution_${id}` if not set. |
| `test`       | string          | Name of the test file (without file extension). Defaults to `test_${id}` if not set.         |
| **children** | string          | Optional hints displayed when the user clicks "Show hints".                                  |


#### `<slides>`

Container to display slides interactively using Reveal.js and a Markdown file.

| Argument | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| `source` | string | Name of slides file (without file extension). |


#### `<choice>`

Container for multiple-choice question.

| Argument     | Type            | Description                                                                                  |
| ------------ | --------------- | -------------------------------------------------------------------------------------------- |
| `id`         | string / number | Optional unique ID. Can be used if more than one choice question is present in one exercise. |
| **children** | nodes           | Only `<opt>` components for the options.                                                     |

#### `<opt>`

A multiple-choice option.

| Argument     | Type   | Description                                                                                    |
| ------------ | ------ | ---------------------------------------------------------------------------------------------- |
| `text`       | string | The option text to be displayed. Supports inline HTML.                                         |
| `correct`    | string | `"true"` if the option is the correct answer.                                                  |
| **children** | string | The text to be displayed if the option is selected (explaining why it's correct or incorrect). |

### Setting up Binder

The [`install.R`](binder/install.R) in the repository defines the packages that
are installed when building it with Binder. You can specify the binder settings
like repo, branch and kernel type in the `"juniper"` section of the `meta.json`.
I'd recommend running the very first build via the interface on the
[Binder website](https://mybinder.org), as this gives you a detailed build log
and feedback on whether everything worked as expected. Enter your repository
URL, click "launch" and wait for it to install the dependencies and build the
image.

![Binder](https://user-images.githubusercontent.com/13643239/39412757-a518d416-4c21-11e8-9dad-8b4cc14737bc.png)

### Adding tests

To validate the code when the user hits "Submit", we're currently using a
slightly hacky trick. Since the R code is sent back to the kernel as a string,
we can manipulate it and add tests – for example, exercise `exc_01_02_01.R` will
be validated using `test_01_02_01.R` (if available). The user code and test are
combined using a string template. At the moment, the `testTemplate` in the
`meta.json` looks like this:

```r
success <- function(text) {
    cat(paste("\033[32m", text, "\033[0m", sep = ""))
}

.solution <- "${solutionEscaped}"

${solution}

${test}
tryCatch({
    test()
}, error = function(e) {
    cat(paste("\033[31m", e[1], "\033[0m", sep = ""))
})
```

If present, `${solution}` will be replaced with the string value of the
submitted user code, and `${solutionEscaped}` with the code but with all `"`
replaced by `\"`, so we can assign it to a variable as a string and check
whether the submission includes something. We also insert the regular solution,
so we can actually run it and check the objects it creates. `${test}` is
replaced by the contents of the test file. The template also defines a `success`
function, which prints a formatted green message and can be used in the tests.
Finally, the `tryCatch` expression checks if the test function raises a `stop`
and if so, it outputs the formatted error message. This also hides the full
error traceback (which can easily leak the correct answers).

A test file could then look like this:

```r
test <- function() {
    if (some_var != length(mtcars)) {
        stop("Are you getting the correct length?")
    }
    if (!grepl("print(mtcars$gear)", .solution, fixed = TRUE)) {
        stop("Are you printing the correct variable?")
    }
    success("Well done!")
}
```

The string answer is available as `.solution`, and the test also has access to
the solution code.

---


### How does the repo work?

There are two branches of this repo, which are used for different tasks:

- **master** - this is what the course is served out of via netlify:
  http://r-bootcamp.netlify.com - any changes to exercises in this branch will
  show up on the netlify page. The netlify page uses a JavaScript framework
  called Gatsby to build the pages. Gatsby submits code to binder and receives
  the output. It also handles the code checking. The parts of the repo that are
  handled by Gatsby include:

1. exercises/solutions/tests
2. chapter.md files
3. slides (using reveal.js)

- **binder** - this is what the Binder image is built from. The reason they're
  different is that binder forces a Docker container rebuild when a branch is
  updated. So, if we served our container out of master, it would rebuild
  everytime we modified a `chapter.md` or an exercise. If you need to add
  packages, you will add them to the `binder/install.R` for this branch, and if
  you need to add datasets, you can add them to the `data/` folder. The parts of
  the repo handled by Binder include:

1. datasets in data/ folder (the container needs access to these to load data
   from submitted code)
2. installation instructions in the binder/ folder for installing dependencies

I would say that the easiest thing to do is to occasionally merge `master` into
`binder` when you need to update the data:

Note that rebuilding the binder container can take a little bit of time (usually
on the order of 5 or 10 minutes or so), since it is installing/compiling
`tidyverse` for the container. You can always check the build status of the
container by clicking the badge below and looking at the log.

You can view the binder container here:
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ines/course-starter-r/binder)
or at: https://mybinder.org/v2/gh/ines/course-starter-r/binder


### Adding Packages

If you need to add packages, add the appropriate `install.packages()` statement
into `binder/install.R`. When you do, check that the container was built
properly by clicking the binder link above.

Currently, `tidyverse` is installed in the binder container.
