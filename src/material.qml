GridView {
	anchors.fill: parent;
	cellWidth : width / 14;
	cellHeight: height / 19;

	model : ListModel {

		appendColor(name, color): {
			this.append({color: color, name: name, hex: color.hex()})
		}
		generate(color): {
			var shade = function(color, value) {
				var t = value < 0? 0: 255
				var p = value < 0? -value: value

				var r = Math.round((t - color.r) * p + color.r)
				var g = Math.round((t - color.g) * p + color.g)
				var b = Math.round((t - color.b) * p + color.b)

				var c = new _globals.core.Color([r, g, b])
				return c
			}

			this.appendColor( "50", shade(color, 0.91))
			this.appendColor("100", shade(color, 0.7))
			this.appendColor("200", shade(color, 0.5))
			this.appendColor("300", shade(color, 1/3))
			this.appendColor("400", shade(color, 1/6))

			this.appendColor("500", shade(color, 0))
			this.appendColor("600", shade(color, -1/8))
			this.appendColor("700", shade(color, -2/8))
			this.appendColor("800", shade(color, -3/8))
			this.appendColor("900", shade(color, -4/8))

			this.appendColor("A100", shade(color, 0.7))
			this.appendColor("A200", shade(color, 0.5))
			this.appendColor("A400", shade(color, 1/6))
			this.appendColor("A700", shade(color, -1/4))
		}

		onCompleted: {
			this.generate(new _globals.core.Color('#F44336'))
			this.generate(new _globals.core.Color('#E91E63'))
			this.generate(new _globals.core.Color('#9C27B0'))

			this.generate(new _globals.core.Color('#673AB7'))
			this.generate(new _globals.core.Color('#3F51B5'))
			this.generate(new _globals.core.Color('#2196F3'))

			this.generate(new _globals.core.Color('#03A9F4'))
			this.generate(new _globals.core.Color('#00BCD4'))
			this.generate(new _globals.core.Color('#009688'))

			this.generate(new _globals.core.Color('#4CAF50'))
			this.generate(new _globals.core.Color('#8BC34A'))
			this.generate(new _globals.core.Color('#CDDC39'))

			this.generate(new _globals.core.Color('#FFEB3B'))
			this.generate(new _globals.core.Color('#FFC107'))
			this.generate(new _globals.core.Color('#FF9800'))

			this.generate(new _globals.core.Color('#FF5722'))
			this.generate(new _globals.core.Color('#795548'))
			this.generate(new _globals.core.Color('#9E9E9E'))

			this.generate(new _globals.core.Color('#607D8B'))
		}
	}
	delegate: Rectangle {
		width: parent.cellWidth;
		height: parent.cellHeight;
		color: model.color;
		Text {
			anchors.fill: parent;
			text: model.name;
		}
	}
}
