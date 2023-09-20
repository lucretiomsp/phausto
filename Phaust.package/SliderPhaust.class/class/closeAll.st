instance creation
closeAll

	| fadersInWorld |
	
	fadersInWorld := self  currentWorld submorphs select: [ :i |
		                 i class = FaderWindow  ].
	fadersInWorld do: [ :i | i delete ]