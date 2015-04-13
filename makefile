####################
# Makefile for automated CV creation in various formats
####################


## Setup 
DATE= $(shell date +"%m-%d-%Y")
CV_DIR = .
BASENAME = /MarcoDVisser_CurriculumVitea
MASTER = README.md
MD = $(CV_DIR)$(BASENAME)_$(DATE).md
PDF = $(CV_DIR)$(BASENAME)_$(DATE).pdf
WORD = $(MANUSCRIPT_DIR)$(BASENAME).docx

## functions
RNAME = cp '$<' '$@'


## for now just rename the md files
## I intend to add pandoc code here
all: $(MD)  # $(PDF)

#########################
## main markdownx

$(MD):$(MASTER)
	$(RNAME)
