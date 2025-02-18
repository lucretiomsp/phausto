"
##DX7 Operator. 
Implements a phase-modulable sine wave oscillator connected to a DX7 envelope generator.

##Parameters

**freq**: frequency of the oscillator
**phaseMod**: phase deviation (-1 - 1)
**outLevel**: preset output level (0-99)
**egRate1**: preset envelope rate 1 (0-99)
**egRate2**: preset envelope rate 2 (0-99)
**egRate3**: preset envelope rate 3 (0-99)
**egRate4**: preset envelope rate 4 (0-99)
**egLevel1** preset envelope level 1 (0-99)
**egLevel2**: preset envelope level 2 (0-99)
**egLevel3**: preset envelope level 3 (0-99)
**egLevel4**: preset envelope level 4 (0-99)
**keyVelovity**: preset key velocity sensitivity (0-99)
**rateScale**: preset envelope rate scale
**type**: preset operator type
**gain**: general gain
g**ate**: trigger signal

"
Class {
	#name : 'Dx7Op',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq',
		'gain',
		'egLevel4',
		'rateScale',
		'egRate3',
		'outLevel',
		'egRate1',
		'type',
		'phaseMod',
		'egRate4',
		'gate',
		'egLevel2',
		'egLevel3',
		'egRate2',
		'keyVelocity',
		'egLevel1'
	],
	#category : 'Phausto-Dx7',
	#package : 'Phausto',
	#tag : 'Dx7'
}

{ #category : 'initialization' }
Dx7Op >> asBox [

	| finalBox intermediateBox |
	intermediateBox := super asBox.
	finalBox := self freq  , self phaseMod , self outLevel , self egRate1
	            , self egRate2 , self egRate3 , self egRate4
	            , self egLevel1 , self egLevel2 , self egLevel3
	            , self egLevel4 , self keyVelocity , self rateScale
	            , self type , self gain , self gate connectTo: intermediateBox .
	^ finalBox .
]

{ #category : 'accessing' }
Dx7Op >> egLevel1 [

	^ egLevel1
]

{ #category : 'accessing' }
Dx7Op >> egLevel1: anObject [

	egLevel1 := anObject
]

{ #category : 'accessing' }
Dx7Op >> egLevel2 [

	^ egLevel2
]

{ #category : 'accessing' }
Dx7Op >> egLevel2: anObject [

	egLevel2 := anObject
]

{ #category : 'accessing' }
Dx7Op >> egLevel3 [

	^ egLevel3
]

{ #category : 'accessing' }
Dx7Op >> egLevel3: anObject [

	egLevel3 := anObject
]

{ #category : 'accessing' }
Dx7Op >> egLevel4 [

	^ egLevel4
]

{ #category : 'accessing' }
Dx7Op >> egLevel4: anObject [

	egLevel4 := anObject
]

{ #category : 'accessing' }
Dx7Op >> egRate1 [

	^ egRate1
]

{ #category : 'accessing' }
Dx7Op >> egRate1: anObject [

	egRate1 := anObject
]

{ #category : 'accessing' }
Dx7Op >> egRate2 [

	^ egRate2
]

{ #category : 'accessing' }
Dx7Op >> egRate2: anObject [

	egRate2 := anObject
]

{ #category : 'accessing' }
Dx7Op >> egRate3 [

	^ egRate3
]

{ #category : 'accessing' }
Dx7Op >> egRate3: anObject [

	egRate3 := anObject
]

{ #category : 'accessing' }
Dx7Op >> egRate4 [

	^ egRate4
]

{ #category : 'accessing' }
Dx7Op >> egRate4: anObject [

	egRate4 := anObject
]

{ #category : 'accessing' }
Dx7Op >> freq [

	^ freq
]

{ #category : 'accessing' }
Dx7Op >> gain [

	^ gain
]

{ #category : 'accessing' }
Dx7Op >> gate [

	^ gate
]

{ #category : 'initialization' }
Dx7Op >> initialize [

	super initialize.
	processExpression := 'process = dx.dx7_op;'.
	self initializeEgLevels.
	self initializeEgRates.
	type := 0 asBox. "PhNumEntry new
		        label: self label , 'Type'
		        values: #( 0 0 1 0 )."
	freq := PhHSlider new
		        label: self label , 'Freq'
		        values: #( 440 20 900 0.1 ).
	gate := PhButton new label: self label , 'Gate'.
	gain := PhHSlider new
		        label: self label , 'Gain'
		        values: #( 0.5 0 1 0.001 ).
	keyVelocity := PhHSlider new
		               label: self label , 'KeyVel'
		               values: #( 0 0 99 1 ).
	phaseMod := 0 asBox
]

{ #category : 'initialization' }
Dx7Op >> initializeEgLevels [

	outLevel := PhHSlider new
		            label: self label , 'OutLevel'
		            values: #( 90 0 99 1 ).
	egLevel1 := PhHSlider new
		            label: self label , 'L1'
		            values: #(99 0 99 1 ).
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
Dx7Op >> initializeEgRates [

	rateScale := PhHSlider new
		             label: self label , 'RateScale'
		             values: #( 0 0 9 1 ).
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
Dx7Op >> keyVelocity [

	^ keyVelocity
]

{ #category : 'accessing' }
Dx7Op >> keyVelocity: anObject [

	keyVelocity := anObject
]

{ #category : 'accessing' }
Dx7Op >> outLevel [

	^ outLevel
]

{ #category : 'accessing' }
Dx7Op >> outLevel: anObject [

	outLevel := anObject
]

{ #category : 'accessing' }
Dx7Op >> phaseMod [

	^ phaseMod
]

{ #category : 'accessing' }
Dx7Op >> phaseMod: anOscillatorOrANumber [

	phaseMod := anOscillatorOrANumber 
]

{ #category : 'accessing' }
Dx7Op >> rateScale [

	^ rateScale
]

{ #category : 'accessing' }
Dx7Op >> rateScale: anObject [

	rateScale := anObject
]

{ #category : 'accessing' }
Dx7Op >> type [

	^ type
]

{ #category : 'accessing' }
Dx7Op >> type: anObject [

	type := anObject
]
