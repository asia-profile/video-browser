import QtQuick 2.0

Item {
    id: filebrowser
    width: 230
    height: filebrowser.width * 0.75

    //Container
    Rectangle {
        id: thumbnail
        objectName: "Container_Body"
        color: "#ffffff"
        radius: 4
        anchors.bottomMargin: 37
        anchors.fill: parent
        opacity: 1
        border.width: 3
        border.color: "#007fee"
        anchors.margins: 5

        Image {
            id: play_Button
            visible: backend.isPlayable(index)
            width: 35
            height: 35
            anchors.rightMargin: 5
            anchors.topMargin: 5
            anchors.top: parent.top
            anchors.right: parent.right
            fillMode: Image.PreserveAspectFit
            source: "../QML_Assets/Play-Button-v1.svg"

            MouseArea {
                id: testing
                enabled: true
                anchors.fill: parent
                onClicked: {
                    console.log(backend.getName(index) + " CLICKED")
                    backend.grid_playerClick(index)
                    applicationWindow.width = 1024
                    applicationWindow.height = 768
                    rectangle.visible = true
                    rectangle.width = applicationWindow.width
                    rectangle.height = applicationWindow.height
                    rectangle.anchors.fill = applicationWindow
                }
            }
        }
    }

    Text {
        id: thumbnail_text
        width: thumbnail.width
        height: 33
        text: backend.getName(index)
        anchors.top: thumbnail.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        wrapMode: Text.NoWrap
        verticalAlignment: Text.AlignVCenter
        opacity: 1
        font.weight: Font.Light
        font.family: "Verdana"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 12
    }
}

/*##^##
Designer {
    D{i:4;anchors_height:32.5;anchors_width:209;anchors_x:"-69";anchors_y:130}
}
##^##*/

