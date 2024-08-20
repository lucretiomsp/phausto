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

	^ amount
]

{ #category : 'accessing' }
LowFrequencyOscillators >> amount: aNumberOrABox [

	aNumberOrABox isNumber
		ifTrue: [ amount :=PhHSlider new
		          label: self label , 'Amount'
		          init: aNumberOrABox 
		          min: 0
		          max: 28000
		          step: 1.  ]
		ifFalse: [ amount := aNumberOrABox ]
]

{ #category : 'converting' }
LowFrequencyOscillators >> asBox [

	| intermediateBox finalBox |
	self initializeUIParamters .
	intermediateBox := super asBox.
	finalBox := freq asBox connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox
]

{ #category : 'initialization' }
LowFrequencyOscillators >> initialize [

	super initialize.
	"self uLevel: 1."
	amount := PhHSlider new
		          label: self label , 'Amount'
		          init: 1
		          min: 0
		          max: 28000
		          step: 1.
	offset := PhHSlider new
		          label: self label , 'Offset'
		          init: 0
		          min: 0
		          max: 800
		          step: 0.01.
	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 2
		        min: 0.01
		        max: 20
		        step: 0.001

	"as LFO are used for modulation, there default level is set to 1"
]

{ #category : 'initialization' }
LowFrequencyOscillators >> initializeUIParamters [

	super initializeUIParameters.

	amount ifNil: [amount := PhHSlider new
		          label: self label , 'Amount'
		          init: 1
		          min: 0
		          max: 28000
		          step: 1].
	offset ifNil: [offset := PhHSlider new
		          label: self label , 'Offset'
		          init: 0
		          min: 0
		          max: 800
		          step: 0.01].
	freq ifNil: [freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 2
		        min: 0.01
		        max: 20
		        step: 0.001]

	"as LFO are used for modulation, there default level is set to 1"
]

{ #category : 'accessing' }
LowFrequencyOscillators >> offset [

	^ offset
]

{ #category : 'accessing' }
LowFrequencyOscillators >> offset: aNumberOrABox [

	aNumberOrABox isNumber
		ifTrue: [ self offset init: aNumberOrABox ]
		ifFalse: [ offset  := aNumberOrABox ]
]
