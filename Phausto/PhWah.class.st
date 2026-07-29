"
Wah effect, 4th order

Parameter: fr: resonance frequency in Hz

more info : 
https://ccrma.stanford.edu/~jos/pasp/vegf.html
"
Class {
	#name : 'PhWah',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'level',
		'fr'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhWah >> asBox [

	^ fr asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhWah >> fr [

	^ fr
]

{ #category : 'accessing' }
PhWah >> fr: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhWah >> initialize [

	super initialize.
	processExpression := 'process = ve.wah4;'.
	fr := PhHSlider new
				        label: self class name , 'Fr'
				        init: 400
				        min: 20
				        max: 9000
				        step: 1
]
