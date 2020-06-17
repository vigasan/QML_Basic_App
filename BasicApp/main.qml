import QtQuick 2.12
import QtQuick.Window 2.12

Window
{
    visible: true
    width: 800
    height: 480
    title: qsTr("Hello World")
    color: "black"

    property int counter: 0

    FontLoader
    {
        id: fontOpenSans
        source:"qrc:/fonts/OpenSans-Light.ttf"
    }

    Rectangle
    {
        id: button
        height: 60
        width: 150
        color: "transparent"
        anchors.centerIn: parent
        border.color: "white"
        border.width: 1
        radius: 5

        Text {
            id: buttonText
            text: qsTr("Start")
            anchors.centerIn: parent
            color: "white"

            font.family: fontOpenSans.name
            font.pointSize: 20
        }

        MouseArea
        {
            anchors.fill: parent
            onPressed:
            {
                if(timer.running === false)
                {
                    timer.start();
                    buttonText.text = "Stop"
                    buttonText.color = "red"
                } else
                {
                    timer.stop()
                    buttonText.text = "Start"
                    buttonText.color = "White"
                }



            }

        }

    }

    Image
    {
        id: imgSun
        source: "qrc:/images/sun.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: button.top
        anchors.bottomMargin: 50
    }

    Text
    {
        id: textTimer
        text: counter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: button.bottom
        anchors.topMargin: 30
        font.family: fontOpenSans.name
        font.pointSize: 50
        color: "white"
    }

    Timer
    {
        id: timer
        interval: 100 // 100 msecond
        running: false
        repeat: true
        onTriggered:
        {
            counter++
        }
    }

    Rectangle
    {
        id: resetbutton
        height: 60
        width: 150
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textTimer.bottom
        anchors.topMargin: 20
        color: "transparent"
        border.color: "white"
        border.width: 1
        radius: 5

        Text {
            id: resetText
            text: qsTr("Reset")
            anchors.centerIn: parent
            color: "white"

            font.family: fontOpenSans.name
            font.pointSize: 20
        }

        MouseArea
        {
            anchors.fill: parent
            onPressed:
            {
                counter = 0;
            }
        }

    }
}
