#!/bin/bash

docker run -it -v /home/brent/.gitconfig:/home/brent/.gitconfig \
-v /home/brent/.ssh:/home/brent/.ssh  \
-v /ram:/ram \
-v /log:/log \
-v /nas/code:/home/brent/code \
-v /nas:/nas energyvault462/rvm
#-v $PWD:/docker \



