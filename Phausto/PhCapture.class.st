"
Capture audio input while Capture button is pressed.
Please check your system audio input before Pharo is started.

##Parameters:
**captureButton**: press it to capture audio input;
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

{ #category : 'converting' }
PhCapture >> asBox [

	| intermediateBox |
	intermediateBox := super asBox.
	^ intermediateBox * self uLevel
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
	process = (+ : de.delay(8*65536, D-1)) ~ *(1.0-B);'.
	
	self uLevel: 0
]
