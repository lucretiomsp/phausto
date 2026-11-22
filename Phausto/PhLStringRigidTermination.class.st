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

{ #category : 'faust' }
PhLStringRigidTermination class >> faustName [

	^ 'lStringRigidTermination'
]
