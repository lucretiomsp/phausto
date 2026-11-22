"
One test per function of physmodels.lib: the default instance of every PhPmFunction subclass must give a valid DSP (no null pointer) with the same number of inputs and outputs as the Faust function.
"
Class {
	#name : 'PhysicalModelLibraryTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhysicalModelLibraryTest >> testBrassMIDIAsDsp [

	| dsp |
	dsp := BrassMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testChurchBellAsDsp [

	| dsp |
	dsp := ChurchBell new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testChurchBellUIAsDsp [

	| dsp |
	dsp := ChurchBellUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testClarinetMIDIAsDsp [

	| dsp |
	dsp := ClarinetMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testCloseInsAsDsp [

	| dsp |
	dsp := CloseIns new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testCloseOutsAsDsp [

	| dsp |
	dsp := CloseOuts new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testDjembeAsDsp [

	| dsp |
	dsp := Djembe new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testDjembeMIDIAsDsp [

	| dsp |
	dsp := DjembeMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testElecGuitarAsDsp [

	| dsp |
	dsp := ElecGuitar new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testElecGuitarMIDIAsDsp [

	| dsp |
	dsp := ElecGuitarMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testEnglishBellAsDsp [

	| dsp |
	dsp := EnglishBell new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testEnglishBellUIAsDsp [

	| dsp |
	dsp := EnglishBellUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testFluteMIDIAsDsp [

	| dsp |
	dsp := FluteMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testFluteModelAsDsp [

	| dsp |
	dsp := FluteModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testFrenchBellAsDsp [

	| dsp |
	dsp := FrenchBell new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testFrenchBellUIAsDsp [

	| dsp |
	dsp := FrenchBellUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testGermanBellAsDsp [

	| dsp |
	dsp := GermanBell new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testGermanBellUIAsDsp [

	| dsp |
	dsp := GermanBellUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testGuitarAsDsp [

	| dsp |
	dsp := Guitar new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testGuitarMIDIAsDsp [

	| dsp |
	dsp := GuitarMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testInLeftRightWaveAsDsp [

	| dsp |
	dsp := InLeftRightWave new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testInLeftWaveAsDsp [

	| dsp |
	dsp := InLeftWave new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testInRightWaveAsDsp [

	| dsp |
	dsp := InRightWave new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testKarplusStrongMIDIAsDsp [

	| dsp |
	dsp := KarplusStrongMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testMarimbaAsDsp [

	| dsp |
	dsp := Marimba new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testMarimbaMIDIAsDsp [

	| dsp |
	dsp := MarimbaMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testModularInterpInstrMIDIAsDsp [

	| dsp |
	dsp := ModularInterpInstrMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testNylonGuitarMIDIAsDsp [

	| dsp |
	dsp := NylonGuitarMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testOutLeftRightWaveAsDsp [

	| dsp |
	dsp := OutLeftRightWave new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testOutLeftWaveAsDsp [

	| dsp |
	dsp := OutLeftWave new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testOutRightWaveAsDsp [

	| dsp |
	dsp := OutRightWave new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhAllpassNLAsDsp [

	| dsp |
	dsp := PhAllpassNL new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhAutobendFreqAsDsp [

	| dsp |
	dsp := PhAutobendFreq new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBasicBlockAsDsp [

	| dsp |
	dsp := PhBasicBlock new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBlowerAsDsp [

	| dsp |
	dsp := PhBlower new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBlowerUIAsDsp [

	| dsp |
	dsp := PhBlower_UI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBowInteractionAsDsp [

	| dsp |
	dsp := PhBowInteraction new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBowTableAsDsp [

	| dsp |
	dsp := PhBowTable new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBrassLipsAsDsp [

	| dsp |
	dsp := PhBrassLips new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBrassLipsTableAsDsp [

	| dsp |
	dsp := PhBrassLipsTable new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBrassModelAsDsp [

	| dsp |
	dsp := PhBrassModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBrassModelUIAsDsp [

	| dsp |
	dsp := PhBrassModelUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBrassUIAsDsp [

	| dsp |
	dsp := PhBrassUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhBridgeFilterAsDsp [

	| dsp |
	dsp := PhBridgeFilter new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhChainAsDsp [

	| dsp |
	dsp := PhChain new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhChurchBellModelAsDsp [

	| dsp |
	dsp := PhChurchBellModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhClarinetModelAsDsp [

	| dsp |
	dsp := PhClarinetModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhClarinetModelUIAsDsp [

	| dsp |
	dsp := PhClarinetModelUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhClarinetMouthPieceAsDsp [

	| dsp |
	dsp := PhClarinetMouthPiece new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhClarinetReedAsDsp [

	| dsp |
	dsp := PhClarinetReed new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhClarinetUIAsDsp [

	| dsp |
	dsp := PhClarinetUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhDjembeModelAsDsp [

	| dsp |
	dsp := PhDjembeModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhElecGuitarBridgeAsDsp [

	| dsp |
	dsp := PhElecGuitarBridge new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhElecGuitarModelAsDsp [

	| dsp |
	dsp := PhElecGuitarModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhElecGuitarNutsAsDsp [

	| dsp |
	dsp := PhElecGuitarNuts new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhEndChainAsDsp [

	| dsp |
	dsp := PhEndChain new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhEnglishBellModelAsDsp [

	| dsp |
	dsp := PhEnglishBellModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhF2lAsDsp [

	| dsp |
	dsp := PhF2l new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFluteEmbouchureAsDsp [

	| dsp |
	dsp := PhFluteEmbouchure new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFluteFootAsDsp [

	| dsp |
	dsp := PhFluteFoot new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFluteHeadAsDsp [

	| dsp |
	dsp := PhFluteHead new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFluteJetTableAsDsp [

	| dsp |
	dsp := PhFluteJetTable new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFluteModelUIAsDsp [

	| dsp |
	dsp := PhFluteModelUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFluteUIAsDsp [

	| dsp |
	dsp := PhFluteUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFofAsDsp [

	| dsp |
	dsp := PhFof new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFofCycleAsDsp [

	| dsp |
	dsp := PhFofCycle new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFofSHAsDsp [

	| dsp |
	dsp := PhFofSH new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFofSmoothAsDsp [

	| dsp |
	dsp := PhFofSmooth new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFormantFilterBPAsDsp [

	| dsp |
	dsp := PhFormantFilterBP new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFormantFilterFofCycleAsDsp [

	| dsp |
	dsp := PhFormantFilterFofCycle new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFormantFilterFofSmoothAsDsp [

	| dsp |
	dsp := PhFormantFilterFofSmooth new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFormantFilterbankAsDsp [

	| dsp |
	dsp := PhFormantFilterbank new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFormantFilterbankBPAsDsp [

	| dsp |
	dsp := PhFormantFilterbankBP new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFormantFilterbankFofCycleAsDsp [

	| dsp |
	dsp := PhFormantFilterbankFofCycle new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFormantFilterbankFofSmoothAsDsp [

	| dsp |
	dsp := PhFormantFilterbankFofSmooth new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFormantValuesAsDsp [

	| dsp |
	dsp := PhFormantValues new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhFrenchBellModelAsDsp [

	| dsp |
	dsp := PhFrenchBellModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhGermanBellModelAsDsp [

	| dsp |
	dsp := PhGermanBellModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhGuitarBodyAsDsp [

	| dsp |
	dsp := PhGuitarBody new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhGuitarBridgeAsDsp [

	| dsp |
	dsp := PhGuitarBridge new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhGuitarModelAsDsp [

	| dsp |
	dsp := PhGuitarModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhGuitarNutsAsDsp [

	| dsp |
	dsp := PhGuitarNuts new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhIdealStringAsDsp [

	| dsp |
	dsp := PhIdealString new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhImpulseExcitationAsDsp [

	| dsp |
	dsp := PhImpulseExcitation new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhKarplusStrongAsDsp [

	| dsp |
	dsp := PhKarplusStrong new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhKsReflexionFilterAsDsp [

	| dsp |
	dsp := PhKsReflexionFilter new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhL2fAsDsp [

	| dsp |
	dsp := PhL2f new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhL2sAsDsp [

	| dsp |
	dsp := PhL2s new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhLStringRigidTerminationAsDsp [

	| dsp |
	dsp := PhLStringRigidTermination new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhLTerminationAsDsp [

	| dsp |
	dsp := PhLTermination new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhMarimbaBarModelAsDsp [

	| dsp |
	dsp := PhMarimbaBarModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhMarimbaModelAsDsp [

	| dsp |
	dsp := PhMarimbaModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhMarimbaResTubeAsDsp [

	| dsp |
	dsp := PhMarimbaResTube new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhMaxLengthAsDsp [

	| dsp |
	dsp := PhMaxLength new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhModalModelAsDsp [

	| dsp |
	dsp := PhModalModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhModeFilterAsDsp [

	| dsp |
	dsp := PhModeFilter new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhModeInterpResAsDsp [

	| dsp |
	dsp := PhModeInterpRes new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhModularInterpBodyAsDsp [

	| dsp |
	dsp := PhModularInterpBody new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhModularInterpInstrAsDsp [

	| dsp |
	dsp := PhModularInterpInstr new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhModularInterpStringModelAsDsp [

	| dsp |
	dsp := PhModularInterpStringModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhNylonGuitarAsDsp [

	| dsp |
	dsp := PhNylonGuitar new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhNylonGuitarModelAsDsp [

	| dsp |
	dsp := PhNylonGuitarModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhNylonStringAsDsp [

	| dsp |
	dsp := PhNylonString new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhOpenStringAsDsp [

	| dsp |
	dsp := PhOpenString new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhOpenStringPickAsDsp [

	| dsp |
	dsp := PhOpenStringPick new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhOpenStringPickdownAsDsp [

	| dsp |
	dsp := PhOpenStringPickdown new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhOpenStringPickupAsDsp [

	| dsp |
	dsp := PhOpenStringPickup new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhOpenTubeAsDsp [

	| dsp |
	dsp := PhOpenTube new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhPluckStringAsDsp [

	| dsp |
	dsp := PhPluckString new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhRStringRigidTerminationAsDsp [

	| dsp |
	dsp := PhRStringRigidTermination new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhRTerminationAsDsp [

	| dsp |
	dsp := PhRTermination new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhReedTableAsDsp [

	| dsp |
	dsp := PhReedTable new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhRkSolveAsDsp [

	| dsp |
	dsp := PhRkSolve new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhRussianBellModelAsDsp [

	| dsp |
	dsp := PhRussianBellModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhSkirtWidthMultiplierAsDsp [

	| dsp |
	dsp := PhSkirtWidthMultiplier new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhSpeedOfSoundAsDsp [

	| dsp |
	dsp := PhSpeedOfSound new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhStandardBellModelAsDsp [

	| dsp |
	dsp := PhStandardBellModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhSteelStringAsDsp [

	| dsp |
	dsp := PhSteelString new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhStrikeAsDsp [

	| dsp |
	dsp := PhStrike new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhStrikeModelAsDsp [

	| dsp |
	dsp := PhStrikeModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhStringSegmentAsDsp [

	| dsp |
	dsp := PhStringSegment new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhTerminationsAsDsp [

	| dsp |
	dsp := PhTerminations new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhViolinBodyAsDsp [

	| dsp |
	dsp := PhViolinBody new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhViolinBowAsDsp [

	| dsp |
	dsp := PhViolinBow new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhViolinBowTableAsDsp [

	| dsp |
	dsp := PhViolinBowTable new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhViolinBowedStringAsDsp [

	| dsp |
	dsp := PhViolinBowedString new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhViolinBridgeAsDsp [

	| dsp |
	dsp := PhViolinBridge new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhViolinNutsAsDsp [

	| dsp |
	dsp := PhViolinNuts new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhViolinUIAsDsp [

	| dsp |
	dsp := PhViolinUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhVocalEffortAsDsp [

	| dsp |
	dsp := PhVocalEffort new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 1.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhVoiceGenderAsDsp [

	| dsp |
	dsp := PhVoiceGender new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhWBellAsDsp [

	| dsp |
	dsp := PhWBell new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhWaveguideAsDsp [

	| dsp |
	dsp := PhWaveguide new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testPhWaveguideNAsDsp [

	| dsp |
	dsp := PhWaveguideN new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 3.
	self assert: dsp numberOfOutputs equals: 3
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testRussianBellAsDsp [

	| dsp |
	dsp := RussianBell new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testRussianBellUIAsDsp [

	| dsp |
	dsp := RussianBellUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelAsDsp [

	| dsp |
	dsp := SFFormantModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelBPAsDsp [

	| dsp |
	dsp := SFFormantModelBP new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelBPMIDIAsDsp [

	| dsp |
	dsp := SFFormantModelBPMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelBPuiAsDsp [

	| dsp |
	dsp := SFFormantModelBP_ui new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelFofCycleAsDsp [

	| dsp |
	dsp := SFFormantModelFofCycle new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelFofCycleMIDIAsDsp [

	| dsp |
	dsp := SFFormantModelFofCycleMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelFofCycleUIAsDsp [

	| dsp |
	dsp := SFFormantModelFofCycle_UI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelFofSmoothAsDsp [

	| dsp |
	dsp := SFFormantModelFofSmooth new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelFofSmoothMIDIAsDsp [

	| dsp |
	dsp := SFFormantModelFofSmoothMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testSFFormantModelFofSmoothUIAsDsp [

	| dsp |
	dsp := SFFormantModelFofSmooth_UI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testStandardBellAsDsp [

	| dsp |
	dsp := StandardBell new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testStandardBellUIAsDsp [

	| dsp |
	dsp := StandardBellUI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testViolinMIDIAsDsp [

	| dsp |
	dsp := ViolinMIDI new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]

{ #category : 'tests' }
PhysicalModelLibraryTest >> testViolinModelAsDsp [

	| dsp |
	dsp := ViolinModel new asDsp.
	self deny: dsp isNull.
	self assert: dsp numberOfInputs equals: 0.
	self assert: dsp numberOfOutputs equals: 1
]
