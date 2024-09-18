"
I represent a Faust button, you need me to display a button in your UI
"
Class {
	#name : 'PhButton',
	#superclass : 'UIPrimitive',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhButton >> asBox [

	
	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance boxButton: self label

]
