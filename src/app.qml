Item {
	anchors.fill: context;

	ListView {
		id: menu;
		x: 5;
		y: 5;
		width: 20%;
		height: 100%;
		spacing: 5;
		model: ListModel { }
		delegate: WebItem {
			width: 100%;
			height: 60;
			color: activeFocus ? "#00f" : "#626262";

			Text {
				width: 100%;
				height: 100%;
				color: "#fff";
				text: model.title;
				font.pixelSize: 32;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
			}

			onClicked: { menu.currentIndex = model.index }
		}

		FocusOnHoverMixin { }
	}

	PageStack {
		x: 20%;
		width: 80%;
		height: 100%;
		currentIndex: menu.currentIndex;

		RectangleTest {}
		TextTest {}
		ImageTest {}
		EffectsTest {}
		TimerTest {}
		MixinTest {}
		ProxyModelTest {}
		SpriteTest {}

		onCompleted: {
			var menuData = []
			var children = this.children

			for (var i = 0; i < children.length; ++i)
				menuData.push({ title: children[i].title })

			menu.model.append(menuData)
		}
	}
}
