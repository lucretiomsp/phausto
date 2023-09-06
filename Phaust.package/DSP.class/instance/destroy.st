as yet unclassified
destroy
"Destory the DSP object"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall: #(void destroyDsp (DSP* self))]