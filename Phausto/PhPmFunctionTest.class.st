"
Tests of the PhPmFunction mechanism: Faust code generation, setters, chains, inputs, labels.
"
Class {
	#name : 'PhPmFunctionTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhPmFunctionTest >> testArgumentsAreWrittenInFaustOrder [

	| expression |
	expression := PhOpenString new faustExpression.
	self assert: (expression beginsWith: 'pm.openString(').
	self assert: (expression indexOfSubCollection: 'PhOpenStringLength') < (expression indexOfSubCollection: 'PhOpenStringStiffness').
	self assert: (expression indexOfSubCollection: 'PhOpenStringStiffness') < (expression indexOfSubCollection: 'PhOpenStringPluckPosition').
	self assert: (expression indexOfSubCollection: 'PhOpenStringPluckPosition') < (expression indexOfSubCollection: 'pm.impulseExcitation(')
]

{ #category : 'tests' }
PhPmFunctionTest >> testArrayResetsTheRangeOfAWidget [

	| string |
	string := PhOpenString new length: #( 1 0.5 2 0.1 ).
	self assert: string length init equals: 1.
	self assert: string length min equals: 0.5.
	self assert: string length max equals: 2
]

{ #category : 'tests' }
PhPmFunctionTest >> testChuckAnOscillatorIntoAPhysicalModel [

	| filter dsp |
	filter := SquareOsc new => PhModeFilter new.
	self assert: (filter isKindOf: PhModeFilter).
	self assert: (filter input isKindOf: SquareOsc).
	dsp := filter asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	"the input is a UnitGenerator, not a Box bound to the destroyed lib context: a second DSP works"
	self deny: filter asDsp isNull
]

{ #category : 'tests' }
PhPmFunctionTest >> testChuckBuildsAChainBetweenBidirectionalBlocks [

	| chain dsp |
	chain := PhLStringRigidTermination new => PhOpenString new => PhRStringRigidTermination new.
	self assert: chain class equals: PhChain.
	self assert: chain blocks size equals: 3.
	self assert: (chain faustExpression beginsWith: 'pm.chain(pm.lStringRigidTermination : pm.openString(').
	self assert: (chain faustExpression endsWith: ' : pm.rStringRigidTermination)').
	dsp := chain endChain asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhPmFunctionTest >> testChuckFlattensChains [

	| chain |
	chain := (PhGuitarNuts new => PhSteelString new) => (PhGuitarBridge new => OutLeftRightWave new).
	self assert: chain blocks size equals: 4.
	self assert: (chain blocks collect: [ :each | each class ]) asArray equals: { PhGuitarNuts. PhSteelString. PhGuitarBridge. OutLeftRightWave }
]

{ #category : 'tests' }
PhPmFunctionTest >> testChuckIntoAPhysicalModelSetsItsInput [

	| strike model dsp |
	strike := PhStrike new.
	model := PhDjembeModel new.
	self assert: strike => model identicalTo: model.
	self assert: model input identicalTo: strike.
	self assert: (model faustExpression beginsWith: 'pm.strike(').
	dsp := model stereo asDsp.
	self deny: dsp isNull
]

{ #category : 'tests' }
PhPmFunctionTest >> testChuckOutOfAPhysicalModelKeepsWorking [

	| dsp |
	dsp := (Marimba new => Korg35LPF new) stereo asDsp.
	self deny: dsp isNull
]

{ #category : 'tests' }
PhPmFunctionTest >> testControlParametersForEveryWidgetArgument [

	| marimba |
	marimba := Marimba new.
	#( #freq #strikePosition #strikeCutoff #strikeSharpness #gain #trigger ) do: [ :each |
		self assert: (marimba controlParameters includesKey: each) ].
	self assert: (marimba controlParameters at: #trigger) widgetType equals: marimba trigger widgetType
]

{ #category : 'tests' }
PhPmFunctionTest >> testEveryArgumentHasAGetterAndASetter [

	PhPmFunction concreteClasses do: [ :class |
		class argumentNames do: [ :each |
			self assert: (class canUnderstand: each).
			self assert: (class canUnderstand: (each , ':') asSymbol) ] ]
]

{ #category : 'tests' }
PhPmFunctionTest >> testEveryFunctionOfTheLibraryIsPorted [

	self assert: PhPmFunction concreteClasses size equals: 150.
	self assert: (PhPmFunction concreteClasses collect: [ :each | each faustName ]) asSet size equals: 150
]

{ #category : 'tests' }
PhPmFunctionTest >> testFaustCodeArgument [

	| termination |
	termination := PhLTermination new termination: '*(-0.9)'.
	self assert: (termination faustExpression beginsWith: 'pm.lTermination(*(-0.9), pm.basicBlock)').
	self deny: termination asDsp isNull
]

{ #category : 'tests' }
PhPmFunctionTest >> testFunctionWithoutArguments [

	self assert: PhGuitarBridge new faustExpression equals: 'pm.guitarBridge'.
	self assert: PhGuitarBridge new processExpression equals: 'process = pm.guitarBridge;'
]

{ #category : 'tests' }
PhPmFunctionTest >> testHomeMadeGuitar [
	"a string between guitar nuts and bridge, closed by endChain, as in pm.guitarModel"

	| dsp |
	dsp := (PhGuitarNuts new => PhSteelString new => PhGuitarBridge new => PhGuitarBody new => OutLeftRightWave new) endChain asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhPmFunctionTest >> testInputIsWiredInFront [

	| filter dsp |
	filter := PhModeFilter new input: PhImpulseExcitation new.
	self assert: (filter faustExpression beginsWith: 'pm.impulseExcitation(').
	self assert: (filter faustExpression includesSubstring: ' : pm.modeFilter(').
	dsp := filter asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0
]

{ #category : 'tests' }
PhPmFunctionTest >> testLabelReachesNestedPhysicalModels [

	| string |
	string := PhOpenString new label: 'str'.
	self assert: string length label equals: 'strLength'.
	self assert: string excitation label equals: 'strExcitation'.
	self assert: string excitation gate label equals: 'strExcitationGate'
]

{ #category : 'tests' }
PhPmFunctionTest >> testListArguments [

	| model |
	model := PhModalModel new
		         numberOfModes: 3;
		         freqs: #( 440 660 880 );
		         t60s: #( 0.5 0.4 0.3 );
		         gains: #( 0.8 0.6 0.4 ).
	self assert: (model faustExpression includesSubstring: 'pm.modalModel(3, (440, 660, 880), (0.5, 0.4, 0.3), (0.8, 0.6, 0.4))').
	self deny: model asDsp isNull
]

{ #category : 'tests' }
PhPmFunctionTest >> testNumberReplacesAConstant [

	| waveguide |
	waveguide := PhWaveguide new nMax: 1024.
	self assert: waveguide nMax equals: 1024.
	self assert: (waveguide faustExpression beginsWith: 'pm.waveguide(1024, ')
]

{ #category : 'tests' }
PhPmFunctionTest >> testNumberSetsTheInitialValueOfAWidget [

	| string |
	string := PhOpenString new length: 1.2.
	self assert: (string length isKindOf: PhHSlider).
	self assert: string length init equals: 1.2
]

{ #category : 'tests' }
PhPmFunctionTest >> testSymbolRelabelsAWidget [

	| string |
	string := PhOpenString new length: #myLength.
	self assert: string length label equals: #myLength.
	self assert: (string faustExpression includesSubstring: '"myLength"')
]

{ #category : 'tests' }
PhPmFunctionTest >> testTurboPhaustoStyleSetters [
	"TurboPhausto relabels the widgets with symbols, PhaustoExamples patches UnitGenerators"

	| djembe |
	djembe := Djembe new
		          label: 'djembe';
		          trigger: #djembeTrigger;
		          freq: #djembeFreq.
	self assert: djembe trigger label equals: #djembeTrigger.
	self assert: djembe freq label equals: #djembeFreq.
	djembe trigger: (Pulsen new period: 0.3).
	self deny: (djembe trigger isKindOf: UIPrimitive).
	self deny: djembe stereo asDsp isNull
]

{ #category : 'tests' }
PhPmFunctionTest >> testUnitGeneratorIsPatched [

	| string |
	string := PhOpenString new excitation: PhStrike new.
	self assert: (string faustExpression includesSubstring: 'pm.strike(').
	self deny: string asDsp isNull
]

{ #category : 'tests' }
PhPmFunctionTest >> testWithoutInputTheInputsStayOpen [

	| dsp |
	dsp := PhModeFilter new input: nil; asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1
]
