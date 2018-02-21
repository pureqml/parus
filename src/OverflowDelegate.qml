Rectangle {
	width: 223;
	height: 100%;
	color: activeFocus ? "#f00" : "#424242";

	Image {
		anchors.centerIn: parent;
		width: 110;
		height: 110;
		source: "assets/doge-110x110.png";
	}

	Text {
		x: 10;
		y: 10;
		font.pixelSize: 24;
		color: "#fff";
		text: model.index;
	}
}
