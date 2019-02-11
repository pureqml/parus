TestPage {
	width: 100%;
	height: 100%;
	title: tr("SeqAnimation");

	Image {
		id : doge;
		source: "assets/doge.png";
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter : parent.verticalCenter;
	}
    SequentialAnimation {
        id: dogeplox;
        Animation { target: doge.transform; property: "rotate"; to: 10; duration: 100; }
        Animation { target: doge.transform; property: "rotate"; to: -10; duration: 100; }
        Animation { target: doge.transform; property: "rotate"; to: 10; duration: 100; }
        Animation { target: doge.transform; property: "rotate"; to: -10; duration: 100; }
        Animation { target: doge.transform; property: "rotate"; to: 0; duration: 100; }
        Animation { target: doge.transform; property: "rotate"; to: 0; duration: 500; }
    }
	Button {
		anchors.bottom: doge.bottom;
		anchors.horizontalCenter : doge.horizontalCenter;
		anchors.margins: -30;
		text: "Start";
		onClicked:  {
			log('starting animation...')
			dogeplox.running = true;
		}
	}
}
