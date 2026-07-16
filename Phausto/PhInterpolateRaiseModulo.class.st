"
A PhRaiseModulo is a looping fractional read-index generator, ported from Faust's 
`raise_modulo` in interpolators.lib. It produces a monotonically rising read index 
that wraps back to 0 at `length`, driving sample playback for a looping sampler.


## Parameter
**trig:**   trigger. Normally held (loops forever). A rising edge resets the index 
          to 0 (restart from the top). Before the first trigger the index is 
          frozen at 0.
**step:**   samples advanced per output sample. step = speed * fileRate / engineRate.
          step = 1.0 plays at natural pitch; 2.0 = octave up; 0.5 = half speed.
**length:** loop length in frames. The index wraps (fmod) at this value.

## Outputs
Two signals, (id, dv), together representing one fractional index (position = id + dv):
- id: integer sample index, wrapped at `length`. This is what feeds a non-
      interpolating soundfile read.
- dv: fractional part in [0,1). Used for inter-sample interpolation; ignore it 
      for plain integer-index playback.

### Responsibility
Each audio sample it advances the read position by `step` and wraps it modulo 
`length`, yielding the position at which a soundfile/table should be read. This is 
the mechanism behind Faust's `loop_speed`.


"
Class {
	#name : 'PhInterpolateRaiseModulo',
	#superclass : 'UnitGenerator',
	#traits : 'PhInterpSetter',
	#classTraits : 'PhInterpSetter classTrait',
	#instVars : [
		'trig',
		'step',
		'length'
	],
	#category : 'Phausto-Interpolators',
	#package : 'Phausto',
	#tag : 'Interpolators'
}

{ #category : 'initialization' }
PhInterpolateRaiseModulo >> asBox [ 


^ self trig asBox , self step asBox , self length asBox connectTo: self code asBox.
]

{ #category : 'initialization' }
PhInterpolateRaiseModulo >> initialize [

	super initialize.
	trig := 1 asConst.
    step := 0.001 asConst.
  length := 1000 asConst.
 
	processExpression := 'process = it.raise_modulo;'
]

{ #category : 'accessing' }
PhInterpolateRaiseModulo >> length [ 

^ length 
]

{ #category : 'accessing' }
PhInterpolateRaiseModulo >> step [ 
^ step
]

{ #category : 'accessing' }
PhInterpolateRaiseModulo >> trig [ 
^ trig
]
