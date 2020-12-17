import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.0
import Custom.BackEnd 1.0
import QtMultimedia 5.11

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 768
    height: 1024


    /*
    minimumWidth: width
    minimumHeight: height
    maximumWidth: width
    maximumHeight: height
    */
    title: qsTr("Ipad Window")
    color: "#ffffff"

    Rectangle {
        id: wrapper
        width: applicationWindow.width
        height: applicationWindow.height
        color: "#ffffff"
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 0
        clip: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Flickable {
            id: flickable
            clip: true
            anchors.bottomMargin: 322
            anchors.topMargin: 40
            anchors.fill: parent
            flickableDirection: Flickable.VerticalFlick
            anchors.horizontalCenter: parent.horizontalCenterd

            GridView {
                id: filebrowser
                anchors.bottomMargin: 24
                clip: true
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 24
                anchors.left: parent.left
                anchors.leftMargin: 24
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                contentHeight: height
                contentWidth: width
                cellWidth: width / 3
                cellHeight: 130
                snapMode: GridView.NoSnap
                flow: GridView.FlowLeftToRight
                model: backend.getNumberItems()

                delegate: ItemDelegate {
                    id: grid_Item
                    width: filebrowser.cellWidth
                    height: filebrowser.cellHeight

                    onClicked: {
                        console.log(index, text, container_text.text)
                        backend.grid_itemClick(index)
                        container.color = "#043564"
                        filebrowser.model = backend.getNumberItems()
                        //Add QtMultimedia Output
                    }

                    Rectangle {
                        id: container
                        color: "#FFFAFA"
                        anchors.fill: parent
                        opacity: 1
                        border.width: 1
                        border.color: "#FFFAFA"
                        anchors.margins: 5

                        Image {
                            id: play_Button
                            visible: backend.isPlayable(index)
                            width: 40
                            height: 40
                            anchors.rightMargin: 5
                            anchors.topMargin: 5
                            anchors.top: parent.top
                            anchors.right: parent.right
                            fillMode: Image.PreserveAspectFit
                            source: "Play-Button-v1.svg"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log(backend.getName(
                                                    index) + " CLICKED")
                                    backend.grid_playerClick(index)
                                }
                            }
                        }

                        Text {
                            id: container_text
                            text: "Filename:" + backend.getName(
                                      index) + "/(index ref:" + index + ")"
                            wrapMode: Text.NoWrap
                            verticalAlignment: Text.AlignVCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            opacity: 1
                            font.weight: Font.Bold
                            font.family: "Verdana"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                        }
                    }
                }

                //Dans Backend Link
                BackEnd {
                    id: backend
                }
            }
        }

        Rectangle {
            id: rectangle
            width: 768
            height: 600
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: flickable.bottom
            anchors.topMargin: 0
            color: "#b9b9b9"
            border.color: "#313131"

            MediaPlayer {
                id: play
                source: "file:///home/seanridgeon/Videos/Pi%20book%20screen/custom-splash.mp4"
                autoPlay: true
                autoLoad: true
            }

            VideoOutput {
                id: video_player
                clip: true

                /*y: 0
                width: 600
                height: 322
                anchors.rightMargin: 102
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 84
                anchors.topMargin: 0
               // volume: 0.1
                source: player//"../Videos/a.mov"
               // muted: true
               // autoPlay: true
               */
                source: play
                anchors.fill: parent
            }
        }
    }
}

/*##^##
Designer {
    D{i:11;anchors_x:0}
}
##^##*/

