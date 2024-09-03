Class {
	#name : 'DsDMTFTones',
	#superclass : 'Object',
	#category : 'Phausto-DesigningSounds',
	#package : 'Phausto-DesigningSounds'
}

{ #category : 'as yet unclassified' }
DsDMTFTones class >> displayUIFromDsp: aDsp [
"generates a UI for a DSP (if it exists) generated from an instance of the class"
| container btn1 btn2 btn3 btn4 btn5 btn6 btn7 btn8 btn9 buttons|

buttons := (1 to: 9) collect: [ :i | ICLabelButton label: i asString  ].
btn1 := ICLabelButton label: '1'.

container := BlElement new
		             geometry: BlRectangleGeometry new;
		             layout: (BlGridLayout new
				              columnCount: 3;
				              cellSpacing: 0);
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical matchParent ];
		             background: Color darkGray.
container addChildren: buttons.
container openInSpace
]
