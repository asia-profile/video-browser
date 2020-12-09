import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.0
import io.qt.examples.BackEnd 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 768
    height: 1024

    /*Lock screen size
    minimumWidth: width
    minimumHeight: height
    maximumWidth: width
    maximumHeight: height
    */

    title: qsTr("Ipad Window")
    color:"#ffffff"

        Rectangle{
            id:wrapper
            width:applicationWindow.width
            height:applicationWindow.height
            color: "#ffffff"
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: 25
            clip: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Flickable {
                id: flickable
                anchors.topMargin: 100
                anchors.fill: parent
                flickableDirection: Flickable.VerticalFlick
                anchors.horizontalCenter: parent.horizontalCenterd

                GridView {
                    id:filebrowser
                clip: true
                anchors.topMargin:0
                anchors.right: parent.right
                anchors.rightMargin: 24
                anchors.left: parent.left
                anchors.leftMargin: 24
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                contentHeight: height
                contentWidth: width
                cellWidth: width/3
                cellHeight: 130
                snapMode: GridView.NoSnap
                flow: GridView.FlowLeftToRight
                model: backend.getNumberItems()


                delegate:ItemDelegate{
                    id: grid_Item
                    width: filebrowser.cellWidth
                    height: filebrowser.cellHeight

                        Rectangle{
                            id:container
                            color: "#ff867a"
                            anchors.fill: parent
                            opacity: 1
                            border.width: 1
                            border.color: "#007fee"
                            anchors.margins: 5

                            Image{
                                id:play_Button
                                visible: backend.isPlayable(index)
                                width: 29
                                height: 29
                                anchors.rightMargin: 5
                                anchors.topMargin: 5
                                anchors.top: parent.top
                                anchors.right: parent.right
                                fillMode: Image.PreserveAspectFit
                                source: "Play-Button-v1.svg"
                            }

                            Text{
                                id:container_text
                                text: "Filename:" + backend.getName(index)+ "/(index ref:"+ index + ")"
                                wrapMode: Text.NoWrap
                                verticalAlignment: Text.AlignVCenter
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin:  20
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
    }
}






