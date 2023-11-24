as yet unclassified
wrappedInWindow
	"Changed to include the inset margin in the bound calculation."

	| window extent |
	window := FaderWindow new.
	window
		addMorph: self frame: (0@0 extent: 1@1);
		updatePaneColors.
	" calculate extent after adding in case any size related attributes were changed.  Use
	fullBounds in order to trigger re-layout of layout morphs"
	extent := self fullBounds extent +
			(window borderWidth@window labelHeight) + window borderWidth +
			(window class borderWidth * 2 @ (window class borderWidth + 1)). "include inset margin"
	window extent: extent.
	^ window