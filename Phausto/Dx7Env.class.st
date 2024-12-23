"
DX7 operator envelope generator with 4 independent rates and levels. It is essentially a 4 points BPF.
Where:

release1, release2, release3, release4 : rates in seconds
level1 , level2, level3 , level4: levels (0-1)
trigger: trigger signal
"
Class {
	#name : 'Dx7Env',
	#superclass : 'PhEnvelope',
	#instVars : [
		'decay',
		'sustain',
		'level1',
		'level2',
		'level3',
		'level4',
		'release4',
		'release3',
		'release2',
		'release1'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
Dx7Env >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self release1 ,  self release2 , self release3 , self release4, self level1 ,self level2 , self level3 , self level4 , self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Dx7Env >> initialize [

	super initialize.
	self decay: 0.2.
	self sustain: 0.5.
	processExpression := 'process = en.adsr;'
]

{ #category : 'as yet unclassified' }
Dx7Env >> level1 [

	^ level1 ifNil: [
		  level1 := PhHSlider new
			           label: self label , 'Level1'
			           init: 0.01
			           min: 0.001
			           max: 1
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
Dx7Env >> level2 [

	^ level2 ifNil: [
		  level2 := PhHSlider new
			           label: self label , 'Level2'
			           init: 0.01
			           min: 0.001
			           max: 1
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
Dx7Env >> level3 [

	^ level3 ifNil: [
		  level3 := PhHSlider new
			           label: self label , 'Level3'
			           init: 0.01
			           min: 0.001
			           max: 1
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
Dx7Env >> level4 [

	^ level4 ifNil: [
		  level4 := PhHSlider new
			           label: self label , 'Level4'
			           init: 0.01
			           min: 0.001
			           max: 1
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
Dx7Env >> release1 [

	^ release1 ifNil: [
		  release1 := PhHSlider new
			           label: self label , 'Release1'
			           init: 0.01
			           min: 0.001
			           max: 2
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
Dx7Env >> release2 [

	^ release2 ifNil: [
		  release2 := PhHSlider new
			           label: self label , 'Release2'
			           init: 0.01
			           min: 0.001
			           max: 2
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
Dx7Env >> release3 [

	^ release3 ifNil: [
		  release3 := PhHSlider new
			           label: self label , 'Release3'
			           init: 0.01
			           min: 0.001
			           max: 2
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
Dx7Env >> release4 [

	^ release4 ifNil: [
		  release4 := PhHSlider new
			           label: self label , 'Release4'
			           init: 0.01
			           min: 0.001
			           max: 2
			           step: 1 ]
]
