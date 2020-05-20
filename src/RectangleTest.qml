TestPage {
	title: tr("Rectangle");

	Rectangle {
		x: 10;
		y: 10;
		width: 300;
		height: 450;
		color: "red";
		border.width: 3;
		border.color: "#000";

		Text {
			width: 200;
			height: 100%;
			anchors.horizontalCenter: parent.horizontalCenter;
			verticalAlignment: Text.AlignVCenter;
			color: "white";
			font.pixelSize: 24;
			text: "Color: " + parent.color + "<br>" +
				"Width: " + parent.width + "<br>" +
				"Height: " + parent.height + "<br>" +
				"Radius: " + parent.radius.radius + "<br>" +
				"Border.width: " + parent.border.width + "<br>" +
				"Border.color: " + parent.border.color;
		}
	}

	Rectangle {
		x: 340;
		y: 10;
		width: 300;
		height: 450;
		color: "blue";
		radius: 40;
		border.width: 10;
		border.color: "#f00";

		Text {
			width: 200;
			height: 100%;
			anchors.horizontalCenter: parent.horizontalCenter;
			verticalAlignment: Text.AlignVCenter;
			color: "white";
			font.pixelSize: 24;
			text: "Color: " + parent.color + "<br>" +
				"Width: " + parent.width + "<br>" +
				"Height: " + parent.height + "<br>" +
				"Radius: " + parent.radius.radius + "<br>" +
				"Border.width: " + parent.border.width + "<br>" +
				"Border.color: " + parent.border.color;
		}
	}

	Rectangle {
		x: 680;
		y: 10;
		width: 300;
		height: 300;
		color: "#424242";
		radius: width / 2;
		border.width: 3;
		border.color: "#0f0";

		Text {
			width: 200;
			height: 100%;
			anchors.horizontalCenter: parent.horizontalCenter;
			verticalAlignment: Text.AlignVCenter;
			color: "white";
			font.pixelSize: 24;
			text: "Color: " + parent.color + "<br>" +
				"Width: " + parent.width + "<br>" +
				"Height: " + parent.height + "<br>" +
				"Radius: " + parent.radius.radius + "<br>" +
				"Border.width: " + parent.border.width + "<br>" +
				"Border.color: " + parent.border.color;
		}
	}

	Rectangle {
		x: 650;
		y: 350;
		width: 100;
		height: 100;
		color: '#00f';
		opacity: 0.5;

		Rectangle {
			border.type: Border.Inner;
			anchors.fill: parent;
			border.width: 10;
			border.color: '#0f0';
			color: '#f00';
			opacity: 0.7;

			Rectangle {
				width: 70;
				height: 20;
				anchors.centerIn: parent;
				color: "black";

				Text {
					width: 100%;
					horizontalAlignment: Text.AlignHCenter;
					color: "#0f0";
					text: "Inner";
				}
			}
		}
	}

	Rectangle {
		x: 770;
		y: 350;
		width: 100;
		height: 100;
		color: '#00f';
		opacity: 0.5;

		Rectangle {
			border.type: Border.Outer;
			anchors.fill: parent;
			border.width: 10;
			border.color: '#0f0';
			color: '#f00';
			opacity: 0.7;

			Rectangle {
				width: 70;
				height: 20;
				anchors.centerIn: parent;
				color: "black";

				Text {
					width: 100%;
					horizontalAlignment: Text.AlignHCenter;
					color: "#0f0";
					text: "Outer";
				}
			}
		}
	}

	Rectangle {
		x: 900;
		y: 350;
		width: 100;
		height: 100;
		color: '#00f';
		opacity: 0.5;

		Rectangle {
			border.type: Border.Center;
			anchors.fill: parent;
			border.width: 10;
			border.color: '#0f0';
			color: '#f00';
			opacity: 0.7;

			Rectangle {
				width: 70;
				height: 20;
				anchors.centerIn: parent;
				color: "black";

				Text {
					width: 100%;
					horizontalAlignment: Text.AlignHCenter;
					color: "#0f0";
					text: "Center";
				}
			}
		}
	}

	Rectangle {
		x: 10;
		y: 500;
		width: 300;
		height: 300;

		Gradient {
			GradientStop { position: 0.0; color: "red"; }
			GradientStop { position: 1.0; color: "blue"; }
		}

		Text {
			color: "#fff";
			anchors.centerIn: parent;
			text: "Gradient from red to blue";
		}
	}

	RectBorderSideItem {
		x: 320;
		y: 500;
		border.left.width: 4;
		border.left.color: "#f00";
		text: "Left border";
	}

	RectBorderSideItem {
		x: 480;
		y: 500;
		border.right.width: 4;
		border.right.color: "#f00";
		text: "Right border";
	}

	RectBorderSideItem {
		x: 320;
		y: 660;
		border.bottom.width: 4;
		border.bottom.color: "#f00";
		text: "Bottom border";
	}

	RectBorderSideItem {
		x: 480;
		y: 660;
		border.top.width: 4;
		border.top.color: "#f00";
		text: "Top border";
	}

	Rectangle {
		y: 500;
		x: 700;
		width: 300;
		height: 300;
		color: '#03dac6';
		border.color: '#018786';
		border.width: 10;

		radius.topLeft: 40;
		Text { anchors.top: parent.top; anchors.left: parent.left; anchors.margins: 20; text: "40px"; }

		radius.topRight: 100;
		Text { anchors.top: parent.top; anchors.right: parent.right; anchors.margins: 50; text: "100px"; }

		radius.bottomLeft: 150;
		Text { anchors.bottom: parent.bottom; anchors.left: parent.left; anchors.margins: 55; text: "150px"; }
		radius.bottomRight: 60;
		Text { anchors.bottom: parent.bottom; anchors.right: parent.right; anchors.margins: 40; text: "60px"; }
	}
}
