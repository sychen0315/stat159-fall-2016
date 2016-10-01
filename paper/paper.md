# Stat159 Project 1    
Author: Siyu Chen  
Date:   Sep 30, 2016  

![stat159-logo](/Users/seeuchan/Documents/Stat 159/stat159-fall2016-project1/images/stat159-logo.png)


## Abstraction

This paper introduces several useful tools I learned from this class so far and how to use them to do this project, including Makefile, Git, GitHub, pandoc and Markdown. Not only I will explain the role they play, but also I will provide some basic examples to illustrate how I use them.

## Introduction

The need for reproducibility is increasing dramatically as data analyses become more complex, involving larger  datasets and more sophisticated computations. Reproducible research, which is published with data and code, allows others to verify the findings and build upon them. So by taking this class, I hope to learn more about how to conduct reproducible research.

There are several tools which play important roles in reproducible research, including but not limited to Makefile, Git, GitHub, pandoc and Markdown. Some of them are just learned from this class. So in this project, I will practice using these tools and discuss their roles in this project in this paper. The scope of this project is to write a paper about how to use these tools to do this project.

Also for those who are not familiar with these tools or even not familiar with coding, I hope this paper will be helpful for them to get a better understanding of reproducible research. 


## Discussion

### Unix Command
Unix commands are very convenient. I use Unix command to build the structure of this project.

First, I will create the main directory of this project named as `stat159-fall2016-project1`:
	
	mkdir stat159-fall2016-project1

Then, I go into this directory and create other things:

	cd stat159-fall2016-project1  
	mkdir paper
	mkdir images
	touch .gitignore
	touch README.md
	touch Makefile

Then, I go into `paper` directory to keep building:

	cd paper
	mkdir sections
	cd sections
	touch 00-abstract.md
	touch 01-introduction.md
	touch 02-discussion.md
	touch 03-conclusions.md
	
After that, I go back to main directory and go into `images` directory to download images:

	cd ../..
	cd images
	curl -o images/git-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/git-logo.png
	curl -o images/github-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/github-logo.png
	curl -o images/markdown-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/markdown-logo.png
	curl -o images/pandoc-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/pandoc-logo.png
	curl -o images/stat159-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/stat159-logo.png
	
After I have done each part of my paper, I can combine them to one file easily:
	
	cat sections/00-abstract.md sections/01-introduction.md sections/02-discussion.md sections/03-conclusions.md > paper.md


### Makefile 

--- 

#### Overview
Make, also know as GNU Make, is a tool which allows to automate things. For now, we just use it for automating tasks but we can also use it for compiling.

It's very useful when you want to reproduce other's projects. By running Makefile, it can automatically set up, such as creating directories, downloading necessary source files or running codes. It saves you a lot of time and makes your life easier by finishing tedious tasks for you.

For this project, I use `Makefile` to automate some tasks, like building the structure, downloading images, creating paper html and removing everything. 

#### Illustration
First, let's look at targets of my `Makefile`:

	.Phony:download_images create_gitignore clean

	all: download_images create_gitignore  create_paper convert_md2htmll
	
By default, Makefile targets are **file targets**, which are used to build files from other files. But here some of my targets are simply names of a recipe. They are **Phony** targets. Also, `all` is simply a "label" to indicate a series of dependencies.

	download_images: 
		curl -o images/git-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/git-logo.png
		curl -o images/github-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/github-logo.png
		curl -o images/markdown-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/markdown-logo.png
		curl -o images/pandoc-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/pandoc-logo.png
		curl -o images/stat159-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/stat159-logo.png

`download_images` target is to download images.

	create_gitignore:
		touch .gitignore
`create_gitignore` target is to create gitignore file.

	create_paper: paper/sections/00-abstract.md paper/sections/01-introduction.md paper/sections/02-discussion.md paper/sections/03-conclusions.md
	cat paper/sections/00-abstract.md paper/sections/01-introduction.md paper/sections/02-discussion.md paper/sections/03-conclusions.md > paper/paper.md

`create_paper`: concatenate all parts to form a whole `paper.md` file.

	convert_md2html: paper/paper.md
	pandoc -s paper/paper.md -o paper/paper.html 
`convert_md2html`: convert markdown format to html format by Pandoc

	clean:
		rm -rf images
		rm -rf paper
		rm .gitignore
`clean` target is to remove everything.
 
