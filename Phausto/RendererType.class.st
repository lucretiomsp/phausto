"
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
"
Class {
	#name : #RendererType,
	#superclass : #FFIEnumeration,
	#classVars : [
		'kAlsaRenderer',
		'kAndroidRenderer',
		'kCoreAudioRenderer',
		'kJackRenderer',
		'kPortAudioRenderer',
		'kRtAudioRenderer',
		'kiOSRenderer'
	],
	#category : #'Phausto-RendererType'
}

{ #category : #'enum declaration' }
RendererType class >> enumDecl [ 
^     #(
        kPortAudioRenderer 0
        kRtAudioRenderer 1
        kJackRenderer 2
        kCoreAudioRenderer 3
        kiOSRenderer 4
        kAlsaRenderer 5
        kAndroidRenderer  6
    )
]
