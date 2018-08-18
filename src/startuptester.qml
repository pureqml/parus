Item {
	anchors.fill: context;

	GridView {
		anchors.fill: parent;
		cellWidth: 10;
		cellHeight: 10;
		model: ListModel {}
		delegate: Rectangle {
			width: 10;
			height: 10;
			color: model.color;
		}

		onCompleted: {
			var colors = [
				"red",
				"blue",
				"yellow",
				"cyan",
				"black",
				"green"
			]

			for (var i = 0; i < 100500; ++i)
				this.model.append({ color: colors[Math.floor(Math.random() * colors.length)] })
		}
	}
}
