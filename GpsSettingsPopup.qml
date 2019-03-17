import QtQuick 2.9
import QtQuick.Controls 2.2
import QtLocation 5.9
import QtPositioning 5.8

Popup {
    id: popup
    x: parent.width * 0.5 - popup.width * 0.5
    y: parent.height * 0.5 - popup.height * 0.5
    width: 400
    height: 300
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent | Popup.CloseOnPressOutside
    
    Label {
        text: qsTr("SETTINGS - Map")
        font.pixelSize: Qt.application.font.pixelSize
        padding: 0
        color: "#00d2be"
    }
    
    Column {
        y: 40
        
        Label {
            text: qsTr("This a demo application")
        }
        
        Switch {
            text: qsTr("Have a Switch for your touching needs")
        }

        ComboBox {
            currentIndex: 1
            width: 300
            model: ["osm", "itemsoverlay", "mapbox", "here", "esri"]
            onCurrentIndexChanged: mapPlugin.name = currentText
        }

        ComboBox {
            width: 300
            model: map.supportedMapTypes
            textRole:"description"
            onCurrentIndexChanged: map.activeMapType = map.supportedMapTypes[currentIndex]
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onPressed: popup.close()
        text: "Close"
    }
}
