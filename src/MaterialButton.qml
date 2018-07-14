MaterialIcon {
	color: "#FFC107";
	size: 22;
	width: paintedWidth;
	height: paintedHeight;
	HoverMixin { cursor: "pointer"; }
	onCompleted: { this.style('user-select', 'none'); }
}
