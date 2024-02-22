Class {
	#name : #BoxCombinator,
	#superclass : #Object,
	#instVars : [
		'left',
		'right'
	],
	#category : #'Phaust-Boxes'
}

{ #category : #'code generation' }
BoxCombinator >> faustCode [

	^ left faustCode , self operatorString , right faustCode
]

{ #category : #accessing }
BoxCombinator >> left: aBoxWire [ 
	left := aBoxWire
]

{ #category : #'code generation' }
BoxCombinator >> operatorString [
	
	self subclassResponsibility
]

{ #category : #accessing }
BoxCombinator >> right: aBoxWire [ 
	right := aBoxWire
]
