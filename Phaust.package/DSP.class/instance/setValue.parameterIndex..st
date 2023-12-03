as yet unclassified
setValue: aFloat parameterIndex: anInteger
"  set the value of the parameter with index anInteger"
.
self isNull ifTrue: [^ self class invalidException] ifFalse: [  

^ FaustDynamicEngine uniqueInstance  ffiCall:  #(void setParamValueDsp(DSP* self, int anInteger, float aFloat))]