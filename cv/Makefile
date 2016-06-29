.PHONY: clean all

all:    cv
	@echo  finished

cv: computinglist.tex publist.tex talklist.tex
	rubber --pdf --force --warn all mkmcc-cv

computinglist.tex: convert-computing.sh convert-computing.el ../_data/grants.yml
	./convert-computing.sh
	@echo processed compuing grants to latex

publist.tex: convert-bib.sh convert-bib.el ../_data/my-papers.bib
	./convert-bib.sh
	@echo processed publications for latex

talklist.tex: convert-talks.sh convert-talks.el ../_data/talks.yml
	./convert-talks.sh
	@echo processed talks for latex

clean:
	rubber --clean --pdf mkmcc-cv
	/bin/rm computinglist.tex publist.tex talklist.tex

force_look:
	true
