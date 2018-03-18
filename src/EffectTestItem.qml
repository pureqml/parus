Item {
	property string text;
	width: 200;
	height: 100;

	Text {
		width: 100%;
		height: 100%;
		color: "#fff";
		text: parent.text;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		z: parent.z + 1;
	}
}
