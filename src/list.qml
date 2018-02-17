Item {
	id: mainWindow;
	width: 1280;
	height: 720;
	anchors.margins: 10;

	Rectangle {
		y: 40%;
		width: 100%;
		height: 60%;
		clip: true;
		border.width: 2;
		border.color: "#f00";

		ListView {
			width: 100%;
			height: 100%;
			spacing: 30;
			keyNavigationWraps: false;
			positionMode: ListView.Center;
			//content.cssNullTranslate3D: true;
			//content.cssTranslatePositioning: true;
			//animationDuration: 200;
			//layoutDelay: 500;
			//prerenderDelay: 1000
			delegate: OverflowRowDelegate {}
			model: ListModel {
				ListElement { } ListElement { } ListElement { } ListElement { }
				ListElement { } ListElement { } ListElement { } ListElement { }
				ListElement { } ListElement { } ListElement { } ListElement { }
				ListElement { } ListElement { } ListElement { } ListElement { }
				ListElement { } ListElement { } ListElement { } ListElement { }
				ListElement { } ListElement { } ListElement { } ListElement { }
				ListElement { } ListElement { } ListElement { } ListElement { }
			}
		}
	}
}
