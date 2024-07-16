"
I am checkbox/toggle Faust UI primitive
"
Class {
	#name : #PhCheckbox,
	#superclass : #UIPrimitive,
	#category : #'Phausto-BoxAPI-UIPrimitives'
}

{ #category : #converting }
PhCheckbox >> asBox [

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance boxCheckbox: self label
]
