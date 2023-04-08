#!/bin/bash

echo '>> PULLING STRAPI APP SOURCE CODE .....'
export GIT_USERNAME=VinayakSingoriya
export GIT_PASSWORD=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
git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/VinayakSingoriya/Strapi-Demo-App.git strapiApp
echo '<<   STRAPI APP SOURCE CODE PULLED  >>'
cd ./strapiApp/
npm install
NODE_ENV=production npm run build




# git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/your_username/your_repo.git
