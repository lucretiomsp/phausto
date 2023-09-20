as yet unclassified
getParamMin: anIndex.
" get the minimum of the parameter at anIndex"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(float getParamMinDsp(DSP* self, int anIndex))]