Rectangle {
	property string title;
	property string description;
	width: 150;
	height: 150;
	radius: width / 2;
	color: "red";

	Text {
		anchors.bottom: parent.top;
		width: 100%;
		horizontalAlignment: Text.AlignHCenter;
		font.pixelSize: 18;
		text: parent.title;
		color: "#000";
	}

	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		wrapMode: Text.WordWrap;
		font.pixelSize: 21;
		text: parent.description;
		color: "#fff";
	}
}

