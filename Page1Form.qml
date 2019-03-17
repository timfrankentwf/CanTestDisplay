import QtQuick 2.9
import QtQuick.Controls 2.2
import QtLocation 5.9
import QtPositioning 5.8

Item {

    Plugin {
        id: mapPlugin
        name: "osm"
        PluginParameter {
            name:"osm.mapping.custom.host"
            value:"http://tiles.openseamap.org/seamark/"
        }
        PluginParameter {
            name:"osm.mapping.providersrepository.disable"
            value:true
        }
        PluginParameter {
            name: "osm.mapping.highdpi_tiles"
            value: "false"
        }
    }

    GpsSettingsPopup {
        id: popup
    }

    Page {
        id: leftBox
        anchors.left: parent.left
        width: parent.width * 0.5
        height: parent.height

        header: Label {
            text: qsTr("GPS Navigation | <b>Build on Avans</b>")
            font.pixelSize: Qt.application.font.pixelSize
            padding: 10
            color: "#00d2be"
        }

        Rectangle {
            anchors.fill: parent
            color: "#333333"

            Grid {
                columns: 1

                Button {
                    text: "Settings"
                    onClicked: popup.open()
                }

                SpinBox {
                    y: 40
                    id: mapZoom
                    value: 14
                    from: map.minimumZoomLevel
                    to: map.maximumZoomLevel
                }
            }

        }
    }

    Rectangle {
        id: rightBox
        anchors.right: parent.right
        anchors.left: leftBox.right
        height: parent.height

        Map {
            id: map
            height: parent.height
            width: parent.width
            antialiasing: false
            gesture.enabled: true
            bearing: 0
            copyrightsVisible: false
            plugin: mapPlugin
            center: QtPositioning.coordinate(51.586531, 4.785726)
            zoomLevel: mapZoom.value
            activeMapType: map.supportedMapTypes[0]
        }

    }
}
