"
A bidirectional block implementing a basic nylon string with selectable excitation position. This element is based on openString and has a fix stiffness corresponding to that of a nylon string.
"
Class {
	#name : 'PhNylonString',
	#superclass : 'PhStringAbstract',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhNylonString >> asBox [

	^ self inputBlock asBox , self length asBox , self pluckPosition , self excitation asBox
		  connectTo: super asBox
]

{ #category : 'initialization' }
PhNylonString >> initialize [ 

super initialize .
processExpression := 'process = pm.nylonString;'
]
