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
**feedback**: preset operator feedback 
**lfoDelay**: preset LFO delay 
**lfoDepth**: preset LFO depth 
**lfoSpeed**: preset LFO speed 
**freq**: fundamental frequency
**gain**: general gain
**gate**: trigger signal
"
Class {
	#name : 'Dx7Algo',
	#superclass : 'UnitGenerator',
	#instVars : [
		'lfoDepth',
		'freq',
		'gain',
		'egLevels4',
		'opRateScales',
		'feedback',
		'egRates3',
		'outLevels',
		'egRates1',
		'opModes',
		'algoNumber',
		'ampModSensitivities',
		'egRates4',
		'lfoSpeed',
		'gate',
		'egLevels2',
		'egLevels3',
		'egRates2',
		'egLevels1',
		'lfoDelay',
		'opDetunes',
		'keyVelocities',
		'opFrequencies'
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

{ #category : 'initialization' }
Dx7Algo >> asBox [

	| interBox finalBox algN egR1 egR2 egR3 egR4 egL1 egL2 egL3 egL4 outLev keyVel ampMod opMode opFreqs opRateScl fb lfoDel lfoDep lfoSp opDetune fr g gt |
	interBox := MoogVcf new asBox .
	
	"all boxes are created before to give time to the inner Faust compiler to create them"
	algN := self algoNumber asBox.
	egR1 := self egRates1 asBox.
	egR2 := self egRates2 asBox.
	egR3 := self egRates3 asBox.
	egR4 := self egRates4 asBox.
	egL1 := self egLevels1 asBox.
	egL2 := self egLevels2 asBox.
	egL3 := self egLevels3 asBox.
	egL4 := self egLevels4 asBox.
	outLev := self outLevels asBox.
	keyVel := self keyVelocities asBox.
	ampMod := self ampModSensitivities asBox .
	opMode := self  opModes asBox.
	opFreqs := self opFrequencies asBox.
	opDetune := self opDetunes asBox .
	opRateScl := self opRateScales asBox .
	fb := self feedback asBox.
	lfoDel := self lfoDelay asBox.
	lfoDep := self lfoDepth asBox .
	lfoSp := self lfoSpeed asBox .
	fr := self freq asBox .
	g := self gain asBox .
	gt := self gate asBox .
	
	finalBox :=  (algN , egR1 , egR2 , egR3 , egR4 , egL1 , egL2 , egL3 , egL4 , outLev , keyVel , opMode , opFreqs , opDetune , opRateScl , fb , lfoDel , lfoDep , lfoSp , fr , g , gt ) connectTo: interBox .
	^ finalBox
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
Dx7Algo >> feedback [

	^ feedback
]

{ #category : 'accessing' }
Dx7Algo >> feedback: aPhListCountingfromZero [

	feedback := aPhListCountingfromZero
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
	freq := PhHSlider new label: self class name , 'Freq' values: #(440 20 932 1).
	"algo number must be an int"
	algoNumber := PhHSlider new
		              label: self class name , 'AlgoNumber'
		              values: #( 0 0 31 1 ).
	self
		initializeEnvelopeGenerators;
		initializeLFOs;
		initializeOps;
		initializeAmpModSensitivities;
		initializeKeyVelocities;
		initializeOutLevels;
		initializeRateScale;
		initializeFeedback
]

{ #category : 'initialization' }
Dx7Algo >> initializeAmpModSensitivities [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'AmpModSens'
			           values: #( 0 0 99 1 ) ].
	self ampModSensitivities: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgLevels1 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Level1'
			           values: #( 0 0 99 1 ) ].
	self egLevels1: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgLevels2 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Level2'
			           values: #( 0 0 99 1 ) ].
	self egLevels2: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgLevels3 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Level3'
			           values: #( 0 0 99 1 ) ].
	self egLevels3: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgLevels4 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Level4'
			           values: #( 0 0 99 1 ) ].
	self egLevels4: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgRates1 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Rate1'
			           values: #( 0 0 99 1 ) ].
	self egRates1: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgRates2 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Rate2'
			           values: #( 0 0 99 1 ) ].
	self egRates2: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgRates3 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Rate3'
			           values: #( 0 0 99 1 ) ].
	self egRates3: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEgRates4 [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Rate4'
			           values: #( 0 0 99 1 ) ].
	self egRates4: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeEnvelopeGenerators [

	self
		initializeEgLevels1;
		initializeEgLevels2;
		initializeEgLevels3;
		initializeEgLevels4.
	self
		initializeEgRates1;
		initializeEgRates2;
		initializeEgRates3;
		initializeEgRates4.
		
	self initializeOutLevels; initializeKeyVelocities ; initializeAmpModSensitivities .
]

{ #category : 'initialization' }
Dx7Algo >> initializeFeedback [

	self feedback: (PhHSlider new
			 label: self class name , 'Feedback'
			 values: #( 0 0 99 1 ))
]

{ #category : 'initialization' }
Dx7Algo >> initializeKeyVelocities [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'KeyVel'
			           values: #( 0 0 99 1 ) ].
	self keyVelocities:
		(PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeLFODelay [

	
		          
	self lfoDelay: ( PhHSlider new
			           label: self class name , 'LFODelay'
			           values: #( 0 0 99 1 ) )
]

{ #category : 'initialization' }
Dx7Algo >> initializeLFODepth [


	self lfoDepth:  (PhHSlider new
			           label: self class name ,  'LFODepth'
			           values: #( 0 0 99 1 ) )
]

{ #category : 'initialization' }
Dx7Algo >> initializeLFOs [

self initializeLfoSpeed ; initializeLFODepth ; initializeLFODelay 
]

{ #category : 'initialization' }
Dx7Algo >> initializeLfoSpeed [

	
	self lfoSpeed: 
		           (PhHSlider new
			           label: self class name , 'LfoSpeed'
			           values: #( 0 0 99 1 ) )
]

{ #category : 'initialization' }
Dx7Algo >> initializeOpDetunes [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Detune'
			           values: #( 0 0 1 0.01 ) ].
	self opDetunes: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeOpFrequencies [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Frequency'
			           values: #( 0 0 99 1 ) ].
	self opFrequencies: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeOpModes [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'Mode'
			           values: #( 0 0 1 0.01 ) ].
	self opModes: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeOps [

	self
		initializeOpFrequencies;
		initializeOpModes;
		initializeFeedback;
		initializeOpDetunes.
]

{ #category : 'initialization' }
Dx7Algo >> initializeOutLevels [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'OutLevel'
			           values: #( 0 0 99 1 ) ].
	self outLevels: (PhList new countingFromZero addAll: sliders)
]

{ #category : 'initialization' }
Dx7Algo >> initializeRateScale [

	| sliders |
	sliders := (1 to: 6) collect: [ :i |
		           PhHSlider new
			           label: self class name , 'Op' , i asString , 'RateScale'
			           values: #( 0 0 99 1 ) ].
	self opRateScales: (PhList new countingFromZero addAll: sliders)
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
Dx7Algo >> lfoDelay [

	^ lfoDelay
]

{ #category : 'accessing' }
Dx7Algo >> lfoDelay: aPhListCountingfromZero [

	lfoDelay := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> lfoDepth [

	^ lfoDepth
]

{ #category : 'accessing' }
Dx7Algo >> lfoDepth: aPhListCountingfromZero [

	lfoDepth := aPhListCountingfromZero
]

{ #category : 'accessing' }
Dx7Algo >> lfoSpeed [

	^ lfoSpeed
]

{ #category : 'accessing' }
Dx7Algo >> lfoSpeed: aPhListCountingfromZero [

	lfoSpeed := aPhListCountingfromZero
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
Dx7Algo >> opFrequencies [

	 ^ opFrequencies 
]

{ #category : 'accessing' }
Dx7Algo >> opFrequencies: aPhListCountingfromZero [

	opFrequencies := aPhListCountingfromZero
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
