Item {
	property string text;
	height: decsText.height + 12;
	width: 100%;

	Text {
		id: decsText;
		x: 70;
		y: 4;
		width: 100% - 70;
		wrapMode: Text.WordWrap;
		font.pixelSize: 20;
		font.weight: 300;
		color: "#626262";
		text: parent.text;
	}
}
