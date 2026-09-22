Class {
	#name : 'PhOldestReleaseSteal',
	#superclass : 'PhStealingPolicy',
	#category : 'Phausto-Polyphony',
	#package : 'Phausto',
	#tag : 'Polyphony'
}

{ #category : 'as yet unclassified' }
PhOldestReleaseSteal >> stealFrom: voices [
    | released |
    released := voices select: [ :v | v gate = 0.0 ].
    ^ released
        ifEmpty: [ super stealFrom: voices ]
        ifNotEmpty: [ released detectMin: [ :v | v date ] ]
]
