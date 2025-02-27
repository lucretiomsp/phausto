"
Superclass for various kind of _excitation_ signal generators. 
Use one of the subclasses to provide excitation for a model:

- impulseExcitation
- strikeModel
- strike
- pluckString
- blower
- blower_ui

All exciters are activated when the gate signal changes from 0 to a value greater than 0.
"
Class {
	#name : 'Exciter',
	#superclass : 'UnitGenerator',
	#instVars : [
		'gate'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'accessing' }
Exciter >> gate [

^ gate
]

{ #category : 'initialization' }
Exciter >> initialize [

super initialize.
gate := PhButton new label: self label , 'Gate'
]
