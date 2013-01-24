PDFS = $(wildcard *.pdf)
TEXT = $(patsubst %.pdf,%.text,$(PDFS))
CLEAN = $(patsubst %.text,%.clean,$(TEXT))

clean: text $(CLEAN)

%.clean: %.text
	cat $< | ./stuff.pl > $@

text: $(TEXT)

%.text: %.pdf
	java -jar ~/bin/pdfbox-app-1.7.1.jar ExtractText  -encoding UTF-8 $< $@
