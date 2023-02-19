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

.PHONY: install-npm
install-npm:
	bash ./scripts/install/npm.sh

.PHONY: install-netlify-cli
install-netlify-cli:
	bash ./scripts/install/netlify-cli.sh

.PHONY: ci-verify
ci-verify:
	bash ./scripts/ci/verify.sh $(environment)

.PHONY: ci-build
ci-build:
	bash ./scripts/ci/build.sh

.PHONY: ci-deploy
ci-deploy:
	bash ./scripts/ci/deploy.sh $(id) $(token)