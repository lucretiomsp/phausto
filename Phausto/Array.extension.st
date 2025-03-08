Extension { #name : 'Array' }

{ #category : '*Phausto' }
Array >> asParam: aString forUGen: aUnitGenerator [
	"change init, min, max, step of the UI element to the array value"

	| uiElement |
	uiElement := aUnitGenerator perform: aString asSymbol.
	self size = 4 ifTrue: [uiElement
		init: self first;
		min: (self at: 2);
		max: (self at: 3);
		step: self last] ifFalse: [ uiElement := PhHSlider new label: self first
		init: (self at: 2)
		min: (self at: 3)
		max: (self at: 4)
		step: self last] .

	aUnitGenerator instVarNamed: aString put: uiElement
]

{ #category : '*Phausto' }
Array >> asPhList [

"convert the array into a PhList a.k.a a Faust pseudo list"
| list |

list := PhList new addAll: self.
^ list
]

{ #category : '*Phausto' }
Array >> asSumOfUGen [

	| sum firstUGen |
	firstUGen := self first.
	"sum all the Unit Generator in the collection"
	(self allSatisfy: [ :each | each isUGen ]) ifTrue: [
		sum :=self inject: UnitGenerator new into: [:a :c | a + c].
		"self allButFirstDo: [ :u | sum := firstUGen + u ]" ].
	^ sum
]
