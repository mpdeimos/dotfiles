# Variables

export EDITOR=nano
export DIFFPROG=meld
export SVN_MERGE="$HOME/.bin/svn-merge"


# User Paths

export PATH="$HOME/.bin:$PATH"


# Ruby

if [ -x "$(command -v ruby)" ]
then
	export GEM_HOME=~/.gem
	export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
fi


# NodeJS

export PATH="$PATH:$HOME/.node_modules/bin"
export npm_config_prefix=~/.node_modules


# .net

export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ROOT=/usr/share/dotnet
if [ -d "$DOTNET_ROOT" ]
then
	export MSBuildSDKsPath=$( echo $DOTNET_ROOT/sdk/3.*/Sdks );
fi
export PATH="$PATH:$HOME/.dotnet/tools"
