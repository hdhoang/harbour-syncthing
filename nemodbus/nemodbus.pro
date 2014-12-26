PLUGIN_IMPORT_PATH = org/nemomobile/dbus
  QT += dbus qml
  QT -= gui

  TEMPLATE = lib
  CONFIG += plugin

  target.path = /usr/share/harbour-syncthing/lib
  INSTALLS += target

  qmldir.files += $$_PRO_FILE_PWD_/qmldir
                  qmldir.path +=  $$target.path
                  INSTALLS += qmldir

  SOURCES += \
  plugin.cpp \
  declarativedbus.cpp \
  declarativedbusinterface.cpp \

  HEADERS += \
  declarativedbus.h \
  declarativedbusinterface.h \
    
  
