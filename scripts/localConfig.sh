#!/bin/bash

cd /home/vinayak/Desktop/strapiApp/
npm install pg
cp /home/vinayak/Desktop/strapi_automation/terraform_dir/config/database.js /home/vinayak/Desktop/strapiApp/config/database.js
npm install @strapi/provider-upload-aws-s3
cp /home/vinayak/Desktop/strapi_automation/terraform_dir/config/plugins.js /home/vinayak/Desktop/strapiApp/config/plugins.js
git add .
git commit -m 'Installed pg, aws-S3 upload provider and updated the config files'
git push
