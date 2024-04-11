Extension { #name : #Number }

{ #category : #'*Phausto' }
Number >> asBox [

BoxAPI uniqueInstance createLibContext .
	self isInteger
		ifTrue: [ ^ BoxAPI uniqueInstance boxInt: self ]
		ifFalse: [ ^ BoxAPI uniqueInstance boxReal: self ]
]
