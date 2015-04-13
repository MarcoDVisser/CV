####################
# Makefile for automated CV creation in various formats
####################


## Setup 
DATE= $(shell date +"%m-%d-%Y")
CV_DIR = .
BASENAME = /MarcoDVisser_CurriculumVitea
MASTER = README.md
MD = $(CV_DIR)/Markdown/$(BASENAME)_$(DATE).md
PDF = $(CV_DIR)/PDF/$(BASENAME)_$(DATE).pdf
WORD = $(CV_DIR)/Word/$(BASENAME)_$(DATE).docx

## functions
RNAME = cp '$<' '$@' 
PDOC = pandoc -s --smart '$<' -o '$@' 
## for now just rename the md files
## I intend to add pandoc code here
all: $(MD) $(PDF) $(WORD)

#########################
## main markdownx

$(MD):$(MASTER)
	$(RNAME)

$(PDF):$(MASTER)
	$(PDOC)

$(WORD):$(MASTER)
	$(PDOC)
