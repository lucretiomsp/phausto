"
A Faust Button, value is 1 when clicked, otherwise value is 0
"
Class {
	#name : #PhButton,
	#superclass : #UIGenerators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
PhButton >> asBox [

	| box |
	box := BoxAPI uniqueInstance boxButton: self label.
   
	^ box
]
