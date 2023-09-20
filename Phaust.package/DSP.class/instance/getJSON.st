as yet unclassified
getJSON
" Retrieve JSON description of the UI"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall: #(const char* getJSONDsp (DSP* self))]