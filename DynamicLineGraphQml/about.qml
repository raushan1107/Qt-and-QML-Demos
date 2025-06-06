import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Window 2.13

Rectangle {
    color: "blue"
    Rectangle{
        id:aboutinfo
        width: Screen.width/2
        height: Screen.height/2
        anchors.centerIn: parent
        border.color: "black"
        color: "#99ffcc"

        Text {
            id: abtInfo
            text: "-----------------------------------------------------------------"+
                  "<br/>Developed By: Raushan Ranjan"+
                  "<br/>Developed using Qt/QML
                 <br/>To Know more about Qt/QML visit:
                 <a href='https://www.qt.io/'>
                 <br/>https://www.qt.io/
                 </a>"+
            "<br/>-----------------------------------------------------------------"

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.NoButton
                cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
            }
            onLinkActivated: Qt.openUrlExternally(link)

            font.pointSize: 15
            font.bold: true
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 10
            }
        }


        Text {
            id: usage
            textFormat: Text.RichText
            text: "<b>Usage</b> :"+
                  "<br/><i>Scroll Graph:</i>
                   <br/>Use Arrow keys for scroll Left, Right, Up, Down.</p>"
            font.pointSize: 15
            //font.bold: true
            anchors
            {
                top: abtInfo.bottom
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Button{
        id:back
        text:"Back"

        anchors
        {
            top: aboutinfo.bottom
            topMargin: 10
            left: aboutinfo.left

        }

        onClicked: {
            //mystackview.push("mygraph.qml")
            mystackview.pop()
        }
    }
}
