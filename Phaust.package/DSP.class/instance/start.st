as yet unclassified
start
" Start processing audio."
^ FaustDynamicEngine uniqueInstance ffiCall: #(bool startDsp (DSP* self))