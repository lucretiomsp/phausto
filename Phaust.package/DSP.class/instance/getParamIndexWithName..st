accessing
getParamIndexWithName: aString.
" get the index of the parameter with aString name"

self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(int getParamIndexDsp(DSP* self, const char* aString))]