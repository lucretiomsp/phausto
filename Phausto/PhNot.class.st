Class {
	#name : 'PhNot',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhNot >> initialize [ 

super initialize .
processExpression := 'processExpression = ma.not'
]
