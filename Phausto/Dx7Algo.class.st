"
# DX7 algorithms. 
## Implements the 32 DX7 algorithms. 
[More about operators and algorythms here](https://djjondent.blogspot.com/2019/10/yamaha-dx7-algorithms.html).
Very good information about the DX7 Synthesiszer on profrssor [Dave Benson website](https://yamahablackboxes.com/collection/yamaha-dx7-synthesizer/).
Each algorithm uses 6 operators.
Here the parameters:
Where:

**algoNumber**: algorithm number (0-31, should be an int...)
**egRates1**: preset envelope rates 1 (a list of 6 values between 0-99)
**egRates2**: preset envelope rates 2 (a list of 6 values between 0-99)
**egRates3**: preset envelope rates 3 (a list of 6 values between 0-99)
**egRates4**: preset envelope rates 4 (a list of 6 values between 0-99)
**egLevels1**: preset envelope levels 1 (a list of 6 values between 0-99)
**egLevels2**: preset envelope levels 2 (a list of 6 values between 0-99)
**egLevels3**: preset envelope levels 3 (a list of 6 values between 0-99)
**egLevels4**: preset envelope levels 4 (a list of 6 values between 0-99)
**outLevels**: preset output levels (a list of 6 values between 0-99)
**keyVelocities**: preset key velocity sensitivities (a list of 6 values between 0-99)
**ampModSensitivities**: preset amplitude sensitivities (a list of 6 values between 0-99)
**opModes**: preset operator mode (a list of 6 values between 0-1)
**opFrequencies**: preset operator frequencies (a list of 6 values between 0-99)
**opDetunes**: preset operator detuning (a list of 6 values between 0-99)
**opRateScale**: preset operator rate scale (a list of 6 values between 0-99)
**feedbacks**: preset operator feedback (a list of 6 values between 0-99)
**lfoDelays**: preset LFO delay (a list of 6 values between 0-99)
**lfoDepths**: preset LFO depth (a list of 6 values between 0-99)
**lfoSpeeds**: preset LFO speed (a list of 6 values between 0-99)
**freq**: fundamental frequency
**gain**: general gain
**gate**: trigger signal
"
Class {
	#name : 'Dx7Algo',
	#superclass : 'UnitGenerator',
	#instVars : [
		'lfoDepths',
		'freq',
		'gain',
		'egLevels4',
		'opRateScales',
		'feedbacks',
		'egRates3',
		'outLevels',
		'egRates1',
		'opModes',
		'algoNumber',
		'ampModSensitivities',
		'egRates4',
		'lfoSpeeds',
		'gate',
		'egLevels2',
		'egLevels3',
		'egRates2',
		'egLevels1',
		'lfoDelays',
		'opDetunes',
		'keyVelocities'
	],
	#category : 'Phausto-Dx7',
	#package : 'Phausto',
	#tag : 'Dx7'
}

{ #category : 'accessing' }
Dx7Algo >> algoNumber [

	^ algoNumber
]

{ #category : 'accessing' }
Dx7Algo >> algoNumber: aPhListCountingfromZero [

	algoNumber := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> ampModSensitivities [

	^ ampModSensitivities
]

{ #category : 'accessing' }
Dx7Algo >> ampModSensitivities: aPhListCountingfromZero [

	ampModSensitivities := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> egLevels1 [

	^ egLevels1
]

{ #category : 'accessing' }
Dx7Algo >> egLevels1: aPhListCountingfromZero [

	egLevels1 := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> egLevels2 [

	^ egLevels2
]

{ #category : 'accessing' }
Dx7Algo >> egLevels2: aPhListCountingfromZero [

	egLevels2 := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> egLevels3 [

	^ egLevels3
]

{ #category : 'accessing' }
Dx7Algo >> egLevels3: aPhListCountingfromZero [

	egLevels3 := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> egLevels4 [

	^ egLevels4
]

{ #category : 'accessing' }
Dx7Algo >> egLevels4: aPhListCountingfromZero [

	egLevels4 := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> egRates1 [

	^ egRates1
]

{ #category : 'accessing' }
Dx7Algo >> egRates1: aPhListCountingfromZero [

	egRates1 := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> egRates2 [

	^ egRates2
]

{ #category : 'accessing' }
Dx7Algo >> egRates2: aPhListCountingfromZero [

	egRates2 := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> egRates3 [

	^ egRates3
]

{ #category : 'accessing' }
Dx7Algo >> egRates3: aPhListCountingfromZero [

	egRates3 := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> egRates4 [

	^ egRates4
]

{ #category : 'accessing' }
Dx7Algo >> egRates4: aPhListCountingfromZero [

	egRates4 := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> feedbacks [

	^ feedbacks
]

{ #category : 'accessing' }
Dx7Algo >> feedbacks: aPhListCountingfromZero [

	feedbacks := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> freq [

	^ freq
]

{ #category : 'accessing' }
Dx7Algo >> gain [

	^ gain
]

{ #category : 'accessing' }
Dx7Algo >> gate [

	^ gate
]

{ #category : 'initialization' }
Dx7Algo >> initialize [

	super initialize.
	processExpression := 'process = dx.dx7_algo;'.
	gate := PhButton new label: self class name , 'Gate'.
	gain := (self class name , 'Gain') asSymbol asPhHSlider.
	freq := PhHSlider new label: self class name , 'Freq'.
	"algo number must be an int"
	algoNumber := PhHSlider new label: self class name , 'AlgoNumber' values: #(0 0 31 1)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgLevels1 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |  PhHSlider new label: self class name , 'Op' , i asString , 'Levels1' values: #(0 0 99 1)].
	self egLevels1: sliders. 
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgLevels2 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |  PhHSlider new label: self class name , 'Op' , i asString , 'Levels2' values: #(0 0 99 1)].
	self egLevels2: sliders. 
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgLevels3 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |  PhHSlider new label: self class name , 'Op' , i asString , 'Levels3' values: #(0 0 99 1)].
	self egLevels3: sliders. 
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgLevels4 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |  PhHSlider new label: self class name , 'Op' , i asString , 'Levels4' values: #(0 0 99 1)].
	self egLevels4: sliders. 
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgRates1 [

	| sliders |
	sliders := (1 to: 16) collect: [ :i |  PhHSlider new label: self class name , 'Op' , i asString , 'Rates1' values: #(0 0 99 1)].
	self egRates1: sliders. 
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgRates2 [

	| sliders |
	sliders := (1 to: 16) collect: [ :i |  PhHSlider new label: self class name , 'Op' , i asString , 'Rates2' values: #(0 0 99 1)].
	self egRates2: sliders. 
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgRates3 [

	| sliders |
	sliders := (1 to: 16) collect: [ :i |  PhHSlider new label: self class name , 'Op' , i asString , 'Rates3' values: #(0 0 99 1)].
	self egRates3: sliders. 
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgRates4 [

	| sliders |
	sliders := (1 to: 16) collect: [ :i |  PhHSlider new label: self class name , 'Op' , i asString , 'Rates4' values: #(0 0 99 1)].
	self egRates4: sliders. 
]

{ #category : 'initialization' }
Dx7Algo >> initializeEnvelopeGenerators [

self initializeEgLevels1; initializeEgLevels2 ; initializeEgLevels3 ; initializeEgLevels4.
self initializeEgRates1 ; initializeEgRates2 ; initializeEgRates3 ; initializeEgRates4 . 
]

{ #category : 'accessing' }
Dx7Algo >> keyVelocities [

	^ keyVelocities
]

{ #category : 'accessing' }
Dx7Algo >> keyVelocities: aPhListCountingfromZero [

	keyVelocities := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> lfoDelays [

	^ lfoDelays
]

{ #category : 'accessing' }
Dx7Algo >> lfoDelays: aPhListCountingfromZero [

	lfoDelays := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> lfoDepths [

	^ lfoDepths
]

{ #category : 'accessing' }
Dx7Algo >> lfoDepths: aPhListCountingfromZero [

	lfoDepths := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> lfoSpeeds [

	^ lfoSpeeds
]

{ #category : 'accessing' }
Dx7Algo >> lfoSpeeds: aPhListCountingfromZero [

	lfoSpeeds := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> opDetunes [

	^ opDetunes
]

{ #category : 'accessing' }
Dx7Algo >> opDetunes: aPhListCountingfromZero [

	opDetunes := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> opModes [

	^ opModes
]

{ #category : 'accessing' }
Dx7Algo >> opModes: aPhListCountingfromZero [

	opModes := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> opRateScales [

	^ opRateScales
]

{ #category : 'accessing' }
Dx7Algo >> opRateScales: aPhListCountingfromZero [

	opRateScales := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> outLevels [

	^ outLevels
]

{ #category : 'accessing' }
Dx7Algo >> outLevels: aPhListCountingfromZero [

	outLevels := aPhListCountingfromZero
]
