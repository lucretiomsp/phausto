as yet unclassified
createDsp: aFaustCode 

| faustLibraries libArgument  cfunc arguments indexOfArgv |
faustLibraries := FileLocator image asAbsolute parent pathString  , '/faustLibraries'.
libArgument := '-I' , faustLibraries .

"use '-I/path/to/lib' in the argc/argv parameters, so that to locate the place when Faust libraries would be copied."
cfunc := #(DSP* createDsp (const char* 'App',  const char* aFaustCode,  int 0, const char* argv , const char* '', int -1)) asOrderedCollection .
arguments := (cfunc at: 4) asOrderedCollection .
indexOfArgv := arguments indexOf: #argv.
arguments at: indexOfArgv  put: libArgument .
cfunc at: 4 put: arguments .
^ self ffiCall: cfunc asArray.
"^ self ffiCall: #(DSP* createDsp (const char* 'App',  const char* aFaustCode,  int argv, NULL , const char* '', int -1))"