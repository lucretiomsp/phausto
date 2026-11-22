"
A simple generic flute instrument physical model without tone holes (pitch is changed by changing the length of the tube of the instrument).

Where:

tubeLength: the length of the tube in meters
mouthPosition: position of the mouth on the embouchure (0-1) (default: 0.5)
pressure: the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).
"
Class {
	#name : 'FluteModel',
	#superclass : 'WindInstruments',
	#instVars : [
		'tubeLength',
		'mouthPosition',
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
FluteModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#tubeLength -> 'the length of the tube in meters'.
			#mouthPosition -> 'position of the mouth on the embouchure (0-1) (default: 0.5)'.
			#pressure -> 'the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).' }
]

{ #category : 'faust' }
FluteModel class >> argumentNames [

	^ #( #tubeLength #mouthPosition #pressure )
]

{ #category : 'faust' }
FluteModel class >> faustName [

	^ 'fluteModel'
]

{ #category : 'initialization' }
FluteModel >> initializeArguments [

	tubeLength := PhHSlider new
			label: self label , 'TubeLength'
			values: #( 0.5 0.01 2 0.01 ).
	mouthPosition := PhHSlider new
			label: self label , 'MouthPosition'
			values: #( 0.5 0 1 0.01 ).
	pressure := PhHSlider new
			label: self label , 'Pressure'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
FluteModel >> mouthPosition [

	^ mouthPosition
]

{ #category : 'accessing' }
FluteModel >> mouthPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
FluteModel >> pressure [

	^ pressure
]

{ #category : 'accessing' }
FluteModel >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
FluteModel >> tubeLength [

	^ tubeLength
]

{ #category : 'accessing' }
FluteModel >> tubeLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
