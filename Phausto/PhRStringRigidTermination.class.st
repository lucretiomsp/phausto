"
Bidirectional block implementing a right rigid string termination (no damping, just phase inversion).
"
Class {
	#name : 'PhRStringRigidTermination',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhRStringRigidTermination >> asBox [

	^ self inputBlock asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhRStringRigidTermination >> initialize [ 
super initialize .
processExpression := 'process = pm.rStringRigidTermination;'
]
