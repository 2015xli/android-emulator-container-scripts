#!/bin/sh
# Copyright 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
if [ "${BASH_SOURCE-}" = "$0" ]; then
    echo "You must source this script: \$ source $0" >&2
    echo "It will create a virtual environment in which emu-docker will be installed."
    exit 33
fi

if [ ! -f "./venv/bin/activate" ]; then
  which virtualenv || { echo "This script relies on virtualenv, you can install it with 'pip install virtualenv' (https://virtualenv.pypa.io)"; return ; }
  virtualenv venv
fi

source ./venv/bin/activate
python setup.py develop

echo "Ready to run emu-docker!"