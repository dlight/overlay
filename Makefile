CATEGORIES:=$(wildcard *-*)
EBUILDS:=$(wildcard *-*/* virtual/*)
MANIFESTS:=$(addsuffix /Manifest, $(EBUILDS))

all: ${MANIFESTS} profiles/categories

%/Manifest: %/*.ebuild
	@if [[ $$(dirname "$$(dirname "$@")") != \
		cross-x86_64-pc-linux-gnu ]] && \
	ebuild $(firstword $(wildcard $(dir $@)*.ebuild)) digest && \
	[[ -f "$(firstword $(wildcard $(dir $@)Manifest))" ]]; then \
		touch $(firstword $(wildcard $(dir $@)Manifest)); \
	fi

profiles/categories: ${CATEGORIES}
	echo -e $(addprefix '\n', ${CATEGORIES}) > $@
