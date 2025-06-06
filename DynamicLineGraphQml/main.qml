import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.4

Window {
    id:mainwindow
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Dynamic Line Graph")

    //global variable
    property int timeStep: 0
    property int  repeatTimeStep: 0

    StackView{
        id:mystackview
        anchors.fill: parent
        initialItem: "mygraph.qml" //starting page
    }

    Component.onCompleted: {
        console.debug("Screen.width ==> "+Screen.width)
        console.debug("Screen.height ==> "+Screen.height)
    }
}

