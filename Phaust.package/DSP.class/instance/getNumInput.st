as yet unclassified
getNumInput
" Get the number of input ports."
^ FaustDynamicEngine uniqueInstance ffiCall: #( int getNumInputsDsp(DSP* self))