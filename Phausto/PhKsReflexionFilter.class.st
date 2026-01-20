"
The ""typical"" one-zero Karplus-strong feedforward reflexion filter. This filter will be typically used in a termination
"
Class {
	#name : 'PhKsReflexionFilter',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhKsReflexionFilter >> asBox [ 

^ super asBox
]

{ #category : 'initialization' }
PhKsReflexionFilter >> initialize [ 

super initialize .
processExpression := 'process = pm.ksReflexionFilter;'
]
