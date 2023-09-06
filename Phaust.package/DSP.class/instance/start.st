as yet unclassified
start
" Start processing audio."
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance ffiCall: #(bool startDsp (DSP* self))]