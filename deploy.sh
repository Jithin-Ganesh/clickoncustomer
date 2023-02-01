#!/bin/sh

eligible=false

# shellcheck disable=SC2039
if [[ $1 == "dev" || $1 == "prod" ]]
then
  eligible=true
fi

# shellcheck disable=SC2039
if [[ $eligible == false ]]
  then
    echo "Invalid arguments: try dev or prod"
    exit 0
fi

filename="lib/main.dart"
bucket="s3://www.clickonoffers.com/"

# shellcheck disable=SC2039
if [[ $1 == "dev" ]]
 then
   filename="lib/main-dev.dart"
   bucket="s3://dev.clickonoffers.com/"
fi

echo "Building flutter project in $1"

flutter clean
flutter build web -t "$filename"


#copy files to aws s3
aws s3 cp build/web "$bucket" --recursive --profile clickon

