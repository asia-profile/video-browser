/*
import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12
import io.qt.examples.BackEnd 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 768
    height: 1024
    maximumHeight:applicationWindow.height
    maximumWidth:applicationWindow.width
    color: "#bdbdbd"
    title: qsTr("Ipud")

    BackEnd {
            id: backend
        }

    Rectangle {
        id: rectangle
        x: 12
        y: 58
        width: 200
        height: 200
        color: "#ffffff"
        radius: 12
        border.width: 3

        Image {
            id: image
            x: 0
            y: 8
            width: 200
            height: 119
            fillMode: Image.PreserveAspectFit
            source: "qrc:/qtquickplugin/images/template_image.png"
        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 126
            width: rectangle.width*0.95
            height: 58
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: element
                x: 8
                y: 0
                width: 184
                height: 58
                text: backend.getName(2)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 14
            }
        }
    }

}
*/
import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import io.qt.examples.BackEnd 1.0

ApplicationWindow {
    visible: true
    width: 768
    height: 1024
    title: qsTr("Scroll")
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
                    width: GridView.width/3
                    objectName: "vid" + (index + 1)
                    text: "C" + (index + 1)
                    font.pixelSize: 10
                }
            }
        }
}


