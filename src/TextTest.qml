TestPage {
	width: 100%;
	height: 100%;
	title: tr("Text");

	Column {
		x: 20;
		y: 10;
		width: 180;
		spacing: 10;

		Text {
			font.pixelSize: 24;
			color: "#f00";
			text: "Text color: " + color;
		}

		Text {
			color: "#000";
			text: "Italic text";
			font.italic: 24;
			font.pixelSize: 24;
		}

		Text {
			color: "#000";
			text: "Bold text";
			font.bold: true;
			font.pixelSize: 24;
		}

		Text {
			color: "#000";
			text: "Underline text";
			font.underline: true;
			font.pixelSize: 24;
		}

		Text {
			color: "#000";
			text: "Strike text";
			font.strike: true;
			font.pixelSize: 24;
		}

		Text {
			color: "#000";
			text: "letterSpacing: 5px";
			font.pixelSize: 24;
			font.letterSpacing: 5;
		}
	}

	Column {
		y: 10;
		x: 350;
		width: 350;

		Border { width: 2; color: "#00f"; }

		Text {
			width: 100%;
			color: "#000";
			text: "AlignLeft";
			font.pixelSize: 24;
			horizontalAlignment: Text.AlignLeft;
		}

		Text {
			width: 100%;
			color: "#000";
			text: "AlignHCenter";
			font.pixelSize: 24;
			horizontalAlignment: Text.AlignHCenter;
		}

		Text {
			width: 100%;
			color: "#000";
			text: "AlignRight";
			font.pixelSize: 24;
			horizontalAlignment: Text.AlignRight;
		}
	}

	Rectangle {
		y: 200;
		x: 350;
		width: 350;
		height: 250;
		border.width: 2;
		border.color: "#f00";

		Text {
			width: 100%;
			height: 100%;
			color: "#000";
			text: "AlignTop";
			font.pixelSize: 24;
			verticalAlignment: Text.AlignTop;
		}

		Text {
			width: 100%;
			height: 100%;
			color: "#000";
			text: "AlignVCenter";
			font.pixelSize: 24;
			verticalAlignment: Text.AlignVCenter;
		}

		Text {
			width: 100%;
			height: 100%;
			color: "#000";
			text: "AlignBottom";
			font.pixelSize: 24;
			verticalAlignment: Text.AlignBottom;
		}
	}

	Rectangle {
		x: 20;
		y: 280;
		width: 270;
		height: 100;
		border.width: 2;
		border.color: "#f00";

		Text {
			width: 100%;
			color: "#000";
			font.pixelSize: 24;
			text: "<b>WordWrap:</b> brown fox jumps over lazy dog";
			wrapMode: Text.WordWrap;
		}
	}

	Rectangle {
		x: 20;
		y: 400;
		width: 270;
		height: 100;
		border.width: 2;
		border.color: "#f00";

		Text {
			width: 100%;
			color: "#000";
			font.pixelSize: 24;
			text: "<b>WrapAnywhere:</b> brown fox jumps over lazy dog";
			wrapMode: Text.WrapAnywhere;
		}
	}
}
