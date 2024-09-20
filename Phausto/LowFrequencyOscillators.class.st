"
LowFrequencyOScillators are oscillators with no aliasing suppression intended to be used for modulating parameters.
In Phausto all LFOs have 3 instance variables:
freq: set the frequency of the Oscillator
amount: set the multiplier for the Oscillator output 
offset: an offset for the LFO output. 
"
Class {
	#name : 'LowFrequencyOscillators',
	#superclass : 'Oscillators',
	#instVars : [
		'amount',
		'offset'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'accessing' }
LowFrequencyOscillators >> amount [

	^ amount ifNil: [amount := PhHSlider new
		          label: self label , 'Amount'
		          init: 1
		          min: 0
		          max: 28000
		          step: 1.]
]

{ #category : 'accessing' }
LowFrequencyOscillators >> amount: aNumberOrABoxOraAymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraAymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'converting' }
LowFrequencyOscillators >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq  connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox
]

{ #category : 'initialization' }
LowFrequencyOscillators >> initialize [

	super initialize.
	"as LFO are used for modulation, there default level is set to 1"
	self uLevel: 1.
	


	
]

{ #category : 'accessing' }
LowFrequencyOscillators >> offset [

	^ offset ifNil: [  	offset := PhHSlider new
		          label: self label , 'Offset'
		          init: 0
		          min: 0
		          max: 800
		          step: 0.01. ]
]

{ #category : 'accessing' }
LowFrequencyOscillators >> offset: aNumberOrABoxOraAymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraAymbol
		asParam: methodName asString allButLast
		forUGen: self
]
