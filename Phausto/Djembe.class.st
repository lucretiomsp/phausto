"
Dirt-simple djembe modal physical model. Mode parameters are empirically calculated and don't correspond to any measurements or 3D model. They kind of sound good though :).

This model also implements a virtual ""exciter"".
"
Class {
	#name : 'Djembe',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
Djembe >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self freq asBox , self strikePosition asBox , self strikeSharpness asBox 
	            , self gain asBox , self trigger asBox  connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
Djembe >> initialize [

	super initialize.
	processExpression := 'process = pm.djembe;'.
	
]
