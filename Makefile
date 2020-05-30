# commands
LUA := lua
LUACHECK := luacheck
ZIP := zip -r

# directories
FACTORIO_MODS := ~/.Factorio/mods

# override the above with local values in the optional local.mk
-include local.mk

PACKAGE_NAME := $(shell jq -r .name info.json)
VERSION_STRING := $(shell jq -r .version info.json)

OUTPUT_NAME := "$(PACKAGE_NAME)_$(VERSION_STRING)"
OUTPUT_DIR := "build/$(OUTPUT_NAME)"

all: clean verify package install_mod

release: clean verify package install_mod tag

package:
	mkdir -p "$(OUTPUT_DIR)"
	$(LUA) package.lua
	cd build && $(ZIP) $(OUTPUT_NAME).zip $(OUTPUT_NAME)

clean:
	rm -rf build/

verify:
	$(LUACHECK) .

install_mod:
	if [ -d $(FACTORIO_MODS) ]; then \
		rm -rf $(FACTORIO_MODS)/$(OUTPUT_NAME) ; \
		cp -R build/$(OUTPUT_NAME) $(FACTORIO_MODS) ; \
	fi;

tag:
	git tag -f $(VERSION_STRING)
