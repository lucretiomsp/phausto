"
Super class of all Unit Generators
"
Class {
	#name : #UnitGenerators,
	#superclass : #CTree,
	#instVars : [
		'code'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
UnitGenerators >> asBox [
^ (BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer)
]

{ #category : #accessing }
UnitGenerators >> code [

	^ code
]

{ #category : #accessing }
UnitGenerators >> code: aStringWithFaustCode [

	code := aStringWithFaustCode
]

{ #category : #initialization }
UnitGenerators >> initialize [
super initialize.
	code := 'import(stdfaust.lib);'
]
