import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    implicitHeight: 40
    implicitWidth: 200
    id: cameraBtn

    // CUSTOM_PROPERTIES
    property color colorDefault: "#D96704"
    property color colorMouseOver: "#F29F05"
    property color colorPressed: "#F2B705"
    QtObject{
        id: internal
        property var dynamicColor: if(cameraBtn.down){
                                       cameraBtn.down ? colorPressed : colorDefault
                                   } else {
                                       cameraBtn.hovered ? colorMouseOver : colorDefault
                                   }
    }

    text: qsTr("CAMERAS")
    background: Rectangle{
        color: internal.dynamicColor
        radius: 10
    }
    contentItem: Item{
        id: item1
        Text {
            id: textBtn
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 10
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
            text: "CAMERAS"
        }
    }
}
