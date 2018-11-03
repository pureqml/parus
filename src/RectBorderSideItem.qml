Rectangle {
	property string text;
	width: 150;
	height: 150;
	color: "#424242";

	Text {
		color: "#fff";
		anchors.centerIn: parent;
		text: parent.text;
	}
}
