####################
# Makefile for automated CV creation in various formats
####################


## Setup 
DATE= $(shell date +"%m-%d-%Y")
CV_DIR = .
BASENAME = /MarcoDVisser_CurriculumVitea
MASTER = MASTER.md
RSMASTER =  $(CV_DIR)/RS/ResearchStatement.md
MD = $(CV_DIR)/Markdown/$(BASENAME)_$(DATE).md
PDF = $(CV_DIR)/PDF/$(BASENAME)_$(DATE).pdf
WORD = $(CV_DIR)/Word/$(BASENAME)_$(DATE).docx
HTML = $(CV_DIR)/PDF/$(BASENAME)_$(DATE).html 
RSHTML = $(CV_DIR)/RS/RS_$(DATE).html
RSPDF = $(CV_DIR)/RS/RS_$(DATE).pdf
 
## functions
RNAME = cp '$<' '$@' 
PDOC = pandoc -s --smart '$<' -o '$@' 
## for now just rename the md files
## I intend to add pandoc code here
all: $(HTML) $(PDF) $(WORD) $(MD) $(RSHTML) $(RSPDF) README.md

#########################
## main markdownx

$(HTML):$(MASTER) style.css
	pandoc --standalone -c style.css --from markdown --to html -o '$@' '$<'

$(MD):$(HTML)
	$(PDOC)

$(PDF): $(HTML)
	wkhtmltopdf --page-size 'A3' --encoding 'UTF-8' '$<' '$@' 

$(WORD):$(HTML)
	$(PDOC)

$(RSHTML):$(RSMASTER) 
	pandoc --standalone -c style.css --from markdown --to html -o '$@' '$<'

$(RSPDF):$(RSHTML)
	wkhtmltopdf --page-size 'A4' --encoding 'UTF-8' '$<' '$@' 

README.md:$(MD)
	$(RNAME)
