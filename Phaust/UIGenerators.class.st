"
Faust user interface widgets/primitives allow for an abstract description of a user interface from within the Faust code. This description is independent from any GUI toolkits/frameworks and is purely abstract. Widgets can be discrete (e.g., button, checkbox, etc.), continuous (e.g., hslider, vslider, nentry), and organizational (e.g., vgroup, hgroup).

Discrete and continuous elements are signal generators. For example, a button produces a signal which is 1 when the button is pressed and 0 otherwise:
"
Class {
	#name : #UIGenerators,
	#superclass : #Box,
	#instVars : [
		'label'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #accessing }
UIGenerators >> label [

	^ label
]

{ #category : #accessing }
UIGenerators >> label: aString [

	label := aString
]
