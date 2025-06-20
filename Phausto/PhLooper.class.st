"
A simple looper with speed playback control
"
Class {
	#name : 'PhLooper',
	#superclass : 'UnitGenerator',
	#instVars : [
		'recordButton'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhLooper >> asBox [

	| intermediateBox |
	intermediateBox := super asBox.
	^ intermediateBox
]

{ #category : 'initialization' }
PhLooper >> initialize [

	super initialize.

	processExpression := '
tableSize = 48000;
recIndex = (+(1) : %(tableSize)) ~ *(record);
readIndex = readSpeed/float(ma.SR) : (+ : ma.frac) ~ _ : *(float(tableSize)) : int;
readSpeed = hslider("LoopSpeed",1,0.001,10,0.01);
record = button("RecordLoop") : int;
looper = rwtable(tableSize,0.0,recIndex,_,readIndex);
process =  looper ;'
]
