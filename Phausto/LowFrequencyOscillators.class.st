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

	^ amount ifNil: [
		  amount := PhHSlider new
			            label: self label , 'Amount'
			            init: 400
			            min: 0
			            max: 8000
			            step: 1 ]
]

{ #category : 'converting' }
LowFrequencyOscillators >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq  connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox
]

{ #category : 'accessing' }
LowFrequencyOscillators >> freq [

	^ freq ifNil: [
		  PhHSlider new
			  label: self label , 'Freq'
			  init: 2
			  min: 0.01
			  max: 20
			  step: 0.01 ]
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
