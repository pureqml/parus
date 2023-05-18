TestPage {
	title: tr("GridViewTest");

	GridView {
		trace: true;
		clip: true;
		anchors.fill: parent;
		anchors.margins: 40;
		cellWidth: 150;
		cellHeight: 100;
		model: ListModel { }
		delegate: Rectangle {
			width: 150;
			height: 100;
			focus: !model.unfocusable;
			color: activeFocus ? 'red' : (model.unfocusable ? 'gray' : 'blue');

			ClickMixin { }

			Text {
				width: 96%;
				anchors.centerIn: parent;
				horizontalAlignment: Text.AlignHCenter;
				wrapMode: Text.WordWrap;
				text: model.unfocusable ? "UNFOCUSABLE<br>click to make focusable" : "click to make unfocusable";
				color: "#fff";
			}

			onClicked: {
				this.parent.model.setProperty(model.index, "unfocusable", !model.unfocusable)
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
