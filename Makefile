CATEGORIES:=$(wildcard *-*)
EBUILDS:=$(wildcard *-*/*)
MANIFESTS:=$(addsuffix /Manifest, $(EBUILDS))

all: ${MANIFESTS} profiles/categories

%/Manifest: %/*.ebuild
	@if [[ $$(dirname "$$(dirname "$@")") != \
		cross-x86_64-pc-linux-gnu ]]; then \
		ebuild $(firstword $(wildcard $(dir $@)*.ebuild)) digest && \
		touch $(firstword $(wildcard $(dir $@)Manifest)); \
	fi

profiles/categories: ${CATEGORIES}
	echo -e $(addprefix '\n', ${CATEGORIES}) > $@
