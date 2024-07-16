"
I represent a Faust button, you need me to display a button in your UI
"
Class {
	#name : #PhButton,
	#superclass : #UIPrimitive,
	#instVars : [
		'init',
		'step'
	],
	#category : #'Phausto-BoxAPI-UIPrimitives'
}

{ #category : #converting }
PhButton >> asBox [

	
	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance boxButton: self label

]
