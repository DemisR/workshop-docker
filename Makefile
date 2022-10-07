## Marp presentation makefile
#
# This Makefile will generate a Marp presentation from a Markdown file

##---------- Preliminaries ----------------------------------------------------

.POSIX:     # Get relible POSIX behaviour
.SUFFIXES:  # Clear built-in inference rules

##---------- Variables --------------------------------------------------------

PORT:=9990
SOURCE:=./
OUTPUT:=./slides



help: ## Show this help message (default)
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

slides: ## Serve slides
	PORT=$(PORT) marp -s $(SOURCE) 

clean: ## Deletes the presentation PDF
	rm -rf $(OUTPUT)

pdf:  ## generate PDF slides
	mkdir -p $(OUTPUT)/pdf
	marp --input-dir $(SOURCE) --output $(OUTPUT)/pdf --pdf

html:  ## generate html slides
	mkdir -p  $(OUTPUT)/html
	marp --input-dir $(SOURCE) --output $(OUTPUT)/html
