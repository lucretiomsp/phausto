"
I am checkbox/toggle Faust UI primitive
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
