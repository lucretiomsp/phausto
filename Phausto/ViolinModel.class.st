"
Ready-to-use simple violin physical model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function. Pitch is changed by changing the length of the string (and not through a finger model)
"
Class {
	#name : 'ViolinModel',
	#superclass : 'StringInstruments',
	#instVars : [
		'stringLength',
		'bowPressure',
		'bowVelocity',
		'bowPosition'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
ViolinModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#stringLength -> 'the length of the string in meters'.
			#bowPressure -> 'bow pressure on the string (0-1))'.
			#bowVelocity -> 'velocity of the bow / excitation signal (0-1)'.
			#bowPosition -> 'the position of the bow on the string (0-1)' }
]

{ #category : 'faust' }
ViolinModel class >> argumentNames [

	^ #( #stringLength #bowPressure #bowVelocity #bowPosition )
]

{ #category : 'faust' }
ViolinModel class >> faustName [

	^ 'violinModel'
]

{ #category : 'accessing' }
ViolinModel >> bowPosition [

	^ bowPosition
]

{ #category : 'accessing' }
ViolinModel >> bowPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
ViolinModel >> bowPressure [

	^ bowPressure
]

{ #category : 'accessing' }
ViolinModel >> bowPressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
ViolinModel >> bowVelocity [

	^ bowVelocity
]

{ #category : 'accessing' }
ViolinModel >> bowVelocity: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
ViolinModel >> initializeArguments [

	stringLength := PhHSlider new
			label: self label , 'StringLength'
			values: #( 0.75 0.1 2 0.001 ).
	bowPressure := PhHSlider new
			label: self label , 'BowPressure'
			values: #( 0.5 0 1 0.01 ).
	bowVelocity := PhHSlider new
			label: self label , 'BowVelocity'
			values: #( 0.5 0 1 0.01 ).
	bowPosition := PhHSlider new
			label: self label , 'BowPosition'
			values: #( 0.7 0.01 0.99 0.001 )
]

{ #category : 'accessing' }
ViolinModel >> stringLength [

	^ stringLength
]

{ #category : 'accessing' }
ViolinModel >> stringLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
