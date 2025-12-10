Extension { #name : 'SequenceableCollection' }

{ #category : '*Phausto' }
SequenceableCollection >> asChainOfUGen [
	"connect Ugen in the Array from first to last"

	| chain |
	chain := self allButFirst inject: self first into: [ :a :c | a => c ].
	^ chain
]

{ #category : '*Phausto' }
SequenceableCollection >> asSumOfUGen [

	| sum firstUGen |
	firstUGen := self first.
	"sum all the Unit Generator in the collection"
	"(self allSatisfy: [ :each | each isUGen ]) ifTrue: [
		sum := self inject: UnitGenerator new into: [ :a :c | a + c ]
		]."
	sum := self inject: UnitGenerator new into: [ :a :c | a + c ].
	^ sum
]
