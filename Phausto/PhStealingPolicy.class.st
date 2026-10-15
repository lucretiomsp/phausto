"
""Strategy pattern. Swappable voice-stealing logic.
Subclasses implement #stealFrom: to define which voice gets recycled when all voices are active.
Default policy: steal the oldest voice.""
"
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
