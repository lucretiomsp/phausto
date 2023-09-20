as yet unclassified
setValue: aFloat parameter: anIntIndex
"  set the value of the parameter at Index"
self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(void setParamValueDsp(DSP* self, int anIntIndex , float aFloat))]