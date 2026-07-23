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
		'pre_delay',
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

	^  self bw asBox , self i_diff1 asBox
	  , self i_diff2 asBox , self decay asBox , self d_diff1 asBox
	  , self d_diff2 asBox , self damping asBox , self inputL
	  , self inputR connectTo: self code asBox
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
DattorroRev >> decay: aNumberOrABoxOrASymbol [
<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
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

	super initialize.
	processExpression := 'process =  re.dattorro_rev(0.1);'.
	"pre_delay: pre-delay in samples (fixed at compile time)"
	bw := PhHSlider new
		      label: self label , 'Bw'
		      values: #( 0.3 0 1 0.01 ).
	i_diff1 := PhHSlider new
		           label: self label , 'IDiff1'
		           values: #( 0.4 0 1 0.01 ).
	i_diff2 := PhHSlider new
		           label: self label , 'IDiff2'
		           values: #( 0.6 0 1 0.01 ).
	decay := PhHSlider new
		         label: self label , 'Decay'
		         values: #( 0.35 0 1 0.01 ).
	d_diff1 := PhHSlider new
		           label: self label , 'DDiff1'
		           values: #( 0.37 0 1 0.01 ).
	d_diff2 := PhHSlider new
		           label: self label , 'DDiff2'
		           values: #( 0.54 0 1 0.01 ).
	damping := PhHSlider new
		           label: self label , 'Damping'
		           values: #( 0.44 0 1 0.01 )
]

{ #category : 'connecting' }
DattorroRev >> patchedWith: aUnitGenerator [

	self inputL: aUnitGenerator asBox.
	self inputR: aUnitGenerator asBox
]

{ #category : 'accessing' }
DattorroRev >> pre_delay [

	^ pre_delay
]

{ #category : 'accessing' }
DattorroRev >> pre_delay: aNumber [

	processExpression := 'process =  re.dattorro_rev' , '(' , aNumber  asString , ');'.
]
