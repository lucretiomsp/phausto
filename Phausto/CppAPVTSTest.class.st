Class {
	#name : 'CppAPVTSTest',
	#superclass : 'TestCase',
	#instVars : [
		'exp',
		'json',
		'controls'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
CppAPVTSTest >> setUp [ 
	super setUp.
	"Fixture: nested groups, a float param with integer bounds, and a button."
	json := '{
"name": "MyApp",
"ui": [
  { "type": "vgroup", "label": "MyApp", "items": [
      { "type": "hgroup", "label": "Reverb", "items": [
          { "type": "hslider", "label": "GreyHole2Damp", "shortname": "GreyHole2Damp",
            "address": "/MyApp/GreyHole2Damp", "init": 0.3, "min": 0, "max": 1, "step": 0.001 } ] },
      { "type": "hslider", "label": "Korg35HPFRes", "shortname": "Korg35HPFRes",
        "address": "/MyApp/Korg35HPFRes", "init": 1, "min": 1, "max": 8, "step": 0.001 },
      { "type": "button", "label": "Gate", "shortname": "Gate",
        "address": "/MyApp/Gate", "init": 0, "min": 0, "max": 1, "step": 1 } ] }
]
}'.
	controls := DSP apvtsControlsFromJSON: json

]

{ #category : 'tests' }
CppAPVTSTest >> testCppFloatFormatsFloats [ 
	self assert: (DSP cppFloat: 0.3) equals: '0.3f'.
	self assert: (DSP cppFloat: 0.001) equals: '0.001f'
]

{ #category : 'tests' }
CppAPVTSTest >> testCppFloatFormatsIntegers [ 
	self assert: (DSP cppFloat: 1) equals: '1.0f'.
	self assert: (DSP cppFloat: 8) equals: '8.0f'.
	self assert: (DSP cppFloat: 0) equals: '0.0f'
]

{ #category : 'tests' }
CppAPVTSTest >> testEveryParamIdMatchesItsShortname [ 
	| push |
	push := DSP apvtsPushBodyFor: controls.
	controls do: [ :c |
		self assert: (push includesSubstring: 'getRawParameterValue ("' , (c at: #shortname) , '")') ]

]

{ #category : 'tests' }
CppAPVTSTest >> testExtractsControlFields [ 
	| damp |
	damp := controls detect: [ :c | (c at: #shortname) = 'GreyHole2Damp' ].
	self assert: (damp at: #type) equals: 'hslider'.
	self assert: (damp at: #address) equals: '/MyApp/GreyHole2Damp'.
	self assert: (damp at: #init) equals: 0.3.
	self assert: (damp at: #min) equals: 0.
	self assert: (damp at: #max) equals: 1.
	self assert: (damp at: #step) equals: 0.001
]

{ #category : 'tests' }
CppAPVTSTest >> testFlattensNestedGroups [ 
	"3 leaves, including GreyHole2Damp two groups deep."
	self assert: controls size equals: 3.
	self assert: (controls anySatisfy: [ :c | (c at: #shortname) = 'GreyHole2Damp' ])
]

{ #category : 'tests' }
CppAPVTSTest >> testLayoutAndPushHaveOneLinePerControl [ 
	| layoutLines pushLines |
	layoutLines := (DSP apvtsLayoutBodyFor: controls) lines select: [ :l | l includesSubstring: 'layout.add' ].
	pushLines := (DSP apvtsPushBodyFor: controls) lines select: [ :l | l includesSubstring: 'setParamValue' ].
	self assert: layoutLines size equals: controls size.
	self assert: pushLines size equals: controls size
]

{ #category : 'tests' }
CppAPVTSTest >> testLayoutEmitsFloatParameter [ 
	self assert: ((DSP apvtsLayoutBodyFor: controls) includesSubstring:
		'std::make_unique<juce::AudioParameterFloat> (juce::ParameterID { "Korg35HPFRes", 1 }, "Korg35HPFRes", juce::NormalisableRange<float> (1.0f, 8.0f, 0.001f), 1.0f)')

]

{ #category : 'tests' }
CppAPVTSTest >> testPushUsesAddressAndId [ 
	self assert: ((DSP apvtsPushBodyFor: controls) includesSubstring:
		'fUI->setParamValue ("/MyApp/GreyHole2Damp", apvts.getRawParameterValue ("GreyHole2Damp")->load())')

]
