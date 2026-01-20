"
Bidirectional block implementing a simple acoustic guitar nuts. This nuts damps more hight frequencies than elecGuitarNuts and implements a transmittance filter. It also partially sets the resonance duration of the string with the bridge used on the other side.
"
Class {
	#name : 'PhGuitarNuts',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhGuitarNuts >> asBox [ 
^ super asBox 
]

{ #category : 'initialization' }
PhGuitarNuts >> initialize [ 

super initialize .
processExpression := 'process = pm.guitarNuts;'
]
