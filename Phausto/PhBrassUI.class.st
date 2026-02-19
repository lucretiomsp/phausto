"
Ready-to-use brass instrument physical model with built-in UI based on brassModel.
"
Class {
	#name : 'PhBrassUI',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'initialization' }
PhBrassUI >> initialize [ 
super initialize .
processExpression := 'process = pm.brass_ui;'
]
