import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import io.qt.examples.BackEnd 1.0

ApplicationWindow {
    visible: true
    width: 768
    height: 1024
    title: qsTr("Ipad Window")
    color:"#ffffff"

        BackEnd {
            id: backend
        }

        Flickable {
            flickableDirection: Flickable.VerticalFlick
            width:parent
            height:parent
            anchors.fill:parent

            GridView {
                id:filebrowser
                anchors.fill: parent
                width: parent.width
                snapMode: GridView.NoSnap
                flow: GridView.FlowLeftToRight
                //Gridsize
                //model: 1000
                model: backend.getNumberItems()

                delegate:ItemDelegate{
                    objectName: "vid" + (index + 1)
                    text: "Video" + (index + 1)
                    font.pixelSize: 10
                }
            }
        }
}


