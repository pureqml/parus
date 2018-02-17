Item {
	width: 100%;
	height: 150;

	Text {
		text: "Row: " + model.index;
		color: "#000";
		font.pixelSize: 20;
	}

	ListView {
		y: 20;
		width: 100%;
		height: 130;
		prerender: 5;
		spacing: 10;
		clip: true;
		keyNavigationWraps: false;
		orientation: ListView.Horizontal;
		positionMode: ListView.Center;
		//content.cssNullTranslate3D: true;
		//content.cssTranslatePositioning: true;
		//animationDuration: 200;
		//layoutDelay: 500;
		//prerenderDelay: 1000
		animationDuration: 200;
		model: ListModel {
			ListElement { } ListElement { } ListElement { } ListElement { }
			ListElement { } ListElement { } ListElement { } ListElement { }
			ListElement { } ListElement { } ListElement { } ListElement { }
			ListElement { } ListElement { } ListElement { } ListElement { }
			ListElement { } ListElement { } ListElement { } ListElement { }
			ListElement { } ListElement { } ListElement { } ListElement { }
			ListElement { } ListElement { } ListElement { } ListElement { }
		}
		delegate: Rectangle {
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
	}
}
