ifeq (${lang},php)
    depManager = composer
endif

i := $(subst ${null} ${null},-,$(sort ${installs}))
tag = ${version}-${os}${osVersion}-${depManager}${depManagerVersion}-${i}
image = fefas/stack-ready/${lang}:${tag}

login:
	@docker login ${registry} -u ${username} -p ${password}

publish:
	@docker tag ${image} ${registry}/${image}
	@docker push ${registry}/${image}

build: buildArgs  = VERSION=${version} DEP_MANAGER_VERSION=${depManagerVersion}
build: buildArgs += OS=${os} OS_VERSION=${osVersion} INSTALLS="${i}"
build: dockerfile := -f ${lang}.Dockerfile
build:
	@docker build \
        --no-cache \
        -f ${lang}.Dockerfile \
        -t ${image} \
        $(addprefix --build-arg ,$(buildArgs)) \
       .
