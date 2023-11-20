#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# TODO: change to "v3.15" once that is released
TAG="v3.14.7"
echo "tag=${TAG}"

BASE_URL="https://raw.githubusercontent.com/gsimko/openmaptiles/"
echo "base-url=${BASE_URL}"

echo "Building..."
./mvnw -DskipTests=true package

echo "Running..."
java -cp target/planetiler-openmaptiles-3.14.1-with-deps.jar org.openmaptiles.Generate -tag="${TAG}" -base-url="${BASE_URL}"

echo "Formatting..."
./scripts/format.sh
