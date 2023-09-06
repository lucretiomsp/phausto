as yet unclassified
stop
" Stop processing audio."
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall: #(void stopDsp (DSP* self))]