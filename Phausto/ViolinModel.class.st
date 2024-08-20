"
Ready-to-use simple violin physical model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function. Pitch is changed by changing the length of the string (and not through a finger model)
"
Class {
	#name : 'ViolinModel',
	#superclass : 'UnitGenerator',
	#instVars : [
		'stringLength',
		'bowVelocity',
		'bowPressure',
		'bowPosition'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
ViolinModel >> asBox [

	| intermediateBox finalBox |

	intermediateBox := super asBox.

	finalBox := 
	stringLength , bowVelocity , bowPressure , bowPosition connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
ViolinModel >> bowPosition [

	^ bowPosition
]

{ #category : 'accessing' }
ViolinModel >> bowPosition: anObject [

	bowPosition := anObject asBox
]

{ #category : 'accessing' }
ViolinModel >> bowPressure [

	^ bowPressure
]

{ #category : 'accessing' }
ViolinModel >> bowPressure: anObject [

	bowPressure := anObject asBox
]

{ #category : 'accessing' }
ViolinModel >> bowVelocity [

	^ bowVelocity
]

{ #category : 'accessing' }
ViolinModel >> bowVelocity: anObject [

	bowVelocity := anObject asBox
]

{ #category : 'initialization' }
ViolinModel >> initialize [ 

super initialize .

processExpression := 'process = pm.violinModel;'.
self stringLength: 1.
self bowVelocity: 0.4.
self bowPressure: 0.6.
self bowPosition: 0.2 
]

{ #category : 'accessing' }
ViolinModel >> stringLength [

	^ stringLength
]

{ #category : 'accessing' }
ViolinModel >> stringLength: anObject [

	stringLength := anObject asBox
]
