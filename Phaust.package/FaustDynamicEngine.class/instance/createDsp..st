as yet unclassified
createDsp: aFaustCode 

  | func |

func := func := #(DSP* createDsp (const char* 'App',  const char* aFaustCode,  int 0, NULL , const char* '', int -1)).

^ self ffiCall: func asArray .
"func := #(DSP* createDsp (const char* 'App',  const char* aFaustCode,  int 1, const char* '-I/librariesBundle/faustLibraries' , const char* '', int -1))."
