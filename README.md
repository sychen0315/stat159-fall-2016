# Project Name
Stat159 Project 1    

# Author
Siyu Chen

# Structure
The structure of this project:

	stat159-fall2016-project1/
    .gitignore
    README.md
    Makefile
    paper/
        sections/
            00-abstract.md
            01-introduction.md
            02-discussion.md
            03-conclusions.md
        paper.md
        paper.html
    images/
        git-logo.png
        github-logo.png
        markdown-logo.png
        pandoc-logo.png
        stat159-logo.png

* `stat159-fall2016-project1`: all contents of this project are in this directory.
* `.gitignore`: contains all files that you don't want Git to check in to GitHub. 
* `README.md`: describes the project's structure, author's name and license.
* `Makefile`: contains two targets: the html paper `paper.html`, and a `clean` phony target that removes the html file. In my `Makefile`, I also include some other targets to download images and create the structure of this project.
* `paper`: contains all markdown files, the final paper markdown file and the paper html file created by using pandoc.
* `images`: contains all images needed in paper.

# How to reproduce

First, you need to create the structure. More information about how to create such structure can be found in Unix Command part of Dicussion section.

Then, you just need to run `make` command. It will automatically download images, concatenate all parts to one `paper.md` and convert `paper.md` to `paper.html`.

By calling `make clean`, you will remove everything.

# License
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).