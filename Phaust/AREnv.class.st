"
AR (Attack, Release) envelope generator (useful to create percussion envelopes). 

Usage
ar(at,rt,t) : _
Where:

at: attack (sec)
rt: release (sec)
t: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : #AREnv,
	#superclass : #Envelopes,
	#category : #'Phaust-BoxAPI'
}
