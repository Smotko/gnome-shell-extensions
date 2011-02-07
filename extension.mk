# Change these to modify how installation is performed
topextensiondir = $(datadir)/gnome-shell/extensions
extensionbase = @gnome-shell-extensions.gnome.org

uuid = $(EXTENSION_ID)$(extensionbase)

extensiondir = $(topextensiondir)/$(uuid)

dist_extension_DATA = extension.js stylesheet.css
nodist_extension_DATA = metadata.json $(EXTRA_EXTENSION)

EXTRA_DIST = metadata.json.in

metadata.json: metadata.json.in
	sed -e "s|[@]LOCALEDIR@|$(datadir)/locale|" \
	    -e "s|[@]uuid@|$(uuid)|" \
            -e "s|[@]shell_current@|$(PACKAGE_VERSION)|" $< > $@

CLEANFILES = metadata.json
