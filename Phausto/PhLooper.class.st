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
import("stdfaust.lib");
tableSize = 196000;
recIndex = (+(1) : %(tableSize)) ~ *(record);
readIndex = readSpeed/float(ma.SR) : (+ : ma.frac) ~ _ : *(float(tableSize)) : int;
readSpeed = hslider("Read Speed",1,0.001,10,0.01);
record = button("Record") : int;
looper = rwtable(tableSize,0.0,recIndex,_,readIndex);
process = looper;'
]

{ #category : 'accessing' }
PhLooper >> processExpression [

	^ '
import("stdfaust.lib");
tableSize = 44100;
recIndex = (+(1) : %(tableSize)) ~ *(record);
readIndex = readSpeed/float(ma.SR) : (+ : ma.frac) ~ _ : *(float(tableSize)) : int;
readSpeed = hslider("Read Speed",1,0.001,10,0.01);
record = 1;
looper = rwtable(tableSize,0.0,recIndex,_,readIndex);
process = looper;

'
]
