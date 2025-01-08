"
LFOForModulations are oscillators with no aliasing suppression intended to be used for modulating parameters, with positive range
These LFOs have 3 instance variables:
freq: set the frequency of the Oscillator
amount: set the multiplier for the Oscillator output 
offset: an offset for the LFO output. 

*** If you want to use 'standard' LFOs with range -1 , 1 please use subclasses of LFO
"
Class {
	#name : 'LFOForModulation',
	#superclass : 'Oscillators',
	#instVars : [
		'amount',
		'offset'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'as yet unclassified' }
LFOForModulation >> amount [

	^ amount ifNil: [
		  amount := PhHSlider new
			            label: self label , 'Amount'
			            init: 400
			            min: 0
			            max: 8000
			            step: 1 ]
]

{ #category : 'converting' }
LFOForModulation >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq  connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox
]

{ #category : 'accessing' }
LFOForModulation >> freq [

	^ freq ifNil: [
		  PhHSlider new
			  label: self label , 'Freq'
			  init: 2
			  min: 0.01
			  max: 20
			  step: 0.01 ]
]

{ #category : 'initialization' }
LFOForModulation >> initialize [

	super initialize.
	"as LFO are used for modulation, there default level is set to 1"
	self uLevel: 1.
	


	
]

{ #category : 'as yet unclassified' }
LFOForModulation >> offset [

	^ offset ifNil: [  	offset := PhHSlider new
		          label: self label , 'Offset'
		          init: 0
		          min: 0
		          max: 800
		          step: 0.01. ]
]
