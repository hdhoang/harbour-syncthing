TEMPLATE = subdirs
  SUBDIRS = src
  CONFIG += sailfishapp
  OTHER_FILES += \
  qml/harbour-syncthing.qml \
  rpm/harbour-syncthing.yaml \
  syncthing.service \

  INSTALLS += service
  service.path = /usr/lib/systemd/user
  service.files = syncthing.service

  INSTALLS += syncthing
  syncthing.path = /usr/share/harbour-syncthing/libexec
  syncthing.files = syncthing
