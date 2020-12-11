import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.0
import Custom.BackEnd 1.0
import QtMultimedia 5.0

ApplicationWindow {
    title: "video_player"
    width: 1000
    height: 1000

    Video {
        x: 0
        y: 0
        width: 600
        height: 400
        autoPlay: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        clip: true
        source: "../../../../../../Videos/Pi book screen/custom-splash2.mov"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                play()
            }
        }
    }
}
