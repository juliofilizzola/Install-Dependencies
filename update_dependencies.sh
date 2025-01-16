#!/bin/bash

sudo apt update --fix-missing && sudo apt full-upgrade && sudo snap refresh &&  omz update && sudo apt autoremove && sudo apt autoclean
