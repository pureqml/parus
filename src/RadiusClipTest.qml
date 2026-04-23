TestPage {
	id: radiusTestClip;
	property string testImage: "assets/doge-110x110.png";
	title: tr("Radius/clip");

	Rectangle {
		x: 10;
		y: 10;
		width: 200;
		height: 200;
		radius: 50;
		color: "red";

		Text {
			width: 100%;
			height: 100%;
			anchors.horizontalCenter: parent.horizontalCenter;
			verticalAlignment: Text.AlignVCenter;
			color: "white";
			font.pixelSize: 24;
			text: "Radius: 50";
		}
	}

	Image {
		x: 220;
		y: 10;
		width: 200;
		height: 200;
		radius: 50;
		source: parent.testImage;

		ImageTestText {
			wrapMode: Text.WordWrap;
			anchors.bottomMargin: 100;
			text: "Image in rect with radius: 50";
		}
	}

	Rectangle {
		x: 10;
		y: 220;
		width: 200;
		height: 200;
		radius: 50;
		color: "red";

		Image {
			anchors.fill: parent;
			source: radiusTestClip.testImage;

			ImageTestText {
				wrapMode: Text.WordWrap;
				anchors.bottomMargin: 100;
				text: "Image in rect with radius: 50";
			}
		}
	}

	Rectangle {
		x: 220;
		y: 220;
		width: 200;
		height: 200;
		radius: 50;
		color: "red";
		clip: true;

		Image {
			anchors.fill: parent;
			source: radiusTestClip.testImage;

			ImageTestText {
				wrapMode: Text.WordWrap;
				anchors.bottomMargin: 100;
				text: "Image in rect with clip and radius: 50";
			}
		}
	}

	Item {
		x: 10;
		y: 440;
		width: 200;
		height: 200;
		radius: 50;
		clip: true;

		Image {
			anchors.fill: parent;
			source: radiusTestClip.testImage;

			ImageTestText {
				wrapMode: Text.WordWrap;
				anchors.bottomMargin: 100;
				text: "Image in item with clip and radius: 50";
			}
		}
	}
}
