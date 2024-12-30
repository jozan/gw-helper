PREFIX ?= $(HOME)/.local
dest = $(DESTDIR)$(PREFIX)
bindir = $(dest)/bin
bin = gw
completionsdir = $(PREFIX)/share/fish/vendor_completions.d
mandir = $(dest)/share/man/man1
manpage = $(bin).1
ASCIIDOCTOR_BIN ?= asciidoctor
ASCIIDOCTOR_EXISTS = $(shell command -v $(ASCIIDOCTOR_BIN) > /dev/null && echo 1 || echo 0)


.PHONY: install
install:
	install -d $(bindir)
	install -m 0775 $(bin) $(bindir)
	install -m 0775 $(bin)-add $(bindir)
	install -m 0775 $(bin)-doctor $(bindir)
	install -m 0775 $(bin)-ls $(bindir)
	install -m 0775 $(bin)-rm $(bindir)
	install -m 0775 $(bin)-switch $(bindir)
	install -d $(completionsdir)
	install -m 0775 completions.fish $(completionsdir)/$(bin).fish

ifeq ($(ASCIIDOCTOR_EXISTS),1)
	$(ASCIIDOCTOR_BIN) $(manpage).adoc --backend manpage --doctype manpage
	install -d $(mandir)
	install -m 0644 $(manpage) $(mandir)
	$(RM) $(manpage)
else
	@echo "asciidoctor not found, skipping manpage install."
endif


.PHONY: uninstall
uninstall:
	$(RM) $(bindir)/$(bin) $(bindir)/$(bin)-add $(bindir)/$(bin)-doctor $(bindir)/$(bin)-ls $(bindir)/$(bin)-rm $(bindir)/$(bin)-switch $(completionsdir)/$(bin).fish
	$(RM) $(mandir)/$(manpage)

