"
An ""ideal"" string with rigid terminations and where the plucking position and the pick-up position are the same. Since terminations are rigid, this string will ring forever.
"
Class {
	#name : 'PhIdealString',
	#superclass : 'PhStringAbstract',
	#instVars : [
		'length',
		'pluckPosition',
		'excitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhIdealString class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#pluckPosition -> 'the plucking position (0.001-0.999)'.
			#excitation -> 'the input signal for the excitation.' }
]

{ #category : 'faust' }
PhIdealString class >> argumentNames [

	^ #( #length #pluckPosition #excitation )
]

{ #category : 'faust' }
PhIdealString class >> faustName [

	^ 'idealString'
]

{ #category : 'accessing' }
PhIdealString >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhIdealString >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhIdealString >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhIdealString >> length [

	^ length
]

{ #category : 'accessing' }
PhIdealString >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhIdealString >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhIdealString >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
