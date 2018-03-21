TestPage {
	title: "Timer";

	Timer {
		interval: 3000;
		repeat: true;
		running: parent.visible;

		onTriggered: { runningTestText.triggered = !runningTestText.triggered }
	}

	Timer {
		running: parent.visible;
		interval: 10000000;
		triggeredOnStart: true;

		onTriggered: { trggeredTestText.triggered = true }
	}

	Text {
		id: runningTestText;
		property bool triggered;
		y: 10;
		x: 20;
		color: triggered ? "#0f0" : "#f00";
		font.pixelSize: 32;
		text: "This text color must change every 3 second";
	}


	Text {
		id: trggeredTestText;
		property bool triggered;
		x: 20;
		y: 50;
		color: "#000";
		font.pixelSize: 32;
		text: triggered ? "'triggeredOnStart' works fine" : "If you see this text 'triggeredOnStart' doesn't work";
	}
}
