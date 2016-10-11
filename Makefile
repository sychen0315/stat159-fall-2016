.Phony:all download_images create_gitignore clean

all:  paper.md paper.html



download_images: 
	curl -o images/git-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/git-logo.png
	curl -o images/github-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/github-logo.png
	curl -o images/markdown-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/markdown-logo.png
	curl -o images/pandoc-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/pandoc-logo.png
	curl -o images/stat159-logo.png https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/stat159-logo.png


create_gitignore:
	touch .gitignore

paper.md: paper/sections/00-abstract.md paper/sections/01-introduction.md paper/sections/02-discussion.md paper/sections/03-conclusions.md
	cat paper/sections/00-abstract.md paper/sections/01-introduction.md paper/sections/02-discussion.md paper/sections/03-conclusions.md > paper/paper.md


paper.html: paper/paper.md
	pandoc -s paper/paper.md -o paper/paper.html 

clean:
	rm -rf paper/paper.md  paper/paper.html