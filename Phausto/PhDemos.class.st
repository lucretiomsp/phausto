"
Subclasses of demo are complex  Unit Generations with a ready-UI coming from Faust examples
"
Class {
	#name : 'PhDemos',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
PhDemos >> initialize [ 

| demoName |
super initialize .
demoName := self className asLowercase .
processExpression := 'process = dm.' , demoName ,  ';'.
]
