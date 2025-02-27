"
A filtered noise excitation
"
Class {
	#name : 'Strike',
	#superclass : 'Exciter',
	#instVars : [
		'strikePosition',
		'strikeSharpness',
		'gain'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
Strike >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self strikePosition asBox ,
	             self strikeSharpness asBox , self gain asBox
	            , self gate asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
Strike >> gain [

	^ gain
]

{ #category : 'initialization' }
Strike >> initialize [

	super initialize.
	processExpression := 'process = pm.strike;'.
	"initialize controlParameters"

	gain := PhHSlider new
		        label: self label , 'Gain'
		        init: 0.5
		        min: 0
		        max: 1
		        step: 0.001.
	self strikePosition: (PhHSlider new
			 label: self label , 'StrikePos'
			 init: 0
			 min: 0
			 max: 4
			 step: 1).
	strikeSharpness := PhHSlider new
		                   label: self label , 'StrikePos'
		                   init: 0
		                   min: 0
		                   max: 4
		                   step: 1
]

{ #category : 'accessing' }
Strike >> strikePosition [
	^ strikePosition
]

{ #category : 'accessing' }
Strike >> strikeSharpness [

	^ strikeSharpness
]
