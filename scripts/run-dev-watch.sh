#!/usr/bin/env bash

ln -sv /nm/node_modules /code/
cd /code
npm run build-ts
npm run watch
