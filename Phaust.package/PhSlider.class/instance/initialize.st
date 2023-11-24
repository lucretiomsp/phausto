initialization
initialize

	super initialize.
	faderCanMove := false.

	"self extent: 400@500"
	cursor := Morph new extent: 400 @ 300.
	cursor color: Color red.
	self drawCursor