as yet unclassified
getNumOutput
" Get the number of output ports."
^ FaustDynamicEngine uniqueInstance ffiCall: #( int #getNumOutput(DSP* self))