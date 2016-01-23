#!/bin/bash
#
# Example shell script for sending a message into sevabot
#
# Give command line parameters [chat id] and [message].
# The message is md5 signed with a shared secret specified in settings.py
# Then we use curl do to the request to sevabot HTTP interface.
#
#

source /usr/local/rvm/scripts/rvm
SCRIPT_DIR=$(cd $(dirname $(readlink $0 || echo $0));pwd)
C_TIME=$(date)
echo $C_TIME "script excute" >> ${SCRIPT_DIR}/../logs/skype.log
ruby ${SCRIPT_DIR}/send_message.rb $@ >> ${SCRIPT_DIR}/../logs/skype.log
