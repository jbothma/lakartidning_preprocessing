PDFS = $(shell find corpus -type f -name '*.pdf')
TEXT = $(patsubst %.pdf, %.text, $(PDFS))
CLEANTEXT = $(patsubst %.text, %.cleantext, $(TEXT))

cleantext: text $(CLEANTEXT)

%.cleantext: %.text cleaner
	cat $< | ./cleaner > $@

text: $(TEXT)

%.text: %.pdf
	java -Djava.awt.headless=true -jar ~/bin/pdfbox-app-1.7.1.jar ExtractText -encoding UTF-8 $< $@
