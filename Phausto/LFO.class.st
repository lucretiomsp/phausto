"
LowFrequencyOscillators with range -1,1. No Aliasing suppression. They can also have freq > 20
"
Class {
	#name : 'LFO',
	#superclass : 'Oscillators',
	#instVars : [
		'amount',
		'offset'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
LFO >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq connectTo: intermediateBox.
	^ finalBox 
]

{ #category : 'accessing' }
LFO >> freq [

	^ freq ifNil: [
		  PhHSlider new
			  label: self label , 'Freq'
			  init: 2
			  min: 0.01
			  max: 20
			  step: 0.01 ]
]

{ #category : 'initialization' }
LFO >> initialize [

	super initialize.
	"as LFO are used for modulation, there default level is set to 1"
	self uLevel: 1.
	


	
]
