Rectangle {
	width: height;
	height: 100%;
	color: activeFocus ? "#f00" : "#424242";

	Image {
		anchors.fill: parent;
		anchors.margins: 10;
		source: "assets/doge.png";
	}

	Text {
		x: 10;
		y: 10;
		font.pixelSize: 24;
		color: "#fff";
		text: model.index;
	}
}
