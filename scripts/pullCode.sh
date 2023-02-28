#!/bin/bash

echo '>> PULLING STRAPI APP SOURCE CODE .....'
export GIT_USERNAME=VinayakSingoriya
export GIT_PASSWORD=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
git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/VinayakSingoriya/Strapi-Demo-App.git strapiApp
echo '<<   STRAPI APP SOURCE CODE PULLED  >>'

# git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/your_username/your_repo.git
