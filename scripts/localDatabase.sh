#!/bin/bash

npm install pg
cp config/database.js /home/vinayak/Desktop/strapiApp/my-project/config/database.js
npm install @strapi/provider-upload-aws-s3
cp scripts/plugins.js /home/vinayak/Desktop/strapiApp/my-project/config/plugins.js

