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

	Text {
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
		height: 100%;
		model: testModel;
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
		height: 100%;
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
		height: 100%;
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
}
