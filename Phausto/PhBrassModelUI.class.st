"
Same as brassModel but with a built-in UI. This function doesn't implement a virtual ""blower"", thus pressure remains an argument here.
"
Class {
	#name : 'PhBrassModelUI',
	#superclass : 'UnitGenerator',
	#instVars : [
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhBrassModelUI >> asBox [ 

^ self pressure asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhBrassModelUI >> initialize [

	super initialize.
	processExpression := 'process = pm.brassModel_ui;'.
	pressure := (self label , 'Pressure') asSymbol asPhHSlider .
]

{ #category : 'accessing' }
PhBrassModelUI >> pressure [ 

 ^ pressure
]
