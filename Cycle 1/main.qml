import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.0
import QtMultimedia 5.12

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 768
    height: 1024
    title: qsTr(backend.getTitle_window())
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
            anchors.bottomMargin: 40
            anchors.topMargin: 40
            anchors.fill: parent
            flickableDirection: Flickable.VerticalFlick
            anchors.horizontalCenter: parent.horizontalCenterd

            GridView {
                id: filebrowser
                objectName: "MainGrid"
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
                        filebrowser.model = backend.getNumberItems()
                        backend.grid_item_select("#FFFAFA", "#043564", index)
                    }

                    Rectangle {
                        id: container
                        objectName: "RectContainer"
                        color: "#FFFAFA"
                        anchors.fill: parent
                        opacity: 1
                        border.width: 1
                        border.color: "#000000"
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
                            source: "../QML_Assets/Play-Button-v1.svg"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log(backend.getName(
                                                    index) + " CLICKED")
                                    backend.grid_playerClick(index)
                                    applicationWindow.width = 1024
                                    applicationWindow.height = 768
                                    rectangle.visible = true
                                    rectangle.width = applicationWindow.width
                                    rectangle.height = applicationWindow.height
                                    rectangle.anchors.fill = wrapper
                                }
                            }
                        }

                        Text {
                            id: container_text
                            text: backend.getName(index)
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
            }
        }

        //VIDEO PLAYER
        Rectangle {
            id: rectangle
            visible: true
            color: "black"

            MediaPlayer {
                id: play
                objectName: "MainPlayer"
                volume: 0.2 //0% - 100%
            }

            VideoOutput {
                id: video_player
                source: play
                clip: false
                anchors.fill: parent

                Image {
                    id: fullscreen_Back_Button
                    visible: true
                    anchors.rightMargin: 10
                    anchors.topMargin: 10
                    anchors.top: parent.top
                    anchors.right: parent.right
                    fillMode: Image.PreserveAspectFit
                    source: "../QML_Assets/Back-Button-w1.svg"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            backend.player_back()
                            applicationWindow.width = 768
                            applicationWindow.height = 1024
                            rectangle.visible = false
                            rectangle.width = wrapper.width
                            rectangle.height = wrapper.height
                            rectangle.anchors.fill = wrapper
                            fullscreen_Pause_Button.visible = true
                            fullscreen_Play_Button.visible = false
                        }
                    }
                }

                Rectangle {

                    id: play_pause_background
                    height: fullscreen_Pause_Button.height
                    width: parent.width
                    color: "grey"
                    opacity: 0.4
                    anchors.bottom: video_player.bottom

                    Image {
                        id: fullscreen_Pause_Button
                        visible: true
                        anchors.leftMargin: 10
                        anchors.left: parent.left
                        fillMode: Image.PreserveAspectFit
                        source: "../QML_Assets/Pause-Button-w1.svg"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                fullscreen_Pause_Button.visible = false
                                backend.player_pause()
                                fullscreen_Play_Button.visible = true
                            }
                        }
                    }

                    Image {
                        id: fullscreen_Play_Button
                        visible: false
                        anchors.leftMargin: 10
                        anchors.left: parent.left
                        fillMode: Image.PreserveAspectFit
                        source: "../QML_Assets/Play-Button-w1.svg"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                fullscreen_Play_Button.visible = false
                                backend.player_play()
                                fullscreen_Pause_Button.visible = true
                            }
                        }
                    }
                }
            }
        }
    }
}
