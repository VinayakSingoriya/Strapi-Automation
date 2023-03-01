#!/bin/bash

npm install pg
cp config/database.js /home/vinayak/Desktop/strapiApp/my-project/config/database.js
npm install @strapi/provider-upload-aws-s3
cp scripts/plugins.js /home/vinayak/Desktop/strapiApp/my-project/config/plugins.js
git add .
git commit -m 'Installed pg, aws-S3 upload provider and updated the config files'
git push
