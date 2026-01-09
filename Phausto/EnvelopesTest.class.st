Class {
	#name : 'EnvelopesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
EnvelopesTest >> TODOtestADSREnvBiasAsDsp [
	"new version of faust libs must be bundled to pass this test"

	self deny: ADSREnvBias new asDsp isNull 
]

{ #category : 'tests' }
EnvelopesTest >> TODOtestADSRFEnvBiasAsDsp [

	self assert: ADSRFEnvBias new asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> TODOtestAHDSREnvBiasAsDsp [
"new version of faust libs must be bundled to pass this test"

	self assert: AHDSREnvBias new asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> TODOtestAHDSRFEnvBiasAsDsp [
"new version of faust libs must be bundled to pass this test"

		self assert: AHDSRFEnvBias new asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testADSREnvAsDsp [

	self assert: ADSREnv new asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testADSRExpEnvAsDsp [

	self assert: ADSRExpEnv new  asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testAHDSRExpEnvAsDsp [

	self assert: AHDSRExpEnv new  asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testAREnvAsDsp [

	self assert: AREnv new asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testARFEexpEnvAsDsp [

	self assert: ARFExpEnv new asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testASREnvAsDsp [

	self assert: ASREnv new  asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testSmoothEnvAsDsp [

	self assert: SmoothEnv new asDsp isNull equals: false
]
