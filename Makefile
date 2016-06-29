.PHONY: clean all

all: cv data

cv: force_look
	cd cv/ ; $(MAKE) all
	@echo made cv

data: force_look
	cd _data/ ; $(MAKE) all
	@echo made data

clean:
	(cd cv/ ; $(MAKE) clean)
	(cd _data/ ; $(MAKE) clean)

force_look:
	true
