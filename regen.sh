#!/bin/sh 

git submodule init
git submodule update

MODULES="bitcore-lib bitcore-message codecoind-rpc insight-api insight-ui"

for submodule in $MODULES; do
	echo "NPM linking module: $submodule"
	(cd $submodule && npm link)
	npm link $submodule
done

# on other straggler
(cd insight-api && npm link bitcore-lib)

echo "linking ~/.bitcore/bitcore-node.json"
ln -sf bitcore-node.sample.json bitcore-node.json
