Class {
	#name : #Sawtooth,
	#superclass : #PhaustUnit,
	#category : 'Phaust-Uncategorized'
}

{ #category : #'accessing - structure variables' }
Sawtooth class >> freq: aFloat [

^ self new phaustString: 'os.sawtooth(' , aFloat asString , ')'
]
