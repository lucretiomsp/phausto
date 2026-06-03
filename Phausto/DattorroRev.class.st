"
Reverberator based on the Dattorro reverb topology. This implementation does not use modulated delay lengths (excursion).

## Parameters:

**pre_delay:** pre-delay in samples (fixed at compile time)
**bw:** band-width filter (pre filtering); (0 - 1)
**i_diff1:**input diffusion factor 1; (0 - 1)
**i_diff2:** input diffusion factor 2;
**decay:** decay rate; (0 - 1); infinite decay = 1.0
**d_diff1:** decay diffusion factor 1; (0 - 1)
**d_diff2:** decay diffusion factor 2;
**damping:** high-frequency damping; no damping = 0.0
"
Class {
	#name : 'DattorroRev',
	#superclass : 'Reverbs',
	#instVars : [
		're_delay',
		'bw',
		'i_diff1',
		'i_diff2',
		'decay',
		'd_diff1',
		'd_diff2',
		'damping'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
DattorroRev >> asBox [ 

^ self re_delay asBox  , self bw asBox , self i_diff1 asBox ,  self i_diff2 asBox ,
 self decay  asBox ,  self d_diff1 asBox ,  self d_diff2 asBox , self damping asBox , self inputL , self inputR connectTo: self code asBox
]

{ #category : 'accessing' }
DattorroRev >> bw [

	^ bw
]

{ #category : 'accessing' }
DattorroRev >> d_diff1 [

	^ d_diff1
]

{ #category : 'accessing' }
DattorroRev >> d_diff2 [

	^ d_diff2
]

{ #category : 'accessing' }
DattorroRev >> damping [

	^ damping
]

{ #category : 'accessing' }
DattorroRev >> decay [

	^ decay
]

{ #category : 'accessing' }
DattorroRev >> i_diff1 [

	^ i_diff1
]

{ #category : 'accessing' }
DattorroRev >> i_diff2 [

	^ i_diff2
]

{ #category : 'initialization' }
DattorroRev >> initialize [ 

super initialize .
processExpression := 'process =  re.dattorro_rev;'.
]

{ #category : 'accessing' }
DattorroRev >> re_delay [

	^ re_delay
]
