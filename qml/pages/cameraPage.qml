import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
Item {
    Rectangle {
        id: rectangle
        color: "#000000"
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: "#f6d365"
            }

            GradientStop {
                position: 1
                color: "#fda085"
            }
        }

        Label {
            id: label
            color: "#ffffff"
            text: qsTr("CAMERAS")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            styleColor: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }
        CameraBtn{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                backend.execute()
            }
        }

    
    }
    Connections{
        target: backend
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
