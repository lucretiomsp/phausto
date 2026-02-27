"
Same as fluteModel but with a built-in UI. This function doesn't implement a virtual ""blower"", thus pressure remains an argument here.
"
Class {
	#name : 'PhFluteModelUI',
	#superclass : 'UnitGenerator',
	#instVars : [
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'initialization' }
PhFluteModelUI >> initialize [

	super initialize.
	processExpression := 'process = pm.fluteModel_ui;'.
	pressure := (self label , 'Pressure') asSymbol asPhHSlider
]
