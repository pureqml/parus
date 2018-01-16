Item {
	anchors.fill: context;

	ListView {
		width: 20%;
		height: 100%;
		spacing: 5;
		model: ListModel {
			ListElement { title: "Rectangle"; }
		}
		delegate: WebItem {
			width: 100%;
			height: 60;
			color: "#00f";

			Text {
				width: 100%;
				height: 100%;
				color: "#fff";
				text: model.title;
				font.pixelSize: 32;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
			}
		}
	}

	PageStack {
		x: 20%;
		width: 80%;
		height: 100%;

		RectangleTest {}
	}
}
