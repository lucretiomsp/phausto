as yet unclassified
getNumOutputDsp
" Get the number of output ports."
^ FaustDynamicEngine uniqueInstance ffiCall: #( int getNumOutputDsp(DSP* self))