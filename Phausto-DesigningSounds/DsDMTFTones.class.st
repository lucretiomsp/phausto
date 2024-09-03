"
The sound a telephone dialler that use 'Dual Tone Multi Frequency' modulation.
On each key press the dialler sends a 200 ms beep corresponding to the CCITT standards
"
Class {
	#name : 'DsDMTFTones',
	#superclass : 'Object',
	#category : 'Phausto-DesigningSounds',
	#package : 'Phausto-DesigningSounds'
}

{ #category : 'accessing' }
DsDMTFTones class >> buttonsLabel [

^ #('1' '2' '3' '4' '5' '6' '7' '8' '9' '*' '0' '#')
]

{ #category : 'ui building' }
DsDMTFTones class >> displayUIFromDsp: aDsp [
"generates a UI for a DSP (if it exists) generated from an instance of the class"
| container btn1  buttons|

buttons := (1 to: 12) collect: 
            [ :i | (ICLabelButton label: (self buttonsLabel at: i))
	         callback: [ :k | 
		      aDsp setValue: ((self tones at: (self buttonsLabel at: i)) at: 1) parameter: 'Tone1Freq'.
		      aDsp setValue: ((self tones at: (self buttonsLabel at: i)) at: 2) parameter: 'Tone2Freq'.
		      aDsp setValue: k parameter: 'TKey']
	         ].
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

{ #category : 'accessing' }
DsDMTFTones class >> tones [

| tones  |

tones := Dictionary new.
tones at: '1' put: #(1209 697).
tones at: '2' put: #(1336 697).
tones at: '3' put: #(1477 697).
tones at: '4' put: #(1209 770).
tones at: '5' put: #(1336 770).
tones at: '6' put: #(1477 770).
tones at: '7' put: #(1209 852).
tones at: '8' put: #(1336 852).
tones at: '9' put: #(1477 852).
tones at: '*' put: #(1209 941).
tones at: '0' put: #(1336 941).
tones at: '#' put: #(1477 941).
^ tones 
]

{ #category : 'accessing' }
DsDMTFTones >> initialize [ 


| tone1 tone2 btn adsr|
tone1 := SineOsc new label: 'Tone1'.
tone2 := SineOsc new label: 'Tone2'.
adsr := ADSREnv new label: 'KADSR'; decay: 0.2 ; sustain: 0; release: 0; trigger: (PhButton new label: 'TKey').

^ (tone1 + tone2) * adsr
]
