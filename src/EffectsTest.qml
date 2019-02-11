TestPage {
	width: 100%;
	height: 100%;
	title: tr("Effects");

	EffectTestItem {
		y: 5;
		anchors.horizontalCenter: parent.horizontalCenter;
		text: "Original rect";

		EffectRectangle { }
	}

	Grid {
		y: 120;
		x: 10;
		spacing: 5;
		width: parent.width - x - 10;

		EffectTestItem {
			text: "brightness: 0.5";

			EffectRectangle { effects.brightness: 0.5; }
		}

		EffectTestItem {
			text: "blur: 10";

			EffectRectangle { effects.blur: 10; }
		}

		EffectTestItem {
			text: "grayscale: 1";

			EffectRectangle { effects.grayscale: 1; }
		}

		EffectTestItem {
			text: "sepia: 2.5";

			EffectRectangle { effects.sepia: 2.5; }
		}

		EffectTestItem {
			text: "contrast: 0.5";

			EffectRectangle { effects.contrast: 0.5; }
		}

		EffectTestItem {
			text: "hueRotate: 10.5";

			EffectRectangle { effects.hueRotate: 10.5; }
		}

		EffectTestItem {
			text: "invert: 1";

			EffectRectangle { effects.invert: 1; }
		}

		EffectTestItem {
			text: "saturate: 0.5";

			EffectRectangle { effects.saturate: 0.5; }
		}
	}
}
