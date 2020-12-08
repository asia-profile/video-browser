QT += core gui widgets multimedia multimediawidgets quick

#CONFIG += c++11
CONFIG += c++11
QML_IMPORT_NAME = io.qt.examples.backend
QML_IMPORT_MAJOR_VERSION = 1


# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        backend.cpp \
        elem.cpp \
        player.cpp \
        the_button.cpp \
        the_player.cpp \
        vid.cpp \
        vidmanagement.cpp \
        main.cpp

HEADERS += \
    backend.h \
    elem.h \
    player.h \
    the_button.h \
    the_player.h \
    vid.h \
    vidmanagement.h

RESOURCES += qml.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
