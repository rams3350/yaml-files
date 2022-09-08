#!/bin/bash

major=1.0
minor=16
fix=3
version=$major.$minor.$fix

git tag $version || echo"$version"
git push origin $version || echo "tag created"

git config --global credential.helper cache

# Get new tags from remote
git fetch --tags

echo "fetching succesful"

# Get latest tag name
latestTag=$(git tag | sort -r --version-sort | head -n1)

tag=$(echo $latestTag | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')

# Checkout latest
#echo $tag


if [ $version = $latestTag ];
then
echo "same as previous version "
else
git tag $tag || echo"$tag"
git push origin $tag || echo "tag created"
echo

echo $tag
fi
       
