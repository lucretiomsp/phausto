"
Highpass SVF
"
Class {
	#name : 'PhSvfHp',
	#superclass : 'PhStateVariableFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfHp >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.hp;'
]