#### Tutorial about basics of GNU Make
If you are interested in more about Make, this is a good [link](https://github.com/unix-tools/tutorial-makefiles) to explore by yourself. This tutorial is written by our lovely Stat 159 instructor: Gaston. 


### Git

---

![Git logo](/Users/seeuchan/Documents/Stat 159/stat159-fall2016-project1/images/git-logo.png)

#### Overview
Git is a version control system which is use for software development and other version control tasks. As with most other distributed version control systems, every Git directory on every computer is a full-fledged repository with complete history and full version-tracking capacities.

Its advantages include but not limited to:

 * Collaboration: With a Version Control System, everybody one the team is able to work absolutely freely - on any file at any time. The VCS will later allow you to merge all the changes into a common version.
 * Restoring Previous Versions: If the changes you have made lately prove to be useless, you can simply undo them by VCS.
 * Knowing What Happened: Every time you save a new version of your project, your VCS requires you to provide a short description of what was changed. This helps you understand how your project changed between versions.

#### How I use this Git in this project
First, I need to initialize a local repo that Git can store versions of our files:

	git init
	
`.git` will appear if you call `ls -a`. Git stores information about the project in this special sub-directory. 

Now, I show how to use Git to keep track of `Makefile` as an example, which also can apply to other files.

Suppose I just create a `Makefile`, I can check the status of my project:

	git status
	
Git will show `Makefile` is untracked which means that there's a file in the directory that Git isn't keeping track of. 

We can tell Git to track a file:

	git add Makefile
	
If I call `git status` again, Git will show it hasn't recorded changes as a commit yet. I can do:
	
	git commit -m "commit Makefile"

Git stores a copy permanently inside the special `.git` directory. This permanent copy is called a commit. I can use `-m` flag to record a short, descriptive, and specific comment that will help me remember later on what I did and why.

#### More about Git

What I introduce is very simple and basic. If you want to know about Git, like exploring history, ignoring things or collaborating, you can go to this [link](http://swcarpentry.github.io/git-novice/).
	

### GitHub

---


![github-logo](/Users/seeuchan/Documents/Stat 159/stat159-fall2016-project1/images/github-logo.png)

#### Overview
GitHub is a Git repository hosting service, but it adds many of its own features. While Git is a command line tool, GitHub provides a Web-based graphical interface. 

#### How I use GitHub
First, I need to create a remote repo through GitHub website. This repository is going to be where I collaborate with others and course staff looks at my work.

Then I need to build a connection between local repo and remote repo like the following:

	git remote add origin <REMOTE_URL>
	
`git remote add` command will match a remote URL (in this case, my remote repo URL) with a name as "origin".

Then, I can just update my master branch of remote repo in GitHub using my newest local repo like the following. 

(Notice: In order to update local repo, we can use the same method I introduced in Git part.)

	git push origin master
	
Now, my repo in GitHub gets updated. If my teammates want to add on something, they can just update their local repo according to remote repo:

	git pull origin master
	

#### More about GitHub
You can find more or explore yourself on [GitHub](https://github.com) website.

### Pandoc

---

![pandoc-logo](/Users/seeuchan/Documents/Stat 159/stat159-fall2016-project1/images/pandoc-logo.png)

#### Overview
Pandoc is your swiss-army knife if you need to convert files from one markup format into another. Pandoc can convert documents in markdown, HTML, LaTeX and so on to HTML formats, Word processor formats, PDF via LaTeX and others.

For my project, I mainly use Pandoc to convert markdown files to HTML and PDF files. It's very easy to use if you want to get other formats. 

#### How I use Pandoc
Assume now I finish my paper and have a `paper.md` file. I can use Pandoc like the following to get paper file in HTML formats:

	pandoc -s paper.md -o paper.html 

**Notice**: I know how to use Pandoc, but the HTML and PDF files converted from Pandoc have some minor format issues. Export option provided by MacDown (Text editor) is better I think. 

#### More about Pandoc
You can always learn more from [Pandoc](http://pandoc.org/getting-started.html#step-6-converting-a-file) official website.


### Markdown

![Makefile logo](/Users/seeuchan/Documents/Stat 159/stat159-fall2016-project1/images/markdown-logo.png)


#### Overview
By wikipedia, Markdown is a lightweight markup language with plain text formatting syntax designed so that it can be converted to HTML and many other formats using a tool by the same name.

My own understanding is that Markdown is a language which is very easy to use and can be converted to other formats easily. For this paper, I write my paper in Markdown.

#### More about Markdown
You can learn more about Markdown through this [Interactive online markdown tutorial](http://www.markdowntutorial.com). [Here](https://stackedit.io/editor) is an online text editor that you can try to write in Markdown.

### Some thoughts

---

If you did not use these tools before, don't worry; I was as same as you a while ago. Resources I put at the end of each part are very useful and friendly to new users. I also learned by myself through those resources.

For this project, I don't thing there are anything particularly challenging. I just write down how I did this project. It's very straightforward. The most time consuming part is to write this paper. It took me like 5 to 6 hours.

At last, I want to thank people who wrote those useful online resources. I learned and get a lot from them.




## Conclusion
This project is very interesting for me because it involves a lot of interesting tools. It's good to get some practice with using them. I really get a feeling that these tools are super helpful. I will keep using them and learn how to use them in future. 

