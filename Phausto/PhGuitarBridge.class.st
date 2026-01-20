"
Bidirectional block implementing a simple acoustic guitar bridge. This bridge damps more hight frequencies than elecGuitarBridge and implements a transmittance filter. It also partially sets the resonance duration of the string with the nuts used on the other side.
"
Class {
	#name : 'PhGuitarBridge',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhGuitarBridge >> asBox [ 
^ super asBox 
]

{ #category : 'initialization' }
PhGuitarBridge >> initialize [

	super initialize.
	processExpression := 'process = pm.guitarBridge;'
]
