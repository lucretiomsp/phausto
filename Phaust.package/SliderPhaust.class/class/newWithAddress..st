instance creation
newWithAddress: anAddress

	" the fader label is also the OSC address"

	^ self new
		  address: anAddress;
		  extent: 200 @ 600;
		  color: Color random;
		  cursorColor: Color black;
		  minValue: 0;
		  maxValue: 1;
		  yourself