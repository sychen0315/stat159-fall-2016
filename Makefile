.Phony: all clean

all: build_filesystem download_images create_mds

build_filesystem: 
	mkdir images
	mkdir paper
	mkdir paper/sections


download_images: 
	curl -o images/git-logo.png https://raw.githubusercontent.com/sychen0315/stat159-fall-2016/master/projects/proj01/images/git-logo.png
	curl -o images/github-logo.png https://github.com/sychen0315/stat159-fall-2016/blob/master/projects/proj01/images/github-logo.png
	curl -o images/markdown-logo.png https://github.com/sychen0315/stat159-fall-2016/blob/master/projects/proj01/images/markdown-logo.png
	curl -o images/pandoc-logo.png https://github.com/sychen0315/stat159-fall-2016/blob/master/projects/proj01/images/pandoc-logo.png
	curl -o images/stat159-logo.png https://github.com/sychen0315/stat159-fall-2016/blob/master/projects/proj01/images/stat159-logo.png

create_mds:
	cd paper/sections; touch 00-abstract.md; touch 01-introduction.md; touch 02-discussion.md; touch 03-conclusions.md


clean:
	rm -rf images
	rm -rf paper