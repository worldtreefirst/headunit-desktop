import QtQuick 2.0
import QtQuick.Controls 2.0

// Import custom styles
import "."

Popup {
    property alias text: textView.text

    id: popup
    width: textView.width + 65
    height: 50
    x: mainWindow.width/2 - width/2
    y: mainWindow.height  - toolBar_.height - height
    //modal: true
    //focus: true
    closePolicy: Popup.NoAutoClose
    enter:  Transition {
            NumberAnimation { property: "y"; from: mainWindow.height ; to: mainWindow.height - toolBar.height - popup.height;}
        }
    exit: Transition {
            NumberAnimation { property: "y"; from: mainWindow.height - toolBar.height - popup.height ; to: mainWindow.height;}
        }
    //onOpened: closeTimer.running = true;

    Text {
        id: textView
        text: "Error Message Popup"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        font.pixelSize: 22
        color: "#ffffff"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        Image {
            anchors.verticalCenter: parent.verticalCenter
            source: "../images/icon-exit.png"
            height: 25
            fillMode: Image.PreserveAspectFit
        }
        MouseArea {
            scale: 1
            anchors.fill: parent
            anchors.margins: 20
            onClicked: popup.close()
        }
    }

    background: Rectangle {color: "darkRed"}

    /*Timer {
        id: closeTimer
        interval: 1 * 1000 // 10 s
        repeat: false
        onTriggered: {
           popup.close()
        }
    }*/
}
