Class {
	#name : 'PhysicalModelTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhysicalModelTest >> testBlowerAsDsp [

	self deny:  PhBlower new asDsp isNull 
]

{ #category : 'tests' }
PhysicalModelTest >> testBlowerUIAsDsp [

	self deny: PhBlower_UI new asDsp isNull 
]

{ #category : 'tests' }
PhysicalModelTest >> testDjembeAsDsp [

self assert: Djembe  new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testElecGuitarAsDsp [

	self assert: ElecGuitar new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testF2lAsDsp [

	self assert: PhF2l new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testFrenchBellAsDsp [

self assert: FrenchBell  new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testGuitarAsDsp [

	self deny: Guitar new asDsp isNull 
]

{ #category : 'tests' }
PhysicalModelTest >> testImpulseExcitationAsDsp [

	self assert: PhImpulseExcitation new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testL2fAsDsp [

	self deny: PhL2f new asDsp isNull 
]

{ #category : 'tests' }
PhysicalModelTest >> testL2sAsDsp [

	self deny: PhL2s new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelTest >> testMarimbaAsDsp [

	self assert: Marimba new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testModeFilterAsDsp [

	self assert: ModeFilter new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testPhBridgeFilterAsDsp [

	self deny: PhBridgeFilter new asDsp isNull 
]

{ #category : 'tests' }
PhysicalModelTest >> testPhGuitarBridgeAsDsp [

	self deny: PhGuitarBridge new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelTest >> testPhGuitarNutsAsDsp [

	self deny:  PhGuitarNuts new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelTest >> testPhWaveguideAsDsp [

	self deny: PhWaveguide new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelTest >> testPluckStringAsDsp [

	self deny: PhPluckString new asDsp isNull 
]

{ #category : 'tests' }
PhysicalModelTest >> testSFFormantModelBPAsDsp [

	self deny: SFFormantModelBP new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelTest >> testSFFormantModelFofCycleAsDsp [

	self deny: SFFormantModelFofCycle new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelTest >> testStrikeAsDsp [

	self deny:  PhStrike new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelTest >> testStrikeModelAsDsp [

	self deny:  PhStrikeModel new asDsp isNull 
]

{ #category : 'tests' }
PhysicalModelTest >> testViolinMIDIAsDsp [

	self assert: ViolinMIDI new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testViolinModelAsDsp [

self assert: ViolinModel  new asDsp isNull equals: false
]
