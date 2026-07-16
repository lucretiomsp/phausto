"
Helper class that define the implementation for the Param Setters
"
Class {
	#name : 'PhPsImpl',
	#superclass : 'Object',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'helper' }
PhPsImpl class >> paramSetter [

	| paramName |
	paramName := thisContext sender method selector allButLast.
	^ [ :value | value asParam: paramName forUGen: self ]
]
