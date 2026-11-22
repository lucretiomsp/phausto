"
Same as fluteModel but with a built-in UI. This function doesn't implement a virtual ""blower"", thus pressure remains an argument here.
"
Class {
	#name : 'PhFluteModelUI',
	#superclass : 'WindInstruments',
	#instVars : [
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhFluteModelUI class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#pressure -> 'the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will be directly injected in the mouthpiece (e.g., breath noise, etc.).' }
]

{ #category : 'faust' }
PhFluteModelUI class >> argumentNames [

	^ #( #pressure )
]

{ #category : 'faust' }
PhFluteModelUI class >> faustName [

	^ 'fluteModel_ui'
]

{ #category : 'initialization' }
PhFluteModelUI >> initializeArguments [

	pressure := PhHSlider new
			label: self label , 'Pressure'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhFluteModelUI >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhFluteModelUI >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
