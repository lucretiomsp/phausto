"
Dirt-simple djembe modal physical model. Mode parameters are empirically calculated and don't correspond to any measurements or 3D model. They kind of sound good though :).

This model also implements a virtual ""exciter"".
"
Class {
	#name : 'Djembe',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
Djembe >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self freq , self strikePosition , self strikeSharpness , self gain , self trigger
		            connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
Djembe >> initialize [

	super initialize.
	processExpression := 'process = pm.djembe;'.
	
]
