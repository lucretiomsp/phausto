Class {
	#name : 'TurboPhaustoTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
TurboPhaustoTest >> testChordyAsBox [

self assert: Chordy new asDsp isNull equals: false
]

{ #category : 'tests' }
TurboPhaustoTest >> testDelayMonoFBAsBox [


self assert: DelayMonoFB new asDsp isNull equals: false
]

{ #category : 'tests' }
TurboPhaustoTest >> testFm2OpAsBox [


self assert: Fm2Op new asDsp isNull equals: false
]

{ #category : 'tests' }
TurboPhaustoTest >> testGreyHoleDWAsBox [

self assert: GreyHoleDW new asDsp isNull equals: false
]

{ #category : 'tests' }
TurboPhaustoTest >> testLoadAllTurboSamplers [

	| allTurboSamplers numOfSamplers|
	allTurboSamplers := TurboPhausto loadAllSamplers.
	numOfSamplers := TurboPhausto turboSamplesFolder asFileReference children select: [ :i | i isDirectory ].
	self
		assert: allTurboSamplers size
		equals: numOfSamplers size.
	
]

{ #category : 'tests' }
TurboPhaustoTest >> testPsgPlusAsBox [


self assert: PsgPlus new asDsp isNull equals: false
]

{ #category : 'tests' }
TurboPhaustoTest >> testTpSamplerAsBox [

| pathToFolder |
pathToFolder:= (FileLocator documents asAbsolute pathString , '/MoofLodSamples') asFileReference.

"check if directory exists first"

self assert: pathToFolder exists equals: true.
self assert: TpSampler new asDsp isNull equals: false
]

{ #category : 'tests' }
TurboPhaustoTest >> testTurboSamplesFolderExists [

	self assert: TurboPhausto samplesFolderExists equals: true
]
