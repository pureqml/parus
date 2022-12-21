Rectangle {
    radius: width / 2;

    property color niceGreen: "#93faa5";
    border.color: niceGreen;
    border.width: 4;

    // Conical gradient draws the level as sector which is overlapped by a circle
    // to make an arc.
    Gradient {
        id: grad;

        type: this.Conical;

        angle: 0;

        GradientStop {
            position: 0.0;
            color: niceGreen;
        }
        GradientStop {
            position: (grad.angle * 180 / Math.PI) / 360;
            color: niceGreen;
        }
        GradientStop {
            position: (grad.angle * 180 / Math.PI) / 360 + 0.001;
            color: "transparent";
        }
        GradientStop {
            position: 1.0;
            color: "transparent";
        }
    }

    Rectangle {
        anchors.fill: parent;
        anchors.margins: 15;
        color: "darkgrey";
        radius: width / 2;

        Text {
            id: valueText;

            anchors.centerIn: parent;
            color: "white";
            font.pixelSize: parent.height / 3;
            text: Math.round(grad.angle / (2 * Math.PI) * 100) + "%";
        }

        Text {
            anchors.top: valueText.bottom;
            anchors.horizontalCenter: valueText;
            anchors.bottomMargin: 20;
            font.pixelSize: valueText.font.pixelSize / 4;
            text: "Conical gradient";
        }
    }

    Timer {
        id: timer;

        interval: 10;
        running: true;
        repeat: true;
        property real step: -0.01;
        onTriggered: {
            if (grad.angle >= Math.PI * 2 || grad.angle <= 0)
                timer.step = -timer.step;

            grad.angle += timer.step;
        }
    }
}

