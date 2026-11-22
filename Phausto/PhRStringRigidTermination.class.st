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

{ #category : 'faust' }
PhRStringRigidTermination class >> faustName [

	^ 'rStringRigidTermination'
]
