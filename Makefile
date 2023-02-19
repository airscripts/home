SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .sh

# .PHONY: all
# all: build run

.PHONY: submodules
submodules:
	bash ./scripts/miscellaneous/submodules.sh $(environment)

.PHONY: install-bash
install-bash:
	sh ./scripts/install/bash.sh

.PHONY: install-hugo
install-hugo:
	bash ./scripts/install/hugo.sh

.PHONY: install-git
install-git:
	bash ./scripts/install/git.sh $(environment)

.PHONY: install-netlify-cli
install-netlify-cli:
	bash ./scripts/install/netlify-cli.sh