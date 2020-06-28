SPACE = $() $()
COMMA = $(),$()

packs := $(sort $(packages))

lang  = $(MAKECMDGOALS)
tag = $(version)-$(os)-$(extra-tag)-$(subst $(SPACE),-,$(packs))
image = fefas/stack-ready/$(lang):$(tag)

build: base-args = VERSION=$(version) OS=$(os) OS_PACKS="$(os-packs)"
build: args = $(subst $(COMMA),$(SPACE),$(addprefix --build-arg ,$(base-args) $(lang-args)))
build: dockerfile := -f $(lang).Dockerfile
build: name = -t $(image)
build:
	docker build $(dockerfile) $(args) $(name) --no-cache .

push:
	docker push $(registry)/$(image)

php: extra-tag := composer$(composer)
php: os-packs := zip,unzip,netcat-openbsd$(if $(filter postgres, $(packs)),$(COMMA)postgresql-dev)
php: exts-install := $(if $(filter mysql, $(packs)), pdo pdo_mysql)
php: exts-install += $(if $(filter postgres, $(packs)), pdo pdo_pgsql)
php: exts-install := $(subst $(SPACE),$(COMMA),$(strip $(exts-install)))
php: lang-args := COMPOSER_VERSION=$(composer) EXTS_INSTALL="$(sort $(exts-install))"
php: build
