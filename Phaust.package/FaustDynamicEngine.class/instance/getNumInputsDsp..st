as yet unclassified
getNumInputsDsp: aDsp
"* @brief Get the number of input ports.
     *
     * @param dsp Pointer to the DSP object.
     * @return The number of input ports.
     */"
^ self ffiCall: #(int getNumInputsDsp(DSPStructure* aDsp))