import QtQuick 2.9
import QtQuick.Controls 2.2
import Process 1.0

Page {

    Process {
        id: process
        onReadyRead: brightnessSlider.value = parseInt(readAll());
    }

    header: Label {
        text: qsTr("CANBUS Development tool")
        font.pixelSize: Qt.application.font.pixelSize
        padding: 10
        color: "#00d2be"
    }

    Rectangle {
        anchors.fill: parent
        color: "black"

        Text {
            id: canID
            color: "white"
            text: qsTr("CAN ID: 0x00")
        }
        Button {
            id: btnLoadCan
            anchors.right: parent.right
            text: qsTr("Load CAN")
            onReleased: process.start("sudo ip link set can0 type can bitrate 500000")
        }
        Button {
            id: btnStartCan
            anchors.right: parent.right
            anchors.top: btnLoadCan.bottom
            text: qsTr("Start CAN")
            onReleased: process.start("sudo ip link set can0 up")
        }
        Button {
            id: btnStopCan
            anchors.right: parent.right
            anchors.top: btnStartCan.bottom
            text: qsTr("Stop CAN")
            onReleased: process.start("sudo ip link set can0 down")
        }

        Rectangle {
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            height: 50
            width: parent.width - 20
            radius: 5
            color: "#333333"

            Row {
                x:10
                spacing: 10

                Button {
                    id: quitButton
                    width: 100
                    text: "Quit"
                    onClicked: Qt.quit()
                }
                Button {
                    id: rebootButton
                    width: 100
                    text: "Reboot"
                    onClicked: process.start("sudo reboot");
                }
                Button {
                    id: shutdownButton
                    width: 100
                    text: "Shutdown"
                    onClicked: process.start("sudo shutdown now");
                }
            }


            Slider {
                id: brightnessSlider
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: setBrightness.left
                width: 200
                height: 48
                orientation: Qt.Horizontal
                stepSize: 1
                from: 11
                to: 200

                Timer {
                    running: true
                    repeat: false
                    interval: 1000
                    onTriggered: {
                        process.start("rpi-backlight --actual-brightness");
                    }
                }
            }
            Button {
                id: setBrightness
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                text: "Set Brightness"
                onPressed: { process.start("rpi-backlight -b " + brightnessSlider.value + " -s -d 1"); }
            }
        }
    }
}
