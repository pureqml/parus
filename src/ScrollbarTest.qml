TestPage {
	title: "Scrollbar";

	Rectangle {
		id: detailedContainer;
		x: 30;
		y: 30;
		width: 854;
		height: 260;
		border.width: 3;
		border.color: "red";
		border.type: Border.Outer;
		focus: true;
		clip: true;

		WheelMixin { }

		Text {
			id: detailedText;
			property int shift;
			anchors.left: parent.left;
			anchors.right: parent.right;
			transform.translateY: shift;
			font.pixelSize: 21;
			color: "black";
			wrapMode: Text.WordWrap;
			text: "Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo Olololo ";

			Behavior on transform { Animation { duration: 300; easing: "ease-out"; } }
		}

		ScrollBar {
			visible: contentHeight + 50 > displayHeight;
			contentY: detailedText.shift * (1.0 / detailedContainer.height) * parent.height;
			anchors.right: parent.right;
			anchors.rightMargin: 5;
			contentHeight: detailedText.height * (1.0 / detailedContainer.height) * parent.height;
			displayHeight: parent.height;
			barColor: "red";
		}

		onWheel(delta): {
			if (delta.wheelDeltaY < 0)
				this.moveDown()
			else
				this.moveUp()
		}

		onUpPressed: { this.moveUp() }
		onDownPressed: { this.moveDown() }

		moveUp: {
			if (detailedText.height > detailedContainer.height)
				detailedText.shift = detailedText.shift + 50 < 0 ? detailedText.shift + 50 : 0
		}

		moveDown: {
			if (detailedText.height > detailedContainer.height)
				detailedText.shift = detailedText.shift - 50 > detailedContainer.height - detailedText.height ? detailedText.shift - 50 : (detailedContainer.height - detailedText.height)
		}

	}

}

