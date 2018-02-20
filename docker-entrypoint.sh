#!/bin/sh
if [[ $1 = build && $2 = deploy ]] ; then
	# build and deploy.
    yarn install && yarn run build && yarn start
elif [[ -n $1 && $1 = build ]] ; then
	# build only.
    yarn install && yarn run build
else
	# deploy only.
    yarn start
fi