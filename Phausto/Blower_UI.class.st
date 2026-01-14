"
Same as blower but with default UI and vibrato controls.
"
Class {
	#name : 'Blower_UI',
	#superclass : 'Exciter',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
Blower_UI >> initialize [

	super initialize.
	processExpression := 'process = pm.blower_ui;'
]
