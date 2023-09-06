as yet unclassified
stop
" Stop processing audio."
^ self ffiCall: #(void stopDsp (DSP* self))