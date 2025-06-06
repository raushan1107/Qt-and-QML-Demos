import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtCharts 2.0
import "jslib.js" as Jslib

Rectangle{
    Item {
        width: Screen.width/1.33
        height: Screen.height/1.19
        anchors.centerIn: parent

        ChartView {
            id: chartView
            width: Screen.width/1.33
            height: Screen.height/1.8
            anchors.centerIn: parent
            antialiasing: true
            title: "AccelerationData/Time(sec.)"
            animationOptions: ChartView.SeriesAnimations
            focus: true //for keboard keys

            //themes
            //theme: ChartView.ChartThemeBrownSand
            //theme: ChartView.ChartThemeDark
            //theme: ChartView.ChartThemeHighContrast
            //theme: ChartView.ChartThemeBlueIcy
            //theme: ChartView.ChartThemeLight
            theme: ChartView.ChartThemeBlueCerulean
            //theme:  ChartView.ChartThemeQt
            //theme:  ChartView.ChartThemeBlueNcs

            ValueAxis {
                id: axisX
                min: 0
                max: 10
                titleText: "Time(sec.)"
                tickCount: 11 //set it max for close view
                labelFormat: "%.0f"; //for int value show
            }

            ValueAxis {
                id: axisY
                min: -20
                max: +20
                titleText: "AccelerationData"
                tickCount: 5 //set it max for close view
                labelFormat: "%.0f"; //for int value show
            }

            Component.onCompleted:  {

            }

            LineSeries {
                id: series1
                axisX: axisX
                axisY: axisY
                name: "AccelerationData"
            }

        }

        Keys.onPressed: //for scroll graph left,right,up,down by keyboard arrow keys
        {
            if( (event.key === Qt.Key_Left) )
            {
                chartView.scrollLeft(5)
                console.log("left presses")
            }
            if( (event.key === Qt.Key_Right) )
            {
                chartView.scrollRight(5)
                console.log("right presses")
            }
            if( (event.key === Qt.Key_Up) )
            {
                chartView.scrollUp(5)
                console.log("Up presses")
            }
            if( (event.key === Qt.Key_Down) )
            {
                chartView.scrollDown(5)
                console.log("Down presses")
            }
        }


        Timer {
            id:mytimer1
            interval: 1000
            repeat: true
            //running: true
            onTriggered: {
                timeStep++;
                repeatTimeStep++
                var y

                if(repeatTimeStep < 6){

                    y = Jslib.getRandomArbitrary(-10,10)  //random data in range [-10, +10]

                    console.log("Time : "+timeStep)
                    console.log("rand 1: "+y)
                    series1.append(timeStep, y);
                }else if(repeatTimeStep <= 10){

                    if( repeatTimeStep == 10)
                        repeatTimeStep = 0

                    y = Jslib.getRandomArbitrary(-20,20) //random data in range [-20, +20]

                    console.log("Time : "+timeStep)
                    console.log("rand 2: "+y)
                    series1.append(timeStep, y);
                }


                if(timeStep > 10){ //increase X-axis scale after 10 sec
                    axisX.max = timeStep + 1;
                    axisX.min = axisX.max - 10;
                }
            }
        }

        Rectangle {
            id: mybuttons
            width: 960
            height: 60
            color: "red"

            anchors{
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 50
            }

            Item {
                anchors{
                    top: parent.top
                    topMargin: 10
                    left: parent.left
                    leftMargin: 110
                }

                Button{
                    id:play
                    text:"Play"
                    onClicked: {
                        mytimer1.start()
                    }
                }

                Button{
                    id:pause
                    text:"Pause"
                    anchors
                    {
                        left: play.right
                        leftMargin:10
                    }
                    onClicked: {
                        mytimer1.stop()
                    }
                }

                Button{
                    id:zoomin
                    text:"ZoomIn"
                    anchors
                    {
                        left: pause.right
                        leftMargin:10
                    }
                    onClicked: {
                        chartView.zoomIn()

                    }
                }

                Button{
                    id:zoomout
                    text:"ZoomOut"
                    anchors
                    {
                        left: zoomin.right
                        leftMargin:10
                    }
                    onClicked: {
                        chartView.zoomOut()
                    }
                }

                Button{
                    id:zoomreset
                    text:"ZoomReset"
                    anchors
                    {
                        left: zoomout.right
                        leftMargin:10
                    }
                    onClicked: {
                        chartView.zoomReset()
                    }
                }

                Button{
                    id:about
                    text:"About"

                    anchors
                    {
                        left: zoomreset.right
                        leftMargin:10
                    }

                    onClicked: {
                        //mytimer1.stop()
                        //timeStep = 0
                        //repeatTimeStep =  0
                        mystackview.push("about.qml")
                    }
                }

                Button{
                    id:exit
                    text:"Exit"

                    anchors
                    {
                        left: about.right
                        leftMargin:10
                    }

                    onClicked: {
                        Qt.quit()
                    }
                }
            }
        }
    }
}

