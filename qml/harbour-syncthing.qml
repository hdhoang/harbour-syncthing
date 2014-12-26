import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.dbus 2.0

ApplicationWindow {
    id: win
    initialPage: Component {
        Page {
            Column {
                anchors.fill: parent
                PageHeader { title: "Syncthing" }
                ValueButton {
                    label: "State"
                    value: syncthing_service.state
                    onClicked: win.toggle()
                }
            }
        }
    }
    cover: CoverBackground {
        CoverPlaceholder {
            icon.source: "../syncthing.png"
            text: syncthing_service.state
        }
        CoverActionList {
            CoverAction {
                iconSource: syncthing_service.state == "inactive" ? "image://theme/icon-cover-play"
                : "image://theme/icon-cover-pause"
                onTriggered: win.toggle()
            }
        }
    }
    DBusInterface {
        id: syncthing_service

        service: "org.freedesktop.systemd1"
        path: "/org/freedesktop/systemd1/unit/syncthing_2eservice"
        iface: "org.freedesktop.systemd1.Unit"

        property string state: getProperty("ActiveState")
    }
    function toggle() {
        syncthing_service.call(
        syncthing_service.state == "inactive" ? "Start" : "Stop"
        , ["replace"])
    }
}
