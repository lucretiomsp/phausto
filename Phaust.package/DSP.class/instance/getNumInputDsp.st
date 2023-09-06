as yet unclassified
getNumInputDsp
" Get the number of input ports."
^ FaustDynamicEngine uniqueInstance ffiCall: #( int getNumInputsDsp(DSP* self))