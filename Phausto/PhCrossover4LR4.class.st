"
Four-way 4th-order Linkwitz-Riley crossover (fi.crossover4LR4). 1 input, 4 outputs, lowest band first.

**cf1, cf2, cf3:** crossover frequencies (Hz), in ascending order
"
Class {
	#name : 'PhCrossover4LR4',
	#superclass : 'PhCrossover3LR4',
	#instVars : [
		'cf3'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhCrossover4LR4 >> asBox [

	^ self cf1 asBox , self cf2 asBox , self cf3 asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhCrossover4LR4 >> cf3 [

	^ cf3
]

{ #category : 'accessing' }
PhCrossover4LR4 >> cf3: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhCrossover4LR4 >> initialize [

	super initialize.
	processExpression := 'process = fi.crossover4LR4;'.
	cf2 := PhHSlider new label: self label , 'Cf2' values: #( 1000 20 18000 1 ).
	cf3 := PhHSlider new label: self label , 'Cf3' values: #( 5000 20 18000 1 )
]
