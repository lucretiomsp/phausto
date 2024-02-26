Class {
	#name : #DummySquare,
	#superclass : #UnitGenerators,
	#instVars : [
		'freq'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #initialization }
DummySquare >> initialize [

	super initialize.
	code := self importStatement , 'process = os.square;'
]
