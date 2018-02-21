Item {
	width: 100%;
	height: 150;

	Text {
		text: "Row: " + model.index;
		color: "#000";
		font.pixelSize: 20;
	}

	RollerView {
		x: 65;
		y: 20;
		width: 100%;
		height: 130;
		prerender: 5;
		spacing: 7;
		clip: true;
		keyNavigationWraps: false;
		offlineLayout: true;
		orientation: RollerView.Horizontal;
		animationDuration: 300;
		prerenderDelay: 500;
		content.cssTranslatePositioning: true;
		content.x: 65;
		positionMode: RollerView.Beginning;
		model: ListModel {
			ListElement { } ListElement { } ListElement { } ListElement { }
			ListElement { } ListElement { } ListElement { } ListElement { }
		}
		delegate: OverflowDelegate { }
	}
}
