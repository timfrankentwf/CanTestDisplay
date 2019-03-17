import QtQuick 2.9
import QtQuick.Controls 2.2

Page {

    header: Label {
        text: qsTr("CANBUS Development tool")
        font.pixelSize: Qt.application.font.pixelSize
        padding: 10
        color: "#00d2be"
    }

    Rectangle {
        anchors.fill: parent
        color: "black"

        ComboBox {
            editable: false
            model: ListModel {
                id: model
                ListElement { text: "Speed" }
                ListElement { text: "Torque" }
            }
        }

        RangeSlider {
            y: 40
            from: 1
            to: 100
            first.value: 25
            second.value: 75
        }

        Row {
            id: row
            x: 400

            Tumbler {
                id: hoursTumbler
                model: 12
            }

            Tumbler {
                id: minutesTumbler
                model: 60
            }

            Tumbler {
                id: amPmTumbler
                model: ["AM", "PM"]
            }
        }
    }
}
