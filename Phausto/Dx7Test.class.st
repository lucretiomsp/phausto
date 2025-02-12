Class {
	#name : 'Dx7Test',
	#superclass : 'TestCase',
	#instVars : [
		'dx7'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
Dx7Test >> setUp [
	super setUp.

	dx7 := Dx7Algo new
]

{ #category : 'tests' }
Dx7Test >> testDx7AlgoNumber [


	self assert: dx7 algoNumber asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7EgLevels1 [

	self assert: dx7 egLevels1 size equals: 6.
	self assert: dx7 egLevels1  asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7EgLevels2 [

	self assert: dx7 egLevels2 size equals: 6.
	self assert: dx7 egLevels2  asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7EgLevels3 [

	self assert: dx7 egLevels3 size equals: 6.
	self assert: dx7 egLevels3  asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7EgLevels4 [

	self assert: dx7 egLevels4 size equals: 6.
	self assert: dx7 egLevels4  asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7EgRates1 [

	self assert: dx7 egRates1 size equals: 6.
	self assert: dx7 egRates1 asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7EgRates2 [

	self assert: dx7 egRates2 size equals: 6.
	self assert: dx7 egRates2 asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7EgRates3 [

	self assert: dx7 egRates3 size equals: 6.
	self assert: dx7 egRates3 asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7EgRates4 [

	self assert: dx7 egRates4 size equals: 6.
	self assert: dx7 egRates4 asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7Feedback [

	self assert: dx7 feedback asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7Freq [

	
	self assert: dx7 freq asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7Gain [

	
	self assert: dx7 gain asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7Gate [

	
	self assert: dx7 gate asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7KeyAmpModeSensitivieties [

   self assert: dx7 ampModSensitivities size equals: 6.
	self assert: dx7 ampModSensitivities asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7KeyVelocities [

self assert: dx7 keyVelocities size equals: 6.
	self assert: dx7 keyVelocities asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7LFODelay [

	self assert: dx7 lfoDelay  asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7LFOSpeed [

	
	self assert: dx7 lfoSpeed asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7OpDetunes [

	self assert: dx7 opDetunes size equals: 6.
	self assert: dx7 opDetunes  asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7OpFrequencies [

	self assert: dx7 opFrequencies size equals: 6.
	self assert: dx7 opFrequencies asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDx7OpModes [

	self assert: dx7 opModes size equals: 6.
	self assert: dx7 opModes  asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDxOPDetunes [

	self assert: dx7 opDetunes size equals: 6.
	self assert: dx7 opDetunes asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDxOpRateScales [

	self assert: dx7 opRateScales size equals: 6.
	self assert: dx7 opRateScales asBox isNull equals: false
]

{ #category : 'tests' }
Dx7Test >> testDxOutLevels [

	self assert: dx7 outLevels size equals: 6.
	self assert: dx7 outLevels asBox isNull equals: false
]
