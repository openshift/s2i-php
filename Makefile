SKIP_SQUASH?=0
VERSIONS="5.5 5.6"

ifeq ($(TARGET),rhel7)
	OS := rhel7
else
	OS := centos7
endif

ifeq ($(VERSION), 5.5)
	VERSION := 5.5
else ifeq ($(VERSION), 5.6)
        VERSION := 5.6
else
	VERSION :=
endif
.PHONY: build
build:
	SKIP_SQUASH=$(SKIP_SQUASH) VERSIONS=$(VERSIONS) hack/build.sh $(OS) $(VERSION)

.PHONY: test
test:
	SKIP_SQUASH=$(SKIP_SQUASH) VERSIONS=$(VERSIONS) TAG_ON_SUCCESS=$(TAG_ON_SUCCESS) TEST_MODE=true hack/build.sh $(OS) $(VERSION)
