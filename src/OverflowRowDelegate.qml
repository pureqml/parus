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
		delegate: OverflowDelegate { }
	}
}
