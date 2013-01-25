PDFS = $(wildcard */*/*.pdf)
TEXT = $(patsubst %.pdf,%.text,$(PDFS))
CLEANTEXT = $(patsubst %.text,%.cleantext,$(TEXT))
EXPORT = $(patsubst %.cleantext,%.txt,$(CLEANTEXT))

export: exportdir cleantext $(EXPORT)

exportdir:
	mkdir -p export

%.txt: %.cleantext
	cp $< export/`basename $@`

cleantext: text $(CLEANTEXT)

%.cleantext: %.text
	cat $< | ./cleaner > $@

text: $(TEXT)

%.text: %.pdf
	java -jar ~/bin/pdfbox-app-1.7.1.jar ExtractText  -encoding UTF-8 $< $@
