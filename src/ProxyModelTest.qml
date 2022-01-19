TestPage {
	title: tr("ProxyModel");

	ListModel {
		id: testModel;

		ListElement { value: 500; color: "#9E9E9E"; }
		ListElement { value: 300; color: "#E0E0E0"; }
		ListElement { value: 400; color: "#BDBDBD"; }
		ListElement { value: 800; color: "#424242"; }
		ListElement { value: 100; color: "#F5F5F5"; }
		ListElement { value: 700; color: "#616161"; }
		ListElement { value: 600; color: "#757575"; }
		ListElement { value: 50; color: "#FAFAFA"; }
		ListElement { value: 200; color: "#EEEEEE"; }
		ListElement { value: 900; color: "#212121"; }
	}

	core.Text {
		x: 10;
		y: 10;
		text: "Original model";
		color: "#000";
		font.pixelSize: 24;
	}

	ListView {
		x: 10;
		y: 60;
		width: 200;
		height: 90%;
		model: testModel;
		nativeScrolling: true;
		delegate: Rectangle {
			width: 100%;
			height: 50;
			color: model.color;

			Text {
				width: 100%;
				height: 100%;
				color: "#FF5722";
				text: model.value;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
			}
		}
	}

	Text {
		x: 320;
		y: 10;
		text: "Model filter: '>= 500'";
		color: "#000";
		font.pixelSize: 24;
	}

	ListView {
		x: 320;
		y: 60;
		width: 200;
		height: 90%;
		nativeScrolling: true;
		model: ProxyModel {
			target: testModel;

			onCompleted: {
				this.setFilter(function(item) { return item.value >= 500 })
			}
		}
		delegate: Rectangle {
			width: 100%;
			height: 50;
			color: model.color;

			Text {
				width: 100%;
				height: 100%;
				color: "#FF5722";
				text: model.value;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
			}
		}
	}

	Text {
		x: 630;
		y: 10;
		text: "Sorted model";
		color: "#000";
		font.pixelSize: 24;
	}

	ListView {
		x: 630;
		y: 60;
		width: 200;
		height: 90%;
		nativeScrolling: true;
		model: ProxyModel {
			target: testModel;

			onCompleted: {
				this.setCompare(function(a, b) { return a.value > b.value ? 1 : (a.value == b.value ? 0 : -1) })
			}
		}
		delegate: Rectangle {
			width: 100%;
			height: 50;
			color: model.color;

			Text {
				width: 100%;
				height: 100%;
				color: "#FF5722";
				text: model.value;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
			}
		}
	}

	Button {
		id: generateLargeModelButton;
		text: "Generate Large Model";
		anchors.bottom: parent.bottom;
		anchors.horizontalCenter : parent.horizontalCenter;
		anchors.margins: 10;
		color: "#f00";
		textColor: "#fff";
		onClicked: {
			log("generating large model")
			testModel.clear()
			var N = 3000
			var rows = []
			for(var i = 0; i < N; ++i) {
				rows.push({value: i, color: "#000"})
			}
			for (var i = N - 1; i > 0; --i) {
				var j = Math.floor(Math.random() * (i + 1));
				var t = rows[i];
				rows[i] = rows[j];
				rows[j] = t;
			}
			for(var i = 0; i < N; ++i)
				testModel.append(rows[i])
		}
	}

	Button {
		id: inefficientClearButton;
		text: "Inefficient clear";
		anchors.left : generateLargeModelButton.right;
		anchors.bottom: parent.bottom;
		anchors.margins: 10;
		color: "#f00";
		textColor: "#fff";
		onClicked: {
			log("clearing model using single-row remove")
			var n = testModel.count
			while(n--) {
				testModel.remove(0)
			}
		}
	}

	Button {
		text: "Negate All";
		anchors.left : inefficientClearButton.right;
		anchors.bottom: parent.bottom;
		anchors.horizontalCenter : parent.horizontalCenter;
		anchors.margins: 10;
		color: "#f00";
		textColor: "#fff";
		onClicked: {
			log("updating all")
			var n = testModel.count
			for(var i = 0; i < n; ++i) {
				var row = testModel.get(i)
				row.value = -row.value
				testModel.set(i, row)
			}
		}
	}
}
