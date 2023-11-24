as yet unclassified
createDsp: aFaustCode arguments: argv

  ^ self ffiCall: #(DSP* createDsp (const char* 'app',  const char* aFaustCode,  int 2, void * argv  , const char* '', int -1))