Class {
	#name : 'PhysicalModelTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhysicalModelTest >> testBlowerAsDsp [

	self assert: Blower new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testBlowerUIAsDsp [

	self assert: Blower_UI new asDsp isNull equals: false
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

	self assert: F2l new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testFrenchBellAsDsp [

self assert: FrenchBell  new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testGuitarAsDsp [

	self assert: Guitar new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testImpulseExcitationAsDsp [

	self assert: ImpulseExcitation new asDsp isNull equals: false
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
PhysicalModelTest >> testPluckStringAsDsp [

	self assert: PluckString new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testStrikeAsDsp [

	self assert: Strike new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testStrikeModelAsDsp [

	self assert: StrikeModel new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testViolinMIDIAsDsp [

	self assert: ViolinMIDI new asDsp isNull equals: false
]

{ #category : 'tests' }
PhysicalModelTest >> testViolinModelAsDsp [

self assert: ViolinModel  new asDsp isNull equals: false
]
