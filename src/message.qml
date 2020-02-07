Rectangle {
	anchors.fill: parent;
	color: 'black';

	Text {
		id: result;
		font.family: 'VT323';
		textFormat: Text.Text;
		color: '#00ff41';
	}

	IFrame {
		onCompleted: {
			result.text += 'Opening message source page...\n'
			this.source = 'https://svalko.org/pureqml/message.php'
		}

		onLoaded: {
			result.text += 'Target window loaded...\n'
			var request = {'request': 'GetToken'}
			result.text += 'Sending request ' + JSON.stringify(request) + '...\n'
			this.postMessage(request)
		}
		onMessage(event): {
			result.text += 'Got answer from ' + event.origin + '\n'
			result.text += '→' + JSON.stringify(event.data) +'\n'
			result.text += 'DONE'
		}
	}
	constructor: {
		$html5.html.loadExternalStylesheet('https://fonts.googleapis.com/css?family=VT323&display=swap')
	}
}
