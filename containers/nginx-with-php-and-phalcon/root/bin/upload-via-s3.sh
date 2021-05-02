#!/bin/bash

aws s3 sync /var/www/html/export/ s3://teach-keyboard-and-mouse/www/ --storage-class STANDARD
aws s3 sync /var/www/html/assets s3://teach-keyboard-and-mouse/www/assets --storage-class STANDARD
aws s3 cp /var/www/html/sitemap.xml s3://teach-keyboard-and-mouse/www/sitemap.xml --storage-class STANDARD
