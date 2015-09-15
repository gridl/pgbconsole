PROGRAM_NAME = pgbconsole
SOURCE = pgbconsole.c
CC ?= gcc
CFLAGS = -g -std=gnu99 -O2 -Wall -pedantic
PREFIX ?= /usr
PGCONFIG ?= pg_config
PGLIBDIR = $(shell $(PGCONFIG) --libdir)
PGINCLUDEDIR = $(shell $(PGCONFIG) --includedir)
LIBS = -lncurses -lpq
DESTDIR ?=

.PHONY: all clean install

all: pgbconsole

pgbconsole: pgbconsole.c
	gcc $(CFLAGS) -I$(PGINCLUDEDIR) -L$(PGLIBDIR) -o $(PROGRAM_NAME) $(SOURCE) $(LIBS)

clean:
	rm -f $(PROGRAM_NAME)

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin/
	install -pm 755 $(PROGRAM_NAME) $(DESTDIR)$(PREFIX)/bin/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_NAME)
