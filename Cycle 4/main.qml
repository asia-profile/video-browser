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
    title: qsTr("Application Window")
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
        radius: 4
        border.color: "white"

        //Navbar
        Rectangle {
            id: navbar
            x: 0
            y: 95
            width: parent.width
            height: 60
            anchors.top: parent.top
            anchors.topMargin: 20
            color: "#27e5e5"
            radius: 11
            border.width: 2
            border.color: "#ffffff"

            Image {
                id: mavbar_Back_Button
                visible: true
                anchors.leftMargin: 9
                anchors.topMargin: 6
                anchors.top: parent.top
                anchors.left: parent.left
                fillMode: Image.PreserveAspectFit
                source: "../QML_Assets/Back-Button-b1.svg"
            }

            Image {
                id: mavbar_Home_Button
                anchors.leftMargin: 85
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                visible: true
                fillMode: Image.PreserveAspectFit
                source: "../QML_Assets/Home-Button-b1.svg"
            }

            Rectangle {
                id: navbar_text_background
                x: 153
                y: 6
                width: 489
                height: 48
                color: "#ffffff"
                radius: 16
            }

            Text {
                id: navbar_text
                width: 472
                height: 27
                text: qsTr("Text")
                font.family: "Verdana"
                anchors.leftMargin: 28
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: 13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: mavbar_Home_Button.right
                font.pixelSize: 23
            }
        }

        //Scroll-Grid-View
        Flickable {
            id: flickable
            clip: true
            anchors.topMargin: 90
            anchors.fill: parent
            flickableDirection: Flickable.VerticalFlick
            anchors.horizontalCenter: parent.horizontalCenterd

            GridView {
                id: filebrowser
                layer.enabled: false
                topMargin: 0
                objectName: "MainGrid"
                anchors.bottomMargin: 0
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
                cellHeight: height / 5.5
                snapMode: GridView.NoSnap
                flow: GridView.FlowLeftToRight

                model: backend.getNumberItems()
                delegate: ItemDelegate {
                    id: grid_Item
                    width: filebrowser.cellWidth
                    height: filebrowser.cellHeight
                    onClicked: {
                        console.log(index, text)
                        backend.grid_itemClick(index)
                        filebrowser.model = backend.getNumberItems()
                        backend.grid_item_select("#FFFAFA", "#043564", index)
                    }

                    Item {
                        id: filebrowser_container
                        width: 230
                        height: 170

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
                            anchors.leftMargin: 15

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
                                    enabled: true
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

                            Image {
                                id: info_Button
                                visible: backend.isPlayable(index)
                                width: 35
                                height: 35
                                anchors.leftMargin: 5
                                anchors.topMargin: 5
                                anchors.top: parent.top
                                anchors.left: parent.left
                                fillMode: Image.PreserveAspectFit
                                source: "../QML_Assets/Info-Button-b1.svg"

                                MouseArea {
                                    enabled: true
                                    anchors.fill: parent
                                    onClicked: {
                                        console.log(backend.getName(
                                                        index) + " INFO CLICKED")
                                        videoinfo.open(backend.getName(index))
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
                            anchors.horizontalCenterOffset: 5
                        }
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
            muted: false
            volume: volume_slider.value
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

                ProgressBar {
                    id: youtubeBar
                    anchors.bottom: play_pause_background.top
                    width: play_pause_background.width
                    hoverEnabled: false
                    indeterminate: false
                }

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

                Image {
                    id: fullscreen_Mute_Button
                    visible: false
                    anchors.leftMargin: 70
                    anchors.left: fullscreen_Play_Button.left
                    fillMode: Image.PreserveAspectFit
                    source: "../QML_Assets/volume-mute-w1.svg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("MUTE CLICKED")
                            fullscreen_Mute_Button.visible = false
                            volume_slider.value = 0
                            fullscreen_unMute_Button.visible = true
                        }
                    }
                }

                Image {
                    id: fullscreen_unMute_Button
                    visible: true
                    anchors.left: fullscreen_Mute_Button.left
                    fillMode: Image.PreserveAspectFit
                    source: "../QML_Assets/volume-unmute-w1.svg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("UNMUTE CLICKED")
                            fullscreen_Mute_Button.visible = true
                            volume_slider.value = 0.2
                            fullscreen_unMute_Button.visible = false
                        }

                        Slider {
                            id: volume_slider
                            x: 46
                            y: 4
                            stepSize: 0.1
                            value: 0.5
                            to: 1
                            onMoved: {
                                console.log(play.volume)
                            }
                        }
                    }
                }

                Text {
                    id: fullscreen_Speed_Text
                    color: "#ffffff"
                    anchors.right: fullscreen_Speed_Button.left
                    text: (play.playbackRate) + "x"
                    anchors.rightMargin: 10
                    anchors.verticalCenter: fullscreen_Speed_Button.verticalCenter
                    font.weight: Font.Medium
                    font.pointSize: 20
                    font.family: "Verdana"
                }

                Image {
                    id: fullscreen_Speed_Button
                    visible: true
                    source: "../QML_Assets/speed-Button-w1.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors.right: play_pause_background.right
                    anchors.rightMargin: 10
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("SPEED CLICKED")
                            play.playbackRate = play.playbackRate + 0.25
                            console.log(play.metaData.title)
                        }
                    }
                }
            }
        }
    }

    //VIDEO overlay.
    Popup {
        id: videoinfo
        y: 80
        focus: true
        width: flickable.width
        height: filebrowser.height * 0.8
        opacity: 0.6
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Rectangle {
            anchors.fill: parent
            color: "#c0c0c0"

            Image {
                id: overlay_Close_Button
                visible: backend.isPlayable(index)
                width: 60
                height: 60
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.top: parent.top
                anchors.right: parent.right
                fillMode: Image.PreserveAspectFit
                source: "../QML_Assets/cancel-Button-b1.svg"
            }
        }
    }
}
