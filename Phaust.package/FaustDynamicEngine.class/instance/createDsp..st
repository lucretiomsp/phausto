as yet unclassified
createDsp: aFaustCode 

| argv func|
argv := FFIArray newType:  'char*' size: 1. 
argv at: 1 put: '-I/librariesBundle/faustLibraries'.
func := #(DSP* createDsp (const char* 'App',  const char* aFaustCode,  int 2, const char*[] '-I/librariesBundle/faustLibraries' , const char* '', int -1)) asOrderedCollection.
(func at: 4) asOrderedCollection  at: 17 put: argv.
^ self ffiCall: func asArray .
"func := #(DSP* createDsp (const char* 'App',  const char* aFaustCode,  int 1, const char* '-I/librariesBundle/faustLibraries' , const char* '', int -1))."
