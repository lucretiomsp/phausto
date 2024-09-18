"
Faust user interface widgets/primitives allow for an abstract description of a user interface from within the Faust code. This description is independent from any GUI toolkits/frameworks and is purely abstract. Widgets can be discrete (e.g., button, checkbox, etc.), continuous (e.g., hslider, vslider, nentry), and organizational (e.g., vgroup, hgroup).

Discrete and continuous elements are signal generators. For example, a button produces a signal which is 1 when the button is pressed and 0 otherwise:
"
Class {
	#name : 'UIPrimitive',
	#superclass : 'PhBox',
	#instVars : [
		'label',
		'min',
		'max'
	],
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'initialization' }
UIPrimitive >> initialize [ 
super initialize.
	label := 'label'.
	
	min := 0.
	max := 1.
	
]

{ #category : 'accessing' }
UIPrimitive >> label [

	^ label
]

{ #category : 'accessing' }
UIPrimitive >> label: aString [

	label := aString 
]

{ #category : 'accessing' }
UIPrimitive >> max [

	^ max
]

{ #category : 'accessing' }
UIPrimitive >> max: aNumber [

	max := aNumber asBox
]

{ #category : 'accessing' }
UIPrimitive >> min [ 
^ min
]

{ #category : 'accessing' }
UIPrimitive >> min: aNumber [

	min := aNumber asBox
]
