Class {
	#name : 'EnvelopesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
EnvelopesTest >> testADSREnvAsDsp [

	self assert: ADSREnv new asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testADSREnvBiasAsDsp [
	"new version of faust libs must be bundled to pass this test"

	self deny: ADSREnvBias new asDsp isNull 
]

{ #category : 'tests' }
EnvelopesTest >> testADSRExpEnvAsDsp [

	self assert: ADSRExpEnv new  asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testADSRFEnvBiasAsDsp [

	self deny: ADSRFEnvBias new asDsp isNull 
]

{ #category : 'tests' }
EnvelopesTest >> testAHDSREnvBiasAsDsp [

	self deny: AHDSREnvBias new asDsp isNull.
	

]

{ #category : 'tests' }
EnvelopesTest >> testAHDSRExpEnvAsDsp [

	self assert: AHDSRExpEnv new  asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testAHDSRFEnvBiasAsDsp [
	
	self deny: AHDSRFEnvBias new asDsp isNull .
	

]

{ #category : 'tests' }
EnvelopesTest >> testAREnvAsDsp [

	self deny: AREnv new asDsp isNull 
]

{ #category : 'tests' }
EnvelopesTest >> testARFEexpEnvAsDsp [

	self assert: ARFExpEnv new asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testASREnvAsDsp [

	self deny: ASREnv new asDsp isNull 
]

{ #category : 'tests' }
EnvelopesTest >> testDx7EnvAsDsp [

	self deny: Dx7Env new asDsp isNull 
]

{ #category : 'tests' }
EnvelopesTest >> testSmoothEnvAsDsp [

	self deny: SmoothEnv new asDsp isNull 
]
