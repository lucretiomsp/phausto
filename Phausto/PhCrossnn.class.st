"
Cross two bus(N)s.
##Parameters:
**n:** the number of signals in the bus (int, as a constant numerical expression - by default  = 1)
"
Class {
	#name : 'PhCrossnn',
	#superclass : 'UnitGenerator',
	#instVars : [
		'n'
	],
	#category : 'Phausto-Routes',
	#package : 'Phausto',
	#tag : 'Routes'
}

{ #category : 'converting' }
PhCrossnn >> asBox [ 

^ super asBox
]

{ #category : 'initialization' }
PhCrossnn >> initialize [

	super initialize.
	processExpression := 'process = ro.crossnn(1);'
]

{ #category : 'accessing' }
PhCrossnn >> n [ 

^ n.
]

{ #category : 'accessing' }
PhCrossnn >> n: anInteger [

| peStream |
n :=  anInteger .
peStream := ReadWriteStream on: ''.
peStream << 'process = ro.crossnn('.
anInteger printOn: peStream.
peStream << ');'
]
