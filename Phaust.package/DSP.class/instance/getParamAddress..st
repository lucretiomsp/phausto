as yet unclassified
getParamAddress: anIntegerAddress

^ FaustDynamicEngine  uniqueInstance ffiCall: #( char* getParamAddressDsp(DSP* self, int anIntegerAddress ))