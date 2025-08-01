"
Ready-to-use simple violin physical model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function. Pitch is changed by changing the length of the string (and not through a finger model)
"
Class {
	#name : 'ViolinModel',
	#superclass : 'StringInstruments',
	#instVars : [
		'stringLength',
		'bowVelocity',
		'bowPressure',
		'bowPosition'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
ViolinModel >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self stringLength asBox , self bowVelocity asBox  , self bowPressure asBox , self  bowPosition asBox
		            connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
ViolinModel >> bowPosition [

	^ bowPosition
]

{ #category : 'accessing' }
ViolinModel >> bowPressure [

	^ bowPressure
]

{ #category : 'accessing' }
ViolinModel >> bowVelocity [

	^ bowVelocity
]

{ #category : 'initialization' }
ViolinModel >> initialize [

	super initialize.

	processExpression := 'process = pm.violinModel;'.
	stringLength := (PhHSlider new
				   label: self label , 'StringLength'
				   init: 1
				   min: 0
				   max: 4
				   step: 0.001) .
	bowVelocity := (PhHSlider new
				   label: self label , 'BowVelocity'
				   init: 0.5
				   min: 0
				   max: 1
				   step: 0.001) .
	bowPressure := (PhHSlider new
				   label: self label , 'BowPressure'
				   init: 0.5
				   min: 0
				   max: 1
				   step: 0.001) ..
    bowPosition := (PhHSlider new
				   label: self label , 'BowPressure'
				   init: 0.5
				   min: 0
				   max: 1
				   step: 0.001) ..
]

{ #category : 'accessing' }
ViolinModel >> stringLength [

	^ stringLength
]
