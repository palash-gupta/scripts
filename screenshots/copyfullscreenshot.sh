#!/bin/bash

maim | tee >(xclip -selection clipboard -t image/png) >/tmp/screenshots/$(date +%Y-%m-%d_%H%M%S)_tmp.png
