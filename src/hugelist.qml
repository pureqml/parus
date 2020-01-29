Item {
	anchors.fill: context;
	anchors.margins: 10;

		ListView {
			nativeScrolling: true;
			//trace: true;
			orientation: ListView.Horizontal;
			width: 100%;
			height: 100%;
			keyNavigationWraps: false;
			positionMode: ListView.Center;
			prerender: 1;
			delegate: Rectangle { focus: true; width: 10; height: 100; color: "#000"; }
			spacing: 1;
			model: ListModel {
				id: testModel;
			}
			onCurrentIndexChanged: {
				log('current', value)
			}
		}

	onCompleted: {
		var rows = []
		for(var i = 0; i < 100000; ++i) {
			rows.push({})
		}
		testModel.assign(rows)
	}
}
