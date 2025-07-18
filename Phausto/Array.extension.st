Extension { #name : 'Array' }

{ #category : '*Phausto' }
Array >> asChainOfUGen [
	"connect Ugen in the Array from first to last"

	| chain |
	chain := self allButFirst inject: self first into: [ :a :c | a => c ].
	^ chain
]

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
	"(self allSatisfy: [ :each | each isUGen ]) ifTrue: [
		sum := self inject: UnitGenerator new into: [ :a :c | a + c ]
		]."
	sum := self inject: UnitGenerator new into: [ :a :c | a + c ].
	^ sum
]

{ #category : '*Phausto' }
Array >> setValue: aFloat parameter: aParamAsString forDsp: aDsp [
	"  set the value of the parameter named aParamAsString"

	| indx |
	indx := self indexOf: aParamAsString.
	indx ~= 0
		ifTrue: [
			aDsp
				setValue: aFloat
				parameterIndex: (self indexOf: aParamAsString) - 1 ]
		ifFalse: [
			self inform:
				aParamAsString , ' is not a valid parameter for this DSP' ]
]

{ #category : '*Phausto' }
Array >> trig: aString for: aDurationInSeconds forDsp: aDsp [

	
			[
			self setValue: 1 parameter: aString forDsp: aDsp.
			aDurationInSeconds wait.
			self setValue: 0 parameter: aString forDsp: aDsp.] forkAt: 70 
	"send a trigger of  aDurationInSeconds  to a Faust parameter, designed to trig envelopes and percussions-like sounds"

	" parameter must exist"
]
