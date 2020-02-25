#!/usr/bin/env sh

set -exu

syncPath='./public/*'

hugo

rsync -avz \
-e "ssh -i $BLOG_PRIVATE_KEY" \
--delete \
--force \
$syncPath \
$BLOG_USER@$BLOG_HOST:$BLOG_ROOT_DIR \
--progress \
--verbose

echo "deployment successful"