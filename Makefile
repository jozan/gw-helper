PREFIX ?= $(HOME)/.local
dest = $(DESTDIR)$(PREFIX)
bindir = $(dest)/bin
bin = gw
completionsdir = $(PREFIX)/share/fish/vendor_completions.d

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

.PHONY: uninstall
uninstall:
	$(RM) $(bindir)/$(bin) $(bindir)/$(bin)-add $(bindir)/$(bin)-doctor $(bindir)/$(bin)-ls $(bindir)/$(bin)-rm $(bindir)/$(bin)-switch $(completionsdir)/$(bin).fish

