accessing
getParamIndex: aString.
" get the index of the parameter with aString name"

^ self getParamIndexWithName: self name, aString.
"self isNull ifTrue: [^ self class invalidException] ifFalse: [  
^ FaustDynamicEngine uniqueInstance  ffiCall:  #(int getParamIndexDsp(DSP* self, const char* aString))]"