Class {
	#name : 'PhPluginIdentityTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhPluginIdentityTest >> testBundleIdentifier [

	self
		assert: (PhPluginIdentity productName: 'Squid Verb') bundleIdentifier
		equals: 'com.phausto.squidverb'
]

{ #category : 'tests' }
PhPluginIdentityTest >> testCMakeJuceAddPluginUsesIdentity [

	| section |
	section := DSP new
		cmakeJuceAddPluginFor: (PhPluginIdentity productName: 'Zitello')
		type: 'Effect'.
	self assert: (section includesSubstring: 'PLUGIN_CODE Zite').
	self assert: (section includesSubstring: 'BUNDLE_ID com.phausto.zitello').
	self deny: (section includesSubstring: 'Fplu')
]

{ #category : 'tests' }
PhPluginIdentityTest >> testPluginCode [

	self assert: (PhPluginIdentity productName: 'Zitello') pluginCode equals: 'Zite'
]

{ #category : 'tests' }
PhPluginIdentityTest >> testPluginCodePadsShortNames [

	self assert: (PhPluginIdentity productName: 'Fx') pluginCode equals: 'Fxxx'
]

{ #category : 'tests' }
PhPluginIdentityTest >> testTargetNameDropsSpaces [

	self assert: (PhPluginIdentity productName: 'Squid Verb') targetName equals: 'SquidVerb'
]
