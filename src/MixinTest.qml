TestPage {
	title: "Mixins";

	Grid {
		x: 20;
		y: 30;
		width: 100%;
		height: 100%;

		MixinRect {
			color: "red";
			description: "This thing must be draggable";
			title: "DragMixin";

			DragMixin { }
		}

		MixinRect {
			color: "blue";
			description: "Title should appears when you hover this thing";
			title: "TitleMixin";

			TitleMixin { value: "AWESOME TITLE"; }
		}

		MixinRect {
			color: "blue";
			title: "ImageMixin";

			ImageMixin {
				width: 100%;
				height: 100%;
				source: "assets/doge-110x110.png";
			}
		}

		MixinRect {
			color: "blue";
			title: "TextMixin";

			TextMixin {
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
				wrapMode: Text.WordWrap;
				font.pixelSize: 21;
				text: "TextMixin text sample";
				color: "#fff";
			}
		}

		MixinRect {
			color: "red";
			border.width: activeFocus ? 4 : 0;
			border.color: "#000";
			description: "Focus On Hover Mixin";
			title: "FocusOnHoverMixin";

			FocusOnHoverMixin { }
		}

		MixinRect {
			color: "blue";
			title: "OrientationMixin";

			OrientationMixin { id: orientation; }

			Text {
				property real alpha: orientation.alpha;
				property real beta: orientation.beta;
				property real gamma: orientation.gamma;
				width: 100%;
				height: 100%;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
				wrapMode: Text.WordWrap;
				font.pixelSize: 21;
				text: "Orientation:<br>a:" + alpha + "<br>b:" + beta + "<br>g:" + gamma;
				color: "#fff";
			}
		}

		MixinRect {
			color: "blue";
			title: "OverflowMixin";

			OverflowMixin { value: OverflowMixin.ScrollX; }

			Text {
				width: 200;
				height: 100%;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
				font.pixelSize: 21;
				text: "This text should be scrolled horizontally";
				color: "#fff";
			}
		}

		MixinRect {
			color: "red";
			description: "This text should be unselectable";
			title: "UserSelectMixin";

			UserSelectMixin { }
		}

		MixinRect {
			description: "Try to swipe here";
			color: "blue";
			title: "SwipeMixin";

			SwipeMixin {
				onVerticalSwiped: { this.parent.description = "VERTICAL SWIPE" }
				onHorizontalSwiped: { this.parent.description = "HORIZONTAL SWIPE" }
			}
		}

		MixinRect {
			color: "red";
			description: "Hovered:" + disableHoverByTimeoutMixin.value;
			title: "DisableHoverByTimeout";

			DisableHoverByTimeoutMixin { id: disableHoverByTimeoutMixin; }
		}
	}

	MixinRect {
		x: 500;
		y: 500;
		color: "red";
		description: "Hovered";
		title: "Fixed PositionMixin: x:" + x + ", y:" + y;

		PositionMixin { value: PositionMixin.Fixed; }
	}

	//TODO: Impl CssMixin
}
