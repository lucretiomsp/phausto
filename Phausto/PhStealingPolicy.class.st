Class {
	#name : 'PhStealingPolicy',
	#superclass : 'Object',
	#category : 'Phausto-Polyphony',
	#package : 'Phausto',
	#tag : 'Polyphony'
}

{ #category : 'as yet unclassified' }
PhStealingPolicy >> stealFrom: voices [
    "Default: steal oldest voice. Subclasses override."
    ^ voices detectMin: [ :v | v date ]
]
