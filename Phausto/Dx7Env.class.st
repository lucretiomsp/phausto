"
DX7 operator envelope generator with 4 independent rates and levels. It is essentially a 4 points BPF.
"
Class {
	#name : 'Dx7Env',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trigger',
		'egRate1',
		'egRate2',
		'egRate3',
		'egRate4',
		'egLevel1',
		'egLevel2',
		'egLevel3',
		'egLevel4'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'converting' }
Dx7Env >> asBox [

	| finalBox intermediateBox |
	intermediateBox := super asBox.
	finalBox := self egRate1 asBox 
	             , self egRate2 asBox, self egRate3 asBox , self egRate4 asBox 
	             , self egLevel1 asBox, self egLevel2 , self egLevel3
	             , self egLevel4 asBox ,  self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
Dx7Env >> egLevel1 [

	^ egLevel1
]

{ #category : 'accessing' }
Dx7Env >> egLevel2 [

	^ egLevel2
]

{ #category : 'accessing' }
Dx7Env >> egLevel3 [

	^ egLevel3
]

{ #category : 'accessing' }
Dx7Env >> egLevel4 [

	^ egLevel4
]

{ #category : 'accessing' }
Dx7Env >> egRate1 [ 

^ egRate1
]

{ #category : 'accessing' }
Dx7Env >> egRate2 [

	^ egRate2
]

{ #category : 'accessing' }
Dx7Env >> egRate3 [

	^ egRate3
]

{ #category : 'accessing' }
Dx7Env >> egRate4 [

	^ egRate4
]

{ #category : 'initialization' }
Dx7Env >> initialize [

	super initialize.
	processExpression := 'process = en.dx7envelope;'.
	trigger := PhButton new label: self label , 'Trig'.
	self initializeEgLevels .
	self initializeEgRates 
]

{ #category : 'initialization' }
Dx7Env >> initializeEgLevels [


	egLevel1 := PhHSlider new
		            label: self label , 'L1'
		            values: #( 99 0 99 1 ).
	egLevel2 := PhHSlider new
		            label: self label , 'L2'
		            values: #( 88 0 99 1 ).
	egLevel3 := PhHSlider new
		            label: self label , 'L3'
		            values: #( 96 0 99 1 ).
	egLevel4 := PhHSlider new
		            label: self label , 'L4'
		            values: #( 0 0 99 1 )
]

{ #category : 'initialization' }
Dx7Env >> initializeEgRates [

	
	egRate1 := PhHSlider new
		           label: self label , 'R1'
		           values: #( 72 0 99 1 ).
	egRate2 := PhHSlider new
		           label: self label , 'R2'
		           values: #( 75 0 99 1 ).
	egRate3 := PhHSlider new
		           label: self label , 'R3'
		           values: #( 49 0 99 1 ).
	egRate4 := PhHSlider new
		           label: self label , 'R4'
		           values: #( 71 0 99 1 )
]

{ #category : 'accessing' }
Dx7Env >> trigger [ 

^ trigger
]
