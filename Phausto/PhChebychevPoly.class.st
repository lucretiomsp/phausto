Class {
	#name : 'PhChebychevPoly',
	#superclass : 'UnitGenerator',
	#instVars : [
		'order',
		'input'
	],
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhChebychevPoly >> initialize [

	Error new signal: 'This class cannot be created in this compilation mode. Check Faust reference manual'.
]
