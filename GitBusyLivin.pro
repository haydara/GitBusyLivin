#-------------------------------------------------
#
# Project created by QtCreator 2016-11-22T17:56:43
#
#-------------------------------------------------

QT       += core gui network svg

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = gitbusylivin
TEMPLATE = app

QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.13

SOURCES += src/main.cpp\
        src/ui/mainwindow.cpp \
    src/gbl/gbl_repository.cpp \
    src/gbl/gbl_historymodel.cpp \
    src/ui/historyview.cpp \
    src/gbl/gbl_filemodel.cpp \
    src/ui/fileview.cpp \
    src/ui/clonedialog.cpp \
    src/ui/urlpixmap.cpp \
    src/gbl/gbl_storage.cpp \
    src/ui/prefsdialog.cpp \
    src/ui/stageddockview.cpp \
    src/ui/unstageddockview.cpp \
    src/ui/singleapplication.cpp \
    src/ui/aboutdialog.cpp \
    src/ui/toolbarcombo.cpp \
    src/gbl/gbl_string.cpp \
    src/ui/badgetoolbutton.cpp \
    src/ui/referencesview.cpp \
    src/gbl/gbl_refsmodel.cpp \
    src/ui/mdichild.cpp \
    src/gbl/gbl_threads.cpp \
    src/ui/commitdock.cpp \
    src/ui/contentview.cpp \
    src/ui/statusprogressbar.cpp \
    src/ui/scandialog.cpp \
    src/ui/scanmdichild.cpp \
    src/ui/optionsmenubutton.cpp \
    src/ui/bookmarksdock.cpp \
    src/ui/branchdialog.cpp

HEADERS  += src/ui/mainwindow.h \
    src/gbl/gbl_repository.h \
    src/gbl/gbl_historymodel.h \
    src/gbl/gbl_version.h \
    src/ui/historyview.h \
    src/gbl/gbl_filemodel.h \
    src/ui/fileview.h \
    src/ui/clonedialog.h \
    src/ui/urlpixmap.h \
    src/gbl/gbl_storage.h \
    src/ui/prefsdialog.h \
    src/ui/stageddockview.h \
    src/ui/unstageddockview.h \
    src/ui/singleapplication.h \
    src/ui/aboutdialog.h \
    src/ui/toolbarcombo.h \
    src/gbl/gbl_string.h \
    src/ui/badgetoolbutton.h \
    src/ui/referencesview.h \
    src/gbl/gbl_refsmodel.h \
    src/ui/mdichild.h \
    src/gbl/gbl_threads.h \
    src/ui/commitdock.h \
    src/ui/contentview.h \
    src/ui/statusprogressbar.h \
    src/ui/scandialog.h \
    src/ui/scanmdichild.h \
    src/ui/optionsmenubutton.h \
    src/ui/bookmarksdock.h \
    src/ui/branchdialog.h

RESOURCES += \
    resources/gitbusylivin.qrc

INCLUDEPATH += $$PWD/libgit2/include

win32:LIBS += -lwinhttp \
    -lrpcrt4 \
    -lcrypt32 \
    -ladvapi32 \
    -lole32

win32 {
    debug {
        LIBS += $$PWD/libs/debug/git2.lib
    }
    release {
        LIBS += $$PWD/libs/release/git2.lib
    }
}

macx:LIBS += /usr/lib/libiconv.dylib \
    /usr/lib/libSystem.dylib \
    /usr/lib/libcrypto.dylib \
    /usr/lib/libz.dylib \
    -framework CoreFoundation \
    -framework Security \

macx {
    debug {
        LIBS += $$PWD/libs/debug/libgit2.a
    }

    release {
        LIBS += $$PWD/libs/release/libgit2.a
    }
}

!macx {
  unix {
    LIBS += -lgit2

    #VARIABLES
    isEmpty(PREFIX) {
      PREFIX = /usr
    }
    BINDIR = $$PREFIX/bin
    DATADIR =$$PREFIX/share

    DEFINES += DATADIR=\\\"$$DATADIR\\\" PKGDATADIR=\\\"$$PKGDATADIR\\\"

    #MAKE INSTALL
    INSTALLS += target desktop service icons16 icons32 icons64 icons128 icons256 icons512 mans
    target.path =$$BINDIR

    desktop.path = $$DATADIR/applications
    desktop.files += $${TARGET}.desktop

    service.path = $$DATADIR/dbus-1/services
    service.files += $${TARGET}.service

    icons16.path = $$DATADIR/icons/hicolor/16x16/apps
    icons16.files += ../debian/icons/16x16/apps/$${TARGET}.png

    icons32.path = $$DATADIR/icons/hicolor/32x32/apps
    icons32.files += ../debian/icons/32x32/apps/$${TARGET}.png

    icons64.path = $$DATADIR/icons/hicolor/64x64/apps
    icons64.files += ../debian/icons/64x64/apps/$${TARGET}.png

    icons128.path = $$DATADIR/icons/hicolor/128x128/apps
    icons128.files += ../debian/icons/128x128/apps/$${TARGET}.png

    icons256.path = $$DATADIR/icons/hicolor/256x256/apps
    icons258.files += ../debian/icons/256x256/apps/$${TARGET}.png

    icons512.path = $$DATADIR/icons/hicolor/512x512/apps
    icons.files += ../debian/icons/512x512/apps/$${TARGET}.png

    mans.files += ../debian/gitbusylivin.1
    mans.path = $$DATADIR/man/man1
  }
}

RC_ICONS = resources/images/gitbusylivin.ico
ICON = resources/images/gitbusylivin.icns

DISTFILES += \
    resources/styles/zihuatanejo.qss \
    resources/styles/shawshank.qss \
    resources/content/about.html


#CUSTOM CODE HERE
VERSION_MAJOR = 0
VERSION_MINOR = 0
VERSION_BUILD = 19

DEFINES += "VERSION_MAJOR=$$VERSION_MAJOR"\
       "VERSION_MINOR=$$VERSION_MINOR"\
       "VERSION_BUILD=$$VERSION_BUILD"

#Target version
VERSION = $${VERSION_MAJOR}.$${VERSION_MINOR}.$${VERSION_BUILD}
