"
Capture audio input while Capture button is pressed.
Record up to 8s of sound and.
Playback the recorded sound in loop
Please check your system audio input before Pharo is started.

##Parameters:
**captureButton**: press it to capture audio input;

### Usage
```language=Pharo
myCapture :=(PhCapture   withLabel: 'Test').
dsp := myCapture stereo asDsp.
```
"
Class {
	#name : 'PhCapture',
	#superclass : 'UnitGenerator',
	#instVars : [
		'captureButton'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'initialization' }
PhCapture class >> withLabel: aLabel [

	| expr bVar rVar iVar dVar |
	bVar := 'B' , aLabel.
rVar := 'R' , aLabel.
iVar := 'I' , aLabel.
dVar := 'D' , aLabel.
	expr := 
        bVar, ' = button("' , aLabel , ' Capture");' ,	
        iVar , ' = int(' , bVar , ');' ,				
        rVar , '= (' , iVar,  '-' , iVar , ''') <= 0;' ,		
        dVar , '= (+(' , iVar , '):*(' , rVar , '))~_;	

        capture = *(' , bVar ,  ') : (+ : de.delay(8*65536, ' , dVar , '-1)) ~ *(1.0-' , bVar , ');
        level = hslider("' , aLabel , ' Level", 0, -96, 4, 0.1) : ba.db2linear : si.smoo;
        process = capture : *(level);'.
	^ self new processExpression: expr
]

{ #category : 'converting' }
PhCapture >> asBox [

	| intermediateBox |
	intermediateBox := super asBox.
	^ intermediateBox 
]

{ #category : 'initialization' }
PhCapture >> initialize [

	super initialize.
   
	processExpression := '
B = button("Capture");	
I = int(B);				
R = (I-I'') <= 0;		
D = (+(I):*(R))~_;	


capture = *(B) : (+ : de.delay(8*65536, D-1)) ~ *(1.0-B);

level = hslider("level", 0, -96, 4, 0.1) : ba.db2linear : si.smoo;

process =  capture : *(level);'.

	self uLevel: 0
]
