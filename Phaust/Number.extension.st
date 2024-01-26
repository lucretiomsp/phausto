Extension { #name : #Number }

{ #category : #'*Phaust' }
Number >> asBox [

	self isInteger
		ifTrue: [ ^ BoxAPI uniqueInstance  boxInt: self ]
		ifFalse: [ ^ BoxAPI  uniqueInstance boxReal: self ]
]
