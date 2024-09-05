Extension { #name : 'Dictionary' }

{ #category : '*Phausto' }
Dictionary >> asCmajorEventEndpoint [

	| endpoint |
	endpoint := WriteStream on: String new.
	endpoint
		nextPutAll: 'input event float32 event_';
		nextPutAll: (self at: #label);
		nextPutAll: ' [[ name: "';
		nextPutAll: (self at: #label);
		nextPutAll: '", group: "/v:';
		nextPutAll: (self at: #address) allButFirst .

	(self at: #type) = 'button'
		ifTrue: [
			endpoint
				nextPutAll: '", text: "';
				nextPutAll: (self at: #label);
				nextPutAll: '", boolean ]];' ]
		ifFalse: [
			endpoint
				nextPutAll: '", min: ';
				nextPutAll: (self at: #min) asFloat asString;
				nextPutAll: 'f, max: ';
				nextPutAll: (self at: #max) asFloat asString;
				nextPutAll: 'f, init: ';
				nextPutAll: (self at: #init) asFloat asString;
				nextPutAll: 'f, step: ';
				nextPutAll: (self at: #step) asFloat asString;
				nextPutAll: 'f ]];' ].

	^ endpoint contents
]

{ #category : '*Phausto' }
Dictionary >> asCmajorListOfUIEndpoints [

| output  |

"we remove the MIDI event endpoints, that does not have a UI element in the Cmajor patch"
self removeKey: #gate ifAbsent: [ ]; removeKey: #freq ifAbsent: [ ] ; removeKey: #gain ifAbsent: [ ]. 


output := WriteStream on: String new.
self keysAndValuesDo: [ :k :v | output nextPutAll: v asCmajorEventEndpoint ].


	^ output contents
]

{ #category : '*Phausto' }
Dictionary >> asCmajorPolyWrapper [

	| output |
	output := WriteStream on: String new.

	output
		nextPutAll: 'graph Synth [[ main ]]';
		cr;
		nextPutAll: '{';
		cr;
		nextPutAll:
			'    input event std::midi::Message midiIn [[ name: "MIDI input" ]];';
	   nextPutAll:  self asCmajorListOfUIEndpoints .

	^ output contents
]

{ #category : '*Phausto' }
Dictionary >> contentsForMember: asCmajorListOfUIEndpoints [

| output  |

"we remove the MIDI event endpoints, that does not have a UI element in the Cmajor patch"
self removeKey: #gate ifAbsent: [ ]; removeKey: #freq ifAbsent: [ ] ; removeKey: #gain ifAbsent: [ ]. 


output := WriteStream on: String new.
self keysAndValuesDo: [ :k :v | output nextPutAll: v asCmajorEventEndpoint ; cr].


	^ output contents
]
