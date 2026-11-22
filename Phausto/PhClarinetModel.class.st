"
A simple clarinet physical model without tone holes (pitch is changed by changing the length of the tube of the instrument).

##Parameters:

**tubeLength:** the length of the tube in meters
**pressure:** the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).
**reedStiffness:** reed stiffness (0-1)
**bellOpening:** the opening of bell (0-1)

"
Class {
	#name : 'PhClarinetModel',
	#superclass : 'WindInstruments',
	#instVars : [
		'tubeLength',
		'pressure',
		'reedStiffness',
		'bellOpening'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhClarinetModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#tubeLength -> 'the length of the tube in meters'.
			#pressure -> 'the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).'.
			#reedStiffness -> 'reed stiffness (0-1)'.
			#bellOpening -> 'the opening of bell (0-1)' }
]

{ #category : 'faust' }
PhClarinetModel class >> argumentNames [

	^ #( #tubeLength #pressure #reedStiffness #bellOpening )
]

{ #category : 'faust' }
PhClarinetModel class >> faustName [

	^ 'clarinetModel'
]

{ #category : 'accessing' }
PhClarinetModel >> bellOpening [

	^ bellOpening
]

{ #category : 'accessing' }
PhClarinetModel >> bellOpening: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhClarinetModel >> initializeArguments [

	tubeLength := PhHSlider new
			label: self label , 'TubeLength'
			values: #( 0.5 0.01 2 0.01 ).
	pressure := PhHSlider new
			label: self label , 'Pressure'
			values: #( 0.5 0 1 0.01 ).
	reedStiffness := PhHSlider new
			label: self label , 'ReedStiffness'
			values: #( 0.5 0 1 0.01 ).
	bellOpening := PhHSlider new
			label: self label , 'BellOpening'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhClarinetModel >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhClarinetModel >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhClarinetModel >> reedStiffness [

	^ reedStiffness
]

{ #category : 'accessing' }
PhClarinetModel >> reedStiffness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhClarinetModel >> tubeLength [

	^ tubeLength
]

{ #category : 'accessing' }
PhClarinetModel >> tubeLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
