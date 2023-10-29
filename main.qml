import QtQuick
import QtQuick.Controls.iOS
import VeraPackage 1.0

Window {
    id: window
    width: 640
    height: 480
    visible: true
    color: "#3f3f3f"
    title: "Virtual E-Research Assistant (Vera)"

    VeraClient {
        id: veraClient
    }

    Connections {
        target: veraClient
        function onVeraRequestChanged() {
            showVeraRequest.text = veraClient.getVeraRequest()
        }
    }

    Button {
        id: startButton
        width: 110
        height: 25
        text: "Start"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 35
        anchors.rightMargin: 10
        font.pointSize: 12
        font.bold: true
        onClicked: veraClient.setVeraRequest("I will "+ veraTask.text)
    }

    Rectangle {
        id: veraTaskBorder
        width: 500
        height: 75
        opacity: 1
        visible: true
        color: "#3f3f3f"
        border.width: 3
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.topMargin: 20
        border.color: "#0096ff"

        TextInput {
            id: veraTask
            width: 500
            height: 75
            opacity: 1
            color: "#ffffff"
            anchors.fill: parent
            wrapMode: Text.WordWrap
            anchors.topMargin: 8
            focus: true
            leftPadding: 10
            font.pixelSize: 12

            property string placeholderText: "Enter your request here..."

            Text {
                id: placeholderText
                text: veraTask.placeholderText
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 9
                anchors.topMargin: 0
                color: "#aaaaaa"
                visible: !veraTask.text
            }
        }
    }

    Text {
        id: showVeraRequest
        width: 500
        height: 75
        color: "#aaaaaa"
        font.pointSize: 12
        text: veraClient.getVeraRequest()
        anchors.verticalCenter: veraTaskBorder.verticalCenter
        wrapMode: Text.WordWrap
        font.bold: true
        anchors.horizontalCenter: veraTaskBorder.horizontalCenter
        anchors.verticalCenterOffset: 85
    }
}
