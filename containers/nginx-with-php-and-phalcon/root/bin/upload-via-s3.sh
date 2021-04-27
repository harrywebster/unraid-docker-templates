#!/bin/bash

aws s3 sync /var/www/html/export/* s3://teach-keyboard-and-mouse/www/ --storage-class STANDARD
aws s3 sync /var/www/html/assets s3://teach-keyboard-and-mouse/www/assets --storage-class STANDARD
