Extension { #name : 'Dictionary' }

{ #category : '*Phausto' }
Dictionary >> asCmajorEventEndpoint [

| endpoint |

endpoint := WriteStream on: String new.
endpoint nextPutAll: 'input event float32 event_';
         nextPutAll: (self at: #label);
         nextPutAll: ', group: "/v';
         nextPutAll: (self at: #address );
         nextPutAll: '" , min:';
         nextPutAll: (self at: #min) asFloat asString;
         nextPutAll: 'f, max:';
         nextPutAll: (self at: #max) asFloat asString;
         nextPutAll: 'f, init:';
         nextPutAll: (self at: #init) asFloat asString;
         nextPutAll: 'f, step:';
         nextPutAll: (self at: #step) asFloat asString;
         nextPutAll: 'f ]];'.
	^ endpoint contents
]
