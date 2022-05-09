TestPage {
	title: tr("GridViewTest");

	GridView {
		trace: true;
		clip: true;
		anchors.fill: parent;
		spacing: 20;
		anchors.margins: 40;
		cellWidth: 150;
		cellHeight: 100;
		model: ListModel { }
		delegate: Rectangle {
			width: 150;
			height: 100;
			focus: !model.unfocusable;
			color: activeFocus ? 'red' : (model.unfocusable ? 'gray' : 'blue');

			Text {
				anchors.centerIn: parent;
				visible: model.unfocusable;
				text: "UNFOCUSABLE";
				color: "#fff";
			}
		}

		onCompleted: {
			this.model.assign([
				{}, {}, { unfocusable: true }, {}, {}, {},
				{}, {}, {}, {}, {}, {},
				{}, {}, { unfocusable: true }, {}, { unfocusable: true }, {},
				{}, {}, {}, {}, {}, {}
			])
			this.setFocus()
		}
	}
}
