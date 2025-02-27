"
Same as blower but with default UI and vibrato controls.
"
Class {
	#name : 'Blower_UI',
	#superclass : 'Exciter',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'initialization' }
Blower_UI >> initialize [

	super initialize.
	processExpression := 'process = pm.blower_ui;'
]
