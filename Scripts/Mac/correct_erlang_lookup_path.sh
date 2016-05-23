#!/bin/bash

# https://gist.github.com/binarytemple/ef1830f3f7ce2fcdbda2cf9aa781b68f

SOURCE=/tmp/int.erl
COMPILED=/tmp/int.beam

test -e $SOURCE || curl https://raw.githubusercontent.com/josevalim/otp/c7e82c6b406b632a191c791a1bd2162bde08f692/lib/debugger/src/int.erl > $SOURCE
erlc -o ${COMPILED%int.beam} $SOURCE
chmod 444 $COMPILED
chgrp admin $COMPILED

ERLANG_PATH=$(perl -MCwd -le 'print Cwd::abs_path(shift)' `which erlc`)
PATCH_TARGET=$(find $(echo $ERLANG_PATH | sed -n '/erlang\/18/{s_bin/erlc__;p;}') | grep "/int.beam")

echo "I'm going to patch $PATCH_TARGET, continue? type yes or no..."
read RESPONSE

if [ $RESPONSE == "yes" ]
  then echo "patching.. "
  mv -v $COMPILED $PATCH_TARGET
fi
