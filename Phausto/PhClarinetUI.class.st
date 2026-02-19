"
Ready-to-use clarinet physical model with built-in UI based on clarinetModel.
"
Class {
	#name : 'PhClarinetUI',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'initialization' }
PhClarinetUI >> initialize [

	super initialize.
	processExpression := 'process = pm.clarinet_ui;'
]
