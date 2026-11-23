"
Three-way 4th-order Linkwitz-Riley crossover (fi.crossover3LR4). 1 input, 3 outputs (low, mid, high).

**cf1, cf2:** crossover frequencies (Hz), in ascending order
"
Class {
	#name : 'PhCrossover3LR4',
	#superclass : 'PhFilter',
	#instVars : [
		'cf1',
		'cf2'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhCrossover3LR4 >> asBox [

	^ self cf1 asBox , self cf2 asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhCrossover3LR4 >> cf1 [

	^ cf1
]

{ #category : 'accessing' }
PhCrossover3LR4 >> cf1: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhCrossover3LR4 >> cf2 [

	^ cf2
]

{ #category : 'accessing' }
PhCrossover3LR4 >> cf2: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhCrossover3LR4 >> initialize [

	super initialize.
	processExpression := 'process = fi.crossover3LR4;'.
	cf1 := PhHSlider new label: self label , 'Cf1' values: #( 200 20 18000 1 ).
	cf2 := PhHSlider new label: self label , 'Cf2' values: #( 2000 20 18000 1 )
]
