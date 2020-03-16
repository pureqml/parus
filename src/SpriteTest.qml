TestPage {
	id: spriteTestProto;
	property string source;
	title: tr("Sprites");
	source: "assets/inferno.png";

	onCompleted: { this.setFocus(); }

	onKeyPressed: {
		switch(key) {
			case 'Space':
			case 'Select':
				testSprite.running = !testSprite.running;
				break;
			case 'Left':
				if (spriteRect.hover.value)
					spriteRect.width--;
				else
					testSprite.currentFrame = (--testSprite.currentFrame + testSprite.frameCount ) % testSprite.frameCount;
				break;
			case 'Right':
				if (spriteRect.hover.value)
					spriteRect.width++;
				else
					testSprite.currentFrame = ++testSprite.currentFrame % testSprite.frameCount;
				break;
			case 'R':
				testSprite.repeat = !testSprite.repeat;
				break;
			case 'Up':
				if (spriteRect.hover.value)
					spriteRect.height--;
				break;
			case 'Down':
				if (spriteRect.hover.value)
					spriteRect.height++;
				break;
			case 'Q':
			case 'L':
				fileInput.reload();
				break;
		}
	}

	Image {
		id: wholeImg;
		fillMode: Image.PreserveAspectFit;
		source: spriteTestProto.source;
		width: Math.min(600, 100% - x - 30);
		height: spriteRect.height;
		y: 20;
		x: spriteRect.width + 50;

		Rectangle {
			anchors.centerIn: parent;
			width: parent.paintedWidth; height: parent.paintedHeight;
			border.width: 1; border.color: "#039BE5";

			ImageMixin {
				width: 100%;
				height: 100%;
				source: "assets/checkerboard.png";
				fillMode: Image.Tile;
				z: -2;
			}

			Text {
				y: 100% + 4;
				font.pixelSize: 10;
				color: "#626262";
				text: "Source height:<b> " + testSprite.paintedHeight + "</b>, width: <b> "
					+ testSprite.sourceWidth + "</b>";
			}

			Rectangle {
				x: (testSprite.currentFrame % testSprite.cols) * width;
				y: Math.floor(testSprite.currentFrame / testSprite.cols) * height;
				width: testSprite.width / testSprite.sourceWidth * 100%;
				height: testSprite.height / testSprite.paintedHeight * 100%;
				border.width: 1;
				border.color: (testSprite.height > testSprite.paintedHeight) || (testSprite.width > testSprite.sourceWidth) ? "red" : "#4CAF50";
			}
		}
	}

	ResizableBox {
		id: spriteRect;
		y: 20; x: 20;
		color: colorInput.color;
		border.width: 0;
		effects.shadow.y: 1;
		effects.shadow.blur: 12;
		effects.shadow.spread: 0;
		property HoverMixin hover: HoverMixin {}

		AnimatedSprite {
			id: testSprite;
			property int cols: Math.floor(sourceWidth / width);
			source: spriteTestProto.source;
			width: 100%;
			height: 100%;
		}

		Rectangle {
			width: 100%;
			height: 100%;
			color: "#00000044";
			opacity: parent.hover.value;
			Behavior on opacity { Animation { duration: 300; }}

			ClickMaterialButton {
				icon: "remove_circle_outline";
				x: 20; y: 2;
				onClicked: { spriteRect.width--; }
			}

			ClickMaterialButton {
				icon: "add_circle_outline";
				x: 40; y: 2;
				onClicked: { spriteRect.width++; }
			}

			ClickMaterialButton {
				icon: "remove_circle_outline";
				x: 2; y: 20;
				onClicked: { spriteRect.height--; }
			}

			ClickMaterialButton {
				icon: "add_circle_outline";
				x: 2; y: 40;
				onClicked: { spriteRect.height++; }
			}
		}


		Text {
			y: 100% + 4;
			color: "#212121";
			font.pixelSize: 10;
			text: testSprite.width + " x " + testSprite.height;
		}
	}

	function reloadImage() {
		if (!this.imageFile || !this.imageFile.type.match(/image.*/))
			return;

		var reader  = new FileReader();

		reader.onloadend = function () {
			this.testSprite.stop();
			this.source = reader.result;
		}.bind(this)

		reader.readAsDataURL(this.imageFile);
	}

	DropZoneMixin {
		onFilesAdded(files): {
			spriteTestProto.imageFile = files[0];
			spriteTestProto.reloadImage()
		}
	}

	Column {
		width: wholeImg.width + wholeImg.x;
		x: 20; y: Math.max(spriteRect.height, wholeImg.height) + 50;
		spacing: 12;

		Text {
			font.pixelSize: 12;
			font.weight: 300;
			color: "#414141";
			text: "Load/drop(anywhere on the page) file or set URL";
		}

		Row {
			spacing: 10;
			WebItem {
				width: 30; height: 30;
				radius: 16;
				border.width: 1;
				border.color: "#0097A7";
				color: hover ? "#0097A7" : "transparent";
				Behavior on background { Animation { duration: 500; }}
				MaterialIcon {
					anchors.centerIn: parent;
					text: "refresh";
					color: parent.hover ? "white" : "#0097A7";
					Behavior on color { Animation { duration: 500; }}
				}
				onClicked: { if (spriteTestProto.imageFile) spriteTestProto.reloadImage(); }
			}

			FileInput {
				id: fileInput;
				height: 20;
				y: 5;

				onValueChanged: {
					spriteTestProto.imageFile = this.element.dom.files[0];
					spriteTestProto.reloadImage();
				}
			}
		}

		Row {
			spacing: 10;

			TextInput {
				id: urlInput;
				height: 32; width: 200;
				font.pixelSize: 16;
				paddings.left: 8;
				Border { width: 1; color: "#AAA"; }
			}

			WebItem {
				width: 80; height: 30;
				radius: 5;
				border.width: 1;
				border.color: "#0288D1";
				color: hover ? border.color : "transparent";
				Behavior on background { Animation { duration: 500; }}
				TextMixin {
					text: "Set URL";
					color: parent.hover ? "white" : "#626262";
					Behavior on color { Animation { duration: 500; }}
				}
				onClicked: { testSprite.stop(); spriteTestProto.source = urlInput.text; }
			}
		}

		InputWrapper {
			property int safeNum: Math.floor(testSprite.sourceWidth / testSprite.width) * Math.floor(testSprite.paintedHeight / testSprite.height);
			text: 'Total number of frames <span style="color:#'  + (safeNum < testSprite.frameCount ? 'EE5555' : '55AA55') + ';">(safe&nbsp;number&nbsp;is&nbsp;' + safeNum + ')</span>';
			NumberInput {
				id: frames;
				height: 32; width: 60;
				font.pixelSize: 16;
				onValueChanged: { testSprite.frameCount = value; if (testSprite.running) testSprite.restart() }
				Border { width: 1; color: "#AAA"; }
				onCompleted: { this.value = 16;}
			}
		}

		InputWrapper {
			text: "Duration of the animation (" + Math.floor(100000 / testSprite.interval) / 100 + " fps)";
			NumberInput {
				id: durationInput;
				height: 32; width: 60;
				font.pixelSize: 16;
				step: value < 100 ? 1 : (value < 1000 ? 10 : 100);
				onValueChanged: { testSprite.duration = value; if (testSprite.running) testSprite.restart() }
				Border { width: 1; color: "#AAA"; }
				onCompleted: { this.value = 600;}
			}
		}

		InputWrapper { text: "Frame width"; NumberInput {
			id: widthInput;
			height: 32; width: 60;
			value: spriteRect.width;
			font.pixelSize: 16;
			onValueChanged: { spriteRect.width = value; if (testSprite.running) testSprite.restart() }
			Border { width: 1; color: "#AAA"; }
			onCompleted: { this.value = 207;}
		}}

		InputWrapper { text: "Frame height"; NumberInput {
			id: heightInput;
			height: 32; width: 60;
			value: spriteRect.height;
			font.pixelSize: 16;
			onValueChanged: { spriteRect.height = value; if (testSprite.running) testSprite.restart() }
			Border { width: 1; color: "#AAA"; }
			onCompleted: { this.value = 217;}
		}}

		InputWrapper { text: "Background color"; ColorInput {
			id: colorInput;
			height: 32; width: 60;
			color: "#FFFFFF";
			Border { width: 1; color: "#AAA"; }
		}}

		Row {
			spacing: 8;

			WebItem {
				width: 80;
				height: 30;
				radius: 5;
				border.width: 1;
				border.color: testSprite.running ? "#EF6C00" : "#8BC34A";
				color: hover ? border.color : "transparent";

				TextMixin {
					text: testSprite.running ? "Pause" : "Start";
					color: parent.hover ? "white" : "#626262";
					Behavior on color { Animation { duration: 500; }}
				}

				onClicked: { testSprite.running = !testSprite.running; }

				Behavior on background { Animation { duration: 500; }}
			}
			WebItem {
				width: 30; height: 30;
				radius: 16;
				border.width: 1;
				border.color: "#0097A7";
				color: testSprite.repeat ? "#0097A7" : "transparent";
				Behavior on background { Animation { duration: 250; }}
				MaterialIcon {
					anchors.centerIn: parent;
					text: "autorenew";
					color: testSprite.repeat ? "white" : "#0097A7";
					Behavior on color { Animation { duration: 250; }}
				}
				onClicked: { testSprite.repeat = !testSprite.repeat; }
			}
		}

		Row {
			spacing: 5;
			height: 32;

			Text {
				anchors.verticalCenter: parent.verticalCenter;
				font.pixelSize: 20;
				font.weight: 300;
				color: "#626262";
				text: "Current frame ";
			}

			ClickMaterialButton {
				y: 5;
				color: "#00695C";
				icon: 'fast_rewind';
				onClicked: { testSprite.currentFrame = (--testSprite.currentFrame + testSprite.frameCount) % testSprite.frameCount }
			}

			Text {
				anchors.verticalCenter: parent.verticalCenter;
				font.pixelSize: 20;
				font.weight: 300;
				color: "#414141";
				text: testSprite.currentFrame;
			}

			ClickMaterialButton {
				y: 5;
				color: "#00695C";
				icon: "fast_forward";
				onClicked: { testSprite.currentFrame = ++testSprite.currentFrame % testSprite.frameCount }
			}
		}

		Text {
			width: 100%;
			color: "#616161";
			font.pixelSize: 12;
			wrapMode: Text.WordWrap;
			text: '
			<b>Tips:</b><br>
			<ul style="list-style-type:circle">
				<li>
					<b>Left, Right</b> - if the frame hovered, to agjust width, otherwise move to the next/previous frame;
				</li>
				<li>
					<b>Up, Down</b> - if the frame hovered, to adjust height;
				</li>
				<li>
					<b>Enter or Space</b> - start or pause animation;
				</li>
				<li>
					<b>R</b> - activates autorepeat;
				</li>
				<li>
					<b>Q or L</b> - reload local image;
				</li>
				<li>
					Start button trigger animation cycle once, set autorepeat flag for infinite loop;
				</li>
				<li>
					Realod button reloads the resource from your filesystem if you choosed one(might be useful to keep all current values and adjust the resource);
				</li>
				<li>
					The frame can be adjusted manually by resizing it\'s rectangle, using plus/minus when hovered, or via inputs above.
				</li>
			</ul>
			View the project on <a href="https://github.com/vkrv/spritest">GitHub<a><br><br>';
		}
	}
}
