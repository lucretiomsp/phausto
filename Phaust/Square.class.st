Class {
	#name : #Square,
	#superclass : #PhaustUnit,
	#category : 'Phaust-Uncategorized'
}

{ #category : #'accessing - structure variables' }
Square class >> freq: aFloat [

^ self new phaustString: 'os.square(' , aFloat asString , ')'
]
