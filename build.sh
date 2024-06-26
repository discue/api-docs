#!/bin/bash

set -exu

export NODE_ENV=production

# replace duplicate footer tag
sed -i 's/<footer/<div/g' ./node_modules/@vuepress/theme-default/lib/client/components/PageMeta.vue
sed -i 's/<\/footer>/<\/div>/g' ./node_modules/@vuepress/theme-default/lib/client/components/PageMeta.vue

npm run docs:build