"
Put _anInteger_ number of signals in parallel.
Create a new instance of the class with
```language=pharo
PhBus new: anInteger
```
"
Class {
	#name : 'PhBus',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'instance creation' }
PhBus class >> new: anInteger [

	| n |
	n := anInteger asString.
	^ self new processExpression: 'process = si.bus(' , n , ');'
]

{ #category : 'instance creation' }
PhBus >> new: anInteger [ 
	^ self class new: anInteger 
]
