as yet unclassified
init
 "
     * @brief Initialize the DSP object.
     *
     * @param dsp Pointer to the DSP object.
     * @param renderer Renderer type !!!! for test we use only portAudio.
     * @param sr Sample rate in Hz. Not used when kJackRenderer is used, since sr will be imposed by the JACK server !!!! just for thet sr is fixed to 44100.
     * @param bsize Buffer size in samples. Not used when kJackRenderer is used, since bs will be imposed by the JACK server - !!! we test it with 512 samples buffer size.
     * @return True if initialization is successful, false otherwise.
 "
^ FaustDynamicEngine uniqueInstance ffiCall: #(  bool #init(DSP* self, RendererType 0 , int 44100, int 512))
    