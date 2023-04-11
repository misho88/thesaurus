THESAURI=en_US de_DE

EXE=thesaurus
DESTDIR?=
SHARE?=/usr/local/share/$(EXE)
BIN?=/usr/local/bin

all: $(addsuffix .idx,$(THESAURI))

en_US.dat:
	curl "https://raw.githubusercontent.com/LibreOffice/dictionaries/master/en/th_en_US_v2.dat" > $@

de_DE.dat:
	curl "https://raw.githubusercontent.com/LibreOffice/dictionaries/master/de/th_de_DE_v2.dat" > $@

%.idx: %.dat
	./generate-idx $< > $@

clean:
	rm -f $(addsuffix .dat,$(THESAURI))
	rm -f $(addsuffix .idx,$(THESAURI))

install: all
	install -d $(DESTDIR)$(BIN)
	install $(EXE) $(DESTDIR)$(BIN)
	install -d $(DESTDIR)$(SHARE)
	install $(addsuffix .dat,$(THESAURI)) $(addsuffix .idx,$(THESAURI)) $(DESTDIR)$(SHARE)

uninstall:
	rm -f $(DESTDIR)$(BIN)/$(EXE)
	rmdir --ignore-fail-on-non-empty $(DESTDIR)$(BIN)
	rm -f $(DESTDIR)$(SHARE)/*.dat $(DESTDIR)$(SHARE)/*.idx
	rmdir --ignore-fail-on-non-empty $(DESTDIR)$(SHARE)
