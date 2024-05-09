"
Faust user interface widgets/primitives allow for an abstract description of a user interface from within the Faust code. This description is independent from any GUI toolkits/frameworks and is purely abstract. Widgets can be discrete (e.g., button, checkbox, etc.), continuous (e.g., hslider, vslider, nentry), and organizational (e.g., vgroup, hgroup).

Discrete and continuous elements are signal generators. For example, a button produces a signal which is 1 when the button is pressed and 0 otherwise:
"
Class {
	#name : #UIGenerators,
	#superclass : #Box,
	#instVars : [
		'label',
		'min',
		'max'
	],
	#category : #'Phausto-BoxAPI-UIPrimitives'
}

{ #category : #initialization }
UIGenerators >> initialize [ 
super initialize.
	label := 'label'.
	
	min := 0.
	max := 1.
	
]

{ #category : #accessing }
UIGenerators >> label [

	^ label
]

{ #category : #accessing }
UIGenerators >> label: aString [

	label := aString
]

{ #category : #accessing }
UIGenerators >> max [

	^ max
]

{ #category : #accessing }
UIGenerators >> max: aNumber [

	max := aNumber asBox
]

{ #category : #accessing }
UIGenerators >> min [ 
^ min
]

{ #category : #accessing }
UIGenerators >> min: aNumber [

	min := aNumber asBox
]
