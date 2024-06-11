"
This class contains a collection of synthesizers, including those of Faust synths.lib
"
Class {
	#name : #Synths,
	#superclass : #UnitGenerators,
	#instVars : [
		'name'
	],
	#category : #'Phausto-BoxAPI-Synths'
}

{ #category : #initialization }
Synths >> initialize [

	super initialize.
	"if no other name is specified the name of the synth is the name of the class"
	self name: (self class name withoutSuffix: ' class')
]

{ #category : #accessing }
Synths >> name [

	^ name
]

{ #category : #accessing }
Synths >> name: aName [	

	name := aName
]
