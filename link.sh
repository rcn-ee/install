#!/bin/bash -e
#=======================================================================#
#========================================================================#
#==  This is a very simple version of install.sh script.                ==#
#==  It tries to find installed versions of cloud9 dependencies         ==#
#==  and link them to ~/.c9 folder,                                     ==#
#==  which can be useful for resource constrained systems               ==#
# =                                                                     = #
#==   @for basic editing                                                ==#
#==      - node >= 0.10                                                 ==#
#==      - nak (find in files)                                          ==#
# =                                                                     = #
#==   @for the terminal                                                 ==#
#==      - npm                                                          ==#
#==      - tmux >= 1.8                                                  ==#
#==      - pty.js                                                       ==#
# =                                                                     = #
#==   @for collaboration (open the IDE with `?collab=0` to skip this)   ==#
#==      - sqlite3                                                      ==#
#==      - sequelize@2.0.0-beta.0                                       ==#
# =                                                                     = #
 #========================================================================#
  #=======================================================================#

#==========================================#
#================= script =================#

C9_DIR="$HOME/.c9";
mkdir -p "$C9_DIR";
cd "$C9_DIR";

# link node
mkdir -p node/bin
pushd node/bin
ln -s "`which node`" node; 
ln -s "`which npm`" npm ;
popd

# link tmux
mkdir -p bin
pushd bin
ln -s "`which tmux`" tmux
popd

# install required node modules
mkdir -p node_modules
npm i pty.js
npm i sqlite3 sequelize@2.0.0-beta.0

npm i https://github.com/c9/nak/tarball/c9

# let cloud9 know that evertyhing is installed
echo 1 > installed

