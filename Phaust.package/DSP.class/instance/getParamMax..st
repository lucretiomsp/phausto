as yet unclassified
getParamMax: anIndex.
" get the maximum of the parameter at anIndex"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(float getParamMaxDsp(DSP* self, int anIndex))]