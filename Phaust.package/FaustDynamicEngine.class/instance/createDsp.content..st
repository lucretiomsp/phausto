as yet unclassified
createDsp: anAppName content: aFaustCode 
^ self ffiCall: #(DSP* createDsp (const char* anAppName,  const char* aFaustCode,  int 0, NULL, const char* '', int -1))