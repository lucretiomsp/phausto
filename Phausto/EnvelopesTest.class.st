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
	"real test charashes image, apparently for no good reason - somethig wrong in the Faaust library??"
	"does not crash if Pharo runs from lldb !!!!!"

	self assert: true equals: false

	"self assert: ADSREnvBias new asDsp isNull equals: false"
]

{ #category : 'tests' }
EnvelopesTest >> testADSRExpEnvAsDsp [

	self assert: ADSRExpEnv new  asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testADSRFEnvBiasAsDsp [
	"real test charashes image, apparently for no good reason - somethig wrong in the Faaust library??"
"does not crash if Pharo runs from lldb !!!!!"
	self assert: true equals: false
	"self assert: ADSRFEnvBias new asDsp isNull equals: false"
]

{ #category : 'tests' }
EnvelopesTest >> testAHDSREnvBiasAsDsp [
	"real test charashes image, apparently for no good reason - somethig wrong in the Faaust library??"
"does not crash if Pharo runs from lldb !!!!!"
	self assert: true equals: false
	"self assert: AHDSREnvBias new asDsp isNull equals: false"
]

{ #category : 'tests' }
EnvelopesTest >> testAHDSRExpEnvAsDsp [

	self assert: AHDSRExpEnv new  asDsp isNull equals: false
]

{ #category : 'tests' }
EnvelopesTest >> testAHDSRFEnvBiasAsDsp [
	"real test charashes image, apparently for no good reason - somethig wrong in the Faaust library??"
"does not crash if Pharo runs from lldb !!!!!"
	self assert: true equals: false
	"	self assert: AHDSRFEnvBias new asDsp isNull equals: false"
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
EnvelopesTest >> testDx7EnvAsDsp [
	"real test charashes image, apparently for no good reason - somethig wrong in the Faaust library??"
"does not crash if Pharo runs from lldb !!!!!"
	self assert: true equals: false
	"self assert: Dx7Env new asDsp isNull equals: false"
]

{ #category : 'tests' }
EnvelopesTest >> testSmoothEnvAsDsp [

	self assert: SmoothEnv new asDsp isNull equals: false
]
