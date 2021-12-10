# st version
VERSION = 0.8.4

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# Default X11INC and X11LIB dirs
#X11INC = /usr/X11R6/include
#X11LIB = /usr/X11R6/lib

# Modified X11INC and X11LIB dirs to work on FreeBSD
X11INC = /usr/local/include
X11LIB = /usr/local/lib

# Uncomment if you have pkg-config installed on your system
#PKG_CONFIG = pkg-config

# Original includes and libs
#INCS = -I$(X11INC) \
       #`$(PKG_CONFIG) --cflags fontconfig` \
       #`$(PKG_CONFIG) --cflags freetype2`
#LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft \
       #`$(PKG_CONFIG) --libs fontconfig` \
       #`$(PKG_CONFIG) --libs freetype2`

# Modified (simple way) includes and libs for FreeBSD
INCFLAGS = -I/usr/local/include/freetype2 -I/usr/local/include/libpng16 -I/usr/local/include/harfbuzz -I/usr/local/include/glib-2.0 -I/usr/local/include/glib-2.0/glib

LIBFLAGS = -lfontconfig -lfreetype

INCS = -I$(X11INC) $(INCFLAGS)
LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft $(LIBFLAGS)

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)

# OpenBSD:
#CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
#LIBS = -L$(X11LIB) -lm -lX11 -lutil -lXft \
#       `$(PKG_CONFIG) --libs fontconfig` \
#       `$(PKG_CONFIG) --libs freetype2`

# compiler and linker
# CC = c99
