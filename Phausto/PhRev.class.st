"
Reverse the input signal by blocks of n>0 samples. rev(1) is the indentity function. rev(n) has a latency of n-1 samples.

Create a new instance of the class with
```language=pharo
PhRev new: anInteger
```
"
Class {
	#name : 'PhRev',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'instance creation' }
PhRev class >> new: anInteger [

	| n |
	n := anInteger asString.
	^ self new processExpression: 'process = si.rev(' , n , ');'
]

{ #category : 'instance creation' }
PhRev >> new: anInteger [

	^ self class new: anInteger
]
