as yet unclassified
createDsp: aFaustCode 
^ self ffiCall: #(DSP* createDsp (const char* 'App1',  const char* aFaustCode,  int 0, NULL, const char* '', int -1))