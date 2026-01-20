"
Same as blower but with default UI and vibrato controls.
"
Class {
	#name : 'PhBlower_UI',
	#superclass : 'Exciter',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
PhBlower_UI >> initialize [

	super initialize.
	processExpression := 'process = pm.blower_ui;'
]
