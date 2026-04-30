
##### Custom XDG PATHS #####

#APP
export DOCKER_CONFIG=$CUSTOM_APP_DIR/docker
export MACHINE_STORAGE_PATH=$CUSTOM_APP_DIR/docker/machine
# export GEM_HOME=$CUSTOM_APP_DIR/gem # does not play nice with rbenv
#CACHE
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem_specs
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
#CONFIG
export ADOTDIR=$XDG_CONFIG_HOME/antigen
#export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
#DATA
export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
export _Z_DATA=$XDG_DATA_HOME/z/z
export MINISHIFT_HOME=$XDG_DATA_HOME/minishift
export MINIKUBE_HOME=$XDG_DATA_HOME/minikube
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle/plugin
#RUNTIME - ignored for now
#export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
