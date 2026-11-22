"
Superclass for various kind of _excitation_ signal generators.
**Do not use this superclass directly; use one of its subclasses instead**.
All exciters are activated when their trigger signal changes from 0 to a value greater than 0. Their trigger button is labelled <label>Trigger, as Coypu expects (gate / gate: are kept as aliases of trigger / trigger:).
"
Class {
	#name : 'Exciter',
	#superclass : 'PhPmFunction',
	#category : 'Phausto-PhysModels - Exciters',
	#package : 'Phausto',
	#tag : 'PhysModels - Exciters'
}
