import QtQuick 2.15
import QtQuick.Controls 2.15
Item {
    Rectangle {
        id: rectangle
        color: "#fe0000"
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
            text: qsTr("Home Page")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}
}
##^##*/
