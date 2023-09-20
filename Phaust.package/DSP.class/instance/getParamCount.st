as yet unclassified
getParamCount
"  Get the count of parameters in the DSP object"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall: #(int getParamsCountDsp (DSP* self))]