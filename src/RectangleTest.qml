TestPage {
	title: "Rectangle";

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
				"Radius: " + parent.radius + "<br>" +
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
				"Radius: " + parent.radius + "<br>" +
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
				"Radius: " + parent.radius + "<br>" +
				"Border.width: " + parent.border.width + "<br>" +
				"Border.color: " + parent.border.color;
		}
	}
}
