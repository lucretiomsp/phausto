"
Eight-way 4th-order Linkwitz-Riley crossover (fi.crossover8LR4). 1 input, 8 outputs, lowest band first.

**cf1 ... cf7:** crossover frequencies (Hz), in ascending order
"
Class {
	#name : 'PhCrossover8LR4',
	#superclass : 'PhCrossover4LR4',
	#instVars : [
		'cf4',
		'cf5',
		'cf6',
		'cf7'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhCrossover8LR4 >> asBox [

	^ self cf1 asBox , self cf2 asBox , self cf3 asBox , self cf4 asBox , self cf5 asBox , self cf6 asBox , self cf7 asBox
	  , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhCrossover8LR4 >> cf4 [

	^ cf4
]

{ #category : 'accessing' }
PhCrossover8LR4 >> cf4: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhCrossover8LR4 >> cf5 [

	^ cf5
]

{ #category : 'accessing' }
PhCrossover8LR4 >> cf5: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhCrossover8LR4 >> cf6 [

	^ cf6
]

{ #category : 'accessing' }
PhCrossover8LR4 >> cf6: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhCrossover8LR4 >> cf7 [

	^ cf7
]

{ #category : 'accessing' }
PhCrossover8LR4 >> cf7: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhCrossover8LR4 >> initialize [

	super initialize.
	processExpression := 'process = fi.crossover8LR4;'.
	cf1 := PhHSlider new label: self label , 'Cf1' values: #( 100 20 18000 1 ).
	cf2 := PhHSlider new label: self label , 'Cf2' values: #( 200 20 18000 1 ).
	cf3 := PhHSlider new label: self label , 'Cf3' values: #( 400 20 18000 1 ).
	cf4 := PhHSlider new label: self label , 'Cf4' values: #( 800 20 18000 1 ).
	cf5 := PhHSlider new label: self label , 'Cf5' values: #( 1600 20 18000 1 ).
	cf6 := PhHSlider new label: self label , 'Cf6' values: #( 3200 20 18000 1 ).
	cf7 := PhHSlider new label: self label , 'Cf7' values: #( 6400 20 18000 1 )
]
