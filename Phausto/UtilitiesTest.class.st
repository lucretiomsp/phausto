Class {
	#name : 'UtilitiesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
UtilitiesTest >> testDictionaryAsCmajorEventEndpoint [

	| dict result |
	result := 'input event float32 event_ADSREnvAttack [[ name: "ADSREnvAttack", group: "/v:MyApp/ADSREnvAttack", min: 0.001f, max: 2.0f, init: 0.001f, step: 1.0f ]];'.
	dict := Dictionary new.
	dict
		add: #min -> 0.001;
		add: #step -> 1;
		add: #address -> 'MyApp/ADSREnvAttack';
		add: #shortname -> 'ADSREnvAttack';
		add: #max -> 2;
		add: #type -> 'hslider';
		add: #label -> 'ADSREnvAttack';
		add: #init -> 0.001.
self assert: dict asCmajorEventEndpoint equals: result 
]
