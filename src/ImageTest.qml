TestPage {
	property string testImage: "assets/doge-110x110.png";
	width: 100%;
	height: 100%;
	title: tr("Image");

	Image {
		x: 20;
		y: 20;
		source: parent.testImage;

		ImageTestText { text: "Original Image"; }
	}

	Image {
		x: 140;
		y: 20;
		width: 200;
		height: 110;
		source: parent.testImage;

		ImageTestText { text: "fillMode: Stretch"; }
	}

	Image {
		x: 350;
		y: 20;
		width: 230;
		height: 300;
		source: parent.testImage;
		fillMode: Image.PreserveAspectCrop;

		ImageTestText { text: "fillMode: PreserveAspectCrop"; }
	}

	Image {
		x: 20;
		y: 140;
		width: 320;
		height: 180;
		source: parent.testImage;
		fillMode: Image.PreserveAspectFit;

		Border { width: 2; color: "#f00"; }

		ImageTestText { text: "fillMode: PreserveAspectFit"; }
	}

	Image {
		x: 20;
		y: 330;
		width: 320;
		height: 180;
		source: parent.testImage;
		fillMode: Image.TileHorizontally;

		ImageTestText { text: "fillMode: TileHorizontally"; }
	}

	Image {
		x: 590;
		y: 20;
		width: 120;
		height: 300;
		source: parent.testImage;
		fillMode: Image.TileVertically;

		ImageTestText { text: "fillMode: TileVertically"; }
	}

	Image {
		x: 350;
		y: 330;
		width: 360;
		height: 180;
		source: parent.testImage;
		fillMode: Image.Tile;

		ImageTestText { text: "fillMode: Tile"; }
	}
}
