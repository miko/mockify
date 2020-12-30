#!/bin/sh
MOCKIFY_ROUTES=${MOCKIFY_ROUTES:-./config/routes.yaml}
# Should be generated with MOCKIFY_ROUTES_BASE64=`cat config/routes.yaml |base64 --wrap=0`
if [ "x-$MOCKIFY_ROUTES_BASE64" != "x-" ]; then
  echo "Using routes from MOCKIFY_ROUTES_BASE64 as $MOCKIFY_ROUTES"
  echo $MOCKIFY_ROUTES_BASE64 | base64 -d > $MOCKIFY_ROUTES
else
  echo "Not using routes from env"
fi
./mockify
exit $?
