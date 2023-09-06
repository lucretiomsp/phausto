Renderer types for different platforms.
From the dynamic-engine.h

  enum RendererType {
        kPortAudioRenderer,   ///< PortAudio
        kRtAudioRenderer,     ///< RtAudio
        kJackRenderer,        ///< JACK Audio Connection Kit
        kCoreAudioRenderer,   ///< Apple Core Audio
        kiOSRenderer,         ///< iOS Audio
        kAlsaRenderer,        ///< Advanced Linux Sound Architecture
        kAndroidRenderer      ///< Android Audio
    };