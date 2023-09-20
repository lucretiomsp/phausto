instance creation
newWithIndex: anIndex forDSP: aDSP

	" the fader label is also the OSC address"

	^ self new
		  address: ((aDSP getParamAddress: anIndex) allButFirst: 5);
		  "cut the first part of the address to get just the parameter name"
		  index: anIndex;
		  extent: 200 @ 600;
		  color: Color random;
		  cursorColor: Color black;
		  minValue: (aDSP getParamMin: anIndex );
		  maxValue: (aDSP getParamMax: anIndex );
		  dsp: aDSP;
		  yourself