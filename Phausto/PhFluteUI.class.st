"
Ready-to-use flute physical model with built-in UI based on fluteModel.
"
Class {
	#name : 'PhFluteUI',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'initialization' }
PhFluteUI >> initialize [ 
super initialize .
processExpression := 'process = flute_ui;'
]
