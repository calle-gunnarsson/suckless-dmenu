# dmenu version
VERSION = 4.8

OS = $(shell uname -s)

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

ifeq ($(OS), Darwin)
X11INC = /opt/X11/include
X11LIB = /opt/X11/lib
else
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib
endif

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2

ifneq ($(OS),Linux)
# Assume BSD
FREETYPEINC = ${X11INC}/freetype2
endif

# includes and libs
INCS = -I$(X11INC) -I$(FREETYPEINC)
LIBS = -L$(X11LIB) -lX11 $(XINERAMALIBS) $(FREETYPELIBS)

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\" $(XINERAMAFLAGS)
CFLAGS   = -std=c99 -pedantic -Wall -Os $(INCS) $(CPPFLAGS)
LDFLAGS  = $(LIBS)

# compiler and linker
CC = cc
