.PHONY: clean all

all: papers.yml
	@echo finished

papers.yml: convert-bib.el convert-bib.sh my-papers.bib
	./convert-bib.sh
	@echo processed publications for website

clean:
	/bin/rm papers.yml
