Class {
	#name : #PhaustUnit,
	#superclass : #Object,
	#instVars : [
		'phaustString'
	],
	#category : 'Phaust-Uncategorized'
}

{ #category : #arithmetic }
PhaustUnit >> * anObject [

^ self phaustString:  (self  phaustString , ' * ' , anObject asString).
]

{ #category : #arithmetic }
PhaustUnit >> + anObject [

^ self phaustString:  (self  phaustString , ' + ' , anObject asString).
]

{ #category : #converting }
PhaustUnit >> asString [
" convenience method"
^ self phaustString 
]

{ #category : #initialization }
PhaustUnit >> initialize [ 
super initialize
]

{ #category : #accessing }
PhaustUnit >> phaustString [

	^ phaustString
]

{ #category : #accessing }
PhaustUnit >> phaustString: aString [

	phaustString := aString
]
