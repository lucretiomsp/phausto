"
Bidirectional block implementing a left rigid string termination (no damping, just phase inversion).
"
Class {
	#name : 'PhLStringRigidTermination',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhLStringRigidTermination >> asBox [

	^ self inputBlock asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhLStringRigidTermination >> initialize [

	super initialize.
	processExpression := 'process = pm.lStringRigidTermination;'
]
