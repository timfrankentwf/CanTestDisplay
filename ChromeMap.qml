import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebEngine 1.5
import QtPositioning 5.8
import QtLocation 5.9

Page {

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
            value: false
        }
    }

    header: Label {
        text: qsTr("Map viewer using Chromium")
        font.pixelSize: Qt.application.font.pixelSize
        padding: 10
        color: "#00d2be"
    }

    Rectangle {
        anchors.fill: parent
        color: "#333333"

        SpinBox {
            y: 40
            id: mapZoom
            value: 14
            from: 0
            to: 24
        }

        Map {
            id: map
            height: parent.height
            width: parent.width * 0.5
            anchors.right: parent.right
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


