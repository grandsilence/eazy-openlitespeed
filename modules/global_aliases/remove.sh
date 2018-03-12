GLOBAL_ALIASES=/etc/profile.d/00-aliases.sh
GLOBAL_ALIASES_BAK=$GLOBAL_ALIASES'.bak'

if [ -f $GLOBAL_ALIASES ]; then
	rm -f $GLOBAL_ALIASES

	if [ -f $GLOBAL_ALIASES_BAK ]; then
		mv -f $GLOBAL_ALIASES_BAK $GLOBAL_ALIASES
	fi
	
	source $GLOBAL_ALIASES
fi
