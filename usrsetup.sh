#!/bin/bash

CURRDIR=`dirname $0`
cd $CURRDIR

ABS=`pwd`

ln -sf $ABS/zshrc ~/.zshrc
