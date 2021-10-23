import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"
Window {
    id: mainWindow
    width: 1000
    height: 580
    minimumWidth: 800
    minimumHeight: 500
    visible: true
    color: "#00000000"
    //remove title bar
    flags: {
        Qt.Window | Qt.FramelessWindowHint //| Qt.WindowStaysOnTopHint
    }
    title: qsTr("Comic Creator")

    //Internal Properties
    property int windowStatus: 0
    property int windowMargin: 10
    QtObject{
        id: internal
        function resetResizeBorders(){
            resizeLeft.visible=true
            resizeRight.visible=true
            resizeTop.visible=true
            resizeBottom.visible=true
            resizeWindow.visible=true
        }

        function maximizeRestore(){
            if (windowStatus==0){
                windowStatus=1
                mainWindow.showMaximized()
                windowMargin=0
                resizeLeft.visible=false
                resizeRight.visible=false
                resizeTop.visible=false
                resizeBottom.visible=false
                resizeWindow.visible=false
                btnMaximizeRestore.btnIconSource = "../images/svg_images/restore_icon.svg"
            }
            else{
                windowStatus=0
                mainWindow.showNormal()
                windowMargin=10
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }

        }
        function ifMaximizedWindowRestore(){
            if (windowStatus==1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }
        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            internal.resetResizeBorders()
            btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: bg
        color: "#f2e641"
        border.color: "#d96704"
        border.width: 1
        anchors.fill: parent
        z:1
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
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin

        Rectangle {
            id: appContainer
            color: "#00ffffff"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                gradient: Gradient {
                    orientation: Gradient.Vertical
                    GradientStop {
                        position: 0
                        color: "#434343"
                    }

                    GradientStop {
                        position: 1
                        color: "#000000"
                    }
                }
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton{
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 28
                    height: 25
                    color: "#ffa742"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#0d0d0d"
                        text: qsTr("Make Fun Comic Books with Blender")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 9
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#0d0d0d"
                        text: qsTr("| Camera Selector")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        anchors.leftMargin: 0
                        font.pointSize: 9
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00ffffff"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0
                    DragHandler{
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/comic.png"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#ffe68c"
                        text: qsTr("Comic Creator")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 261
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarButton{
                        id: btnMinimize
                        onClicked: {

                            mainWindow.showMinimized()
                            internal.restoreMargins()
                           }
                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        colorMouseOver: "#ac505e"
                        colorPressed: "#e6003c"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked: {
                            mainWindow.close()
                            exitcode.exit()
                        }
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    gradient: Gradient {
                        orientation: Gradient.Vertical
                        GradientStop {
                            position: 0
                            color: "#434343"
                        }

                        GradientStop {
                            position: 1
                            color: "#000000"
                        }
                    }
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width==70) return 200; else return 70

                        duration: 1000
                        easing.type: Easing.InOutQuint
                    }

                    Column {
                        id: columnMenus
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: true
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn{
                            id: homeBtn
                            width: leftMenu.width
                            isActiveMenu: true
                            onClicked: {
                                cameraBtn.isActiveMenu= false
                                homeBtn.isActiveMenu = true
                                pageHome.visible= true
                                pageCameras.visible= false
                            }

                        }

                        LeftMenuBtn {
                            id: cameraBtn
                            width: leftMenu.width
                            text: "CAMERAS"
                            btnIconSource: "../images/camera.png"
                            onClicked: {
                                homeBtn.isActiveMenu = false
                                cameraBtn.isActiveMenu= true
                                pageHome.visible= false
                                pageCameras.visible=true
                            }
                        }

                        LeftMenuBtn {
                            id: saveBtn
                            width: leftMenu.width
                            text: "Save"
                            btnIconSource: "../images/svg_images/save_icon.svg"
                        }
                    }

                    LeftMenuBtn {
                        id: settingsBtn
                        width: leftMenu.width
                        text: "Settings"
                        anchors.bottom: parent.bottom
                        clip: false
                        anchors.bottomMargin: 25
                        btnIconSource: "../images/svg_images/settings_icon.svg"
                        onPressed: {
                            backend.cameraimageadd()
                        }
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#00ffffff"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0

                  //  StackView {
                    //    id: stackView
                      //  anchors.fill: parent
                        //initialItem: Qt.resolvedUrl("pages/homePage.qml")
                    //}
                      Loader{
                          id:pageHome
                          anchors.fill: parent
                          source: Qt.resolvedUrl("pages/homePage.qml")
                      }
                      Loader{
                          id:pageCameras
                          anchors.fill: parent
                          source: Qt.resolvedUrl("pages/cameraPage.qml")
                          visible: false
                      }
                }

                Rectangle {
                    id: rectangle
                    color: "#ffa742"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelTopInfo1
                        color: "#0d0d0d"
                        text: qsTr("Version : 1.2.0 | Ayush Yadav")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 30
                        anchors.leftMargin: 10
                        font.pointSize: 9
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }

                    MouseArea {
                        id: resizeWindow
                        x: 884
                        y: 8
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor
                        DragHandler{
                            target: null
                            onActiveChanged: if(active){
                                                 mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                             }
                        }

                        Image {
                            id: resizeImage
                            opacity: 0.5
                            anchors.fill: parent
                            source: "../images/svg_images/resize_icon.svg"
                            anchors.leftMargin: 5
                            anchors.topMargin: 5
                            sourceSize.height: 16
                            sourceSize.width: 16
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }
                    }
                }
            }
        }
    }

    DropShadow{
        anchors.fill:bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#800000000"
        source: bg
        z:0
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainWindow.startSystemResize(Qt.LeftEdge)
                             }
        }
    }
    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainWindow.startSystemResize(Qt.RightEdge)
                             }
        }
    }
    MouseArea {
        id: resizeTop
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        cursorShape: Qt.SizeVerCursor
        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainWindow.startSystemResize(Qt.TopEdge)
                             }
        }
    }
    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        cursorShape: Qt.SizeVerCursor
        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainWindow.startSystemResize(Qt.BottomEdge)
                             }
        }
    }
    Connections{
        target: backend

        function onGetFilepath(stringText){
            LeftMenuBtn.btnIconSource = stringText
            print(stringText)

        }
    }
    Connections{
        target: exitcode
    }

}


