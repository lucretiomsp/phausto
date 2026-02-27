"
Abstract superclass for Physical Tubes
"
Class {
	#name : 'PhTube',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'initialization' }
PhTube >> initialize [ 
super initialize.
input := PhBasicBlock new.
]

{ #category : 'accessing' }
PhTube >> input [ 

^ input
]
