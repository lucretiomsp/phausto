"
High and low level objects for modal synthesis of percussion instruments.

"
Class {
	#name : 'ModalPercussion',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq',
		'strikePosition',
		'strikeSharpness',
		'gain',
		'trigger',
		'strikeCutoff'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'accessing' }
ModalPercussion >> freq [

	^ freq ifNil: [
		  freq := PhHSlider new
			          label: self label , 'Freq'
			          init: 440
			          min: 20
			          max: 1200
			          step: 1 ]
]

{ #category : 'accessing' }
ModalPercussion >> freq: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
ModalPercussion >> gain [

	^ gain ifNil: [
		  gain := PhHSlider new
			          label: self label , 'Gain'
			          init: 0.5
			          min: 0
			          max: 1
			          step: 0.001 ]
]

{ #category : 'initialization' }
ModalPercussion >> initialize [ 
super initialize .

]

{ #category : 'accessing' }
ModalPercussion >> strikeCutoff [

	^ strikeCutoff ifNil: [
		  self strikeCutoff: (PhHSlider new
				   label: self label , 'StrikeCutoff'
				   init: 7000
				   min: 100
				   max: 9000
				   step: 1) ]
]

{ #category : 'accessing' }
ModalPercussion >> strikeCutoff: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
ModalPercussion >> strikePosition [

	^ strikePosition ifNil: [
		  self strikePosition: (PhHSlider new
				   label: self label , 'StrikePos'
				   init: 0
				   min: 0
				   max: 4
				   step: 1) ]
]

{ #category : 'accessing' }
ModalPercussion >> strikeSharpness [

	^ strikeSharpness ifNil: [
		  self strikeSharpness: (PhHSlider new
				   label: self label , 'StrikeSharp'
				   init: 0.3
				   min: 0.001
				   max: 1
				   step: 0.001) ]
]

{ #category : 'accessing' }
ModalPercussion >> trigger [

	^ trigger ifNil: [
		  trigger := PhButton new label: self label , 'Trigger' ]
]
