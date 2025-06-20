# Speaker Design Project Makefile

VENV_DIR = venv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
JUPYTER = $(VENV_DIR)/bin/jupyter

.PHONY: help setup install clean notebook

help:	## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

setup: $(VENV_DIR)/bin/activate	## Create virtual environment and install dependencies

$(VENV_DIR)/bin/activate:
	python3 -m venv $(VENV_DIR)
	$(PIP) install --upgrade pip
	$(PIP) install jupyter numpy scipy matplotlib pandas
	$(PIP) install plotly ipywidgets
	touch $(VENV_DIR)/bin/activate

install: setup	## Install additional packages (alias for setup)

notebook: setup	## Start Jupyter notebook server
	$(JUPYTER) notebook

clean:	## Remove virtual environment
	rm -rf $(VENV_DIR)

requirements: setup	## Generate requirements.txt
	$(PIP) freeze > requirements.txt

.DEFAULT_GOAL := help