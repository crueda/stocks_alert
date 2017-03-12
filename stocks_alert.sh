#!/usr/bin/env python
#-*- coding: UTF-8 -*-

# autor: Carlos Rueda
# date: 2017-03-12
# mail: carlos.rueda@deimos-space.com
# version: 1.0

##################################################################################
# version 1.0 release notes:
# Initial version
# Requisites:

# library configobj To install: "apt-get install python-configobj"
#       libary tinyS3 (amazonS3)                To install: "pip install tinys3"
##################################################################################

import time
import sys
import os
import datetime
import logging, logging.handlers
from googlefinance import getQuotes
import json

#### VARIABLES #########################################################
from configobj import ConfigObj
config = ConfigObj('./stocks_alert.properties')

INTERNAL_LOG_FILE = config['directory_logs'] + "/sa.log"
LOG_FOR_ROTATE = 10


########################################################################

#### LOGGER #########################################################
try:
	logger = logging.getLogger('sa')
	loggerHandler = logging.handlers.TimedRotatingFileHandler(INTERNAL_LOG_FILE, 'midnight', 1, backupCount=LOG_FOR_ROTATE)
	formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
	loggerHandler.setFormatter(formatter)
	logger.addHandler(loggerHandler)
	logger.setLevel(logging.DEBUG)
except:
	print '------------------------------------------------------------------'
	print '[ERROR] Error writing log at %s' % INTERNAL_LOG_FILE
	print '[ERROR] Please verify path folder exits and write permissions'
	print '------------------------------------------------------------------'
	exit()
########################################################################

def main():
	 print json.dumps(getQuotes('AAPL'), indent=2)

if __name__ == '__main__':
	main()
	#test()