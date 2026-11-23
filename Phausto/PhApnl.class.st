"
Passive nonlinear allpass based on Pierce switching springs (fi.apnl): switches between allpass coefficients a1 and a2 at the zero crossings of the signal.

**a1, a2:** allpass coefficients, between -1 and 1
"
Class {
	#name : 'PhApnl',
	#superclass : 'PhFilter',
	#instVars : [
		'a1',
		'a2'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
PhApnl >> a1 [

	^ a1
]

{ #category : 'accessing' }
PhApnl >> a1: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhApnl >> a2 [

	^ a2
]

{ #category : 'accessing' }
PhApnl >> a2: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'converting' }
PhApnl >> asBox [

	^ self a1 asBox , self a2 asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhApnl >> initialize [

	super initialize.
	processExpression := 'process = fi.apnl;'.
	a1 := PhHSlider new label: self label , 'A1' values: #( -0.5 -1 1 0.01 ).
	a2 := PhHSlider new label: self label , 'A2' values: #( 0.5 -1 1 0.01 )
]
