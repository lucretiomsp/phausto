"
I am checkbox/toggle Faust UI primitive - I encode an information about my type separated with a tilde ~ from the label. this is a Phausto turnaround to the fact that both the button and the checkbox have the same type in Faust UI description
"
Class {
	#name : 'PhCheckbox',
	#superclass : 'UIPrimitive',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhCheckbox >> asBox [

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance boxCheckbox: self label
]

{ #category : 'initialization' }
PhCheckbox >> initialize [

	super initialize.
	widgetType := #checkbox
]

{ #category : 'accessing' }
PhCheckbox >> label: aString [

	label := aString , '~checkbox'
]
