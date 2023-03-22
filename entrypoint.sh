#!/bin/bash

set -x 

print "File of env vatiables of system"
printenv

print "Watch the workspace: $(pwd)"

if [[ $ENV = 'production' ]] ;
then
    npm run start
else
    npm run start:test