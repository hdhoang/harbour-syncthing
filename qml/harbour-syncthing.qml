import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.dbus 2.0

ApplicationWindow {
    initialPage: Component {
        Page {
            Column {
                anchors.fill: parent
                PageHeader { title: "Syncthing" }
                ValueButton {
                    id: state

                    label: "State"
                    value: syncthing_service.state

                    onClicked: syncthing_service.call(
                    syncthing_service.state == "inactive" ? "Start" : "Stop"
                    , ["replace"])
                }
                DBusInterface {
                    id: syncthing_service

                    service: "org.freedesktop.systemd1"
                    path: "/org/freedesktop/systemd1/unit/syncthing_2eservice"
                    iface: "org.freedesktop.systemd1.Unit"

                    property string state: getProperty("ActiveState")
                }
            }
        }
    }
}
