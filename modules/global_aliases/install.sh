GLOBAL_ALIASES=/etc/profile.d/00-aliases.sh
if [ -f $GLOBAL_ALIASES ]; then
	mv -f $GLOBAL_ALIASES $GLOBAL_ALIASES'.bak'
fi

# cp -rf aliases.sh $GLOBAL_ALIASES
chmod a+rx _aliases.sh 
ln -s _aliases.sh $GLOBAL_ALIASES
chmod a+rx $GLOBAL_ALIASES

source $GLOBAL_ALIASES
