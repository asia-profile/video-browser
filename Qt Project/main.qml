import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import io.qt.examples.BackEnd 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 768
    height: 1024

    //Lock screen size
    minimumWidth: width
    minimumHeight: height
    maximumWidth: width
    maximumHeight: height

    title: qsTr("Ipad Window")
    color:"#ffffff"

        Rectangle{
            id:wrapper
            width:applicationWindow.width
            height:applicationWindow.height
            color: "#000000"
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: 25
            clip: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Flickable {
            id: flickable
            flickableDirection: Flickable.VerticalFlick
            width:parent
            height:parent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.top: parent.top

            GridView {
                id:filebrowser
                anchors.fill: parent
                anchors.bottom: parent.bottom
                keyNavigationWraps: true
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
                        id:containerBackground
                        color: "#eb04ff"
                        opacity: 1
                        anchors.fill: parent
                        border.width: 1
                        border.color: "#007fee"

                        Image{
                            id:play_Button
                            visible: true
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
                            text: "Filename:" + backend.getName(index)+ "/(index ref:"+ index + ")"
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



/*##^##
Designer {
    D{i:4;anchors_height:130;anchors_width:230}D{i:3;anchors_height:850;anchors_width:740}
}
##^##*/
