#!/bin/bash
BASE_URL="https://api.appcenter.ms"
#
# HEADERS
AUTH_ACCEPT="accept: application/json"
AUTH_TOKEN="X-API-Token: f2cc60064efdf43a5557b63c5bb3d00489228df5"
AUTH_CONTENT_TYPE="Content-Type: application/json"
#
# GET APP DETAIL BY ID
EP_APPS="/v0.1/apps"
APP_ID="45247ba2-4bdd-4faa-8eb8-035aa5b3e7c6"
#
# THIS IS FOR EXAMPLE, GET CURRENT BRANCH FROM GITLAB
CURRENT_BRANCH_NAME=${1}
#CURRENT_BRANCH_NAME="build/automate-app-center"
#
SOURCE_BRANCH="develop"
#
# REVAMP APP NAMES
APP_NAMES=("Revamp-iOS-Flutter-Development"  "Revamp-iOS-Flutter-Production-Test"  "Revamp-iOS-Flutter-Production"  "Revamp-iOS-Flutter-Staging"  "Revamp-Android-Flutter-Development"  "Revamp-Android-Flutter-Production"  "Revamp-Android-Flutter-Staging")
for APP_NAME in ${APP_NAMES[*]}; do
     echo $APP_NAME
     # CHECK IS CURRENT BRANCH ALREADY CONFIGURED
    EP_BRANCHES="/v0.1/apps/Gredu-Asia/$APP_NAME/branches"
    BRANCHES_RESPONSE="$(curl -X GET "$BASE_URL$EP_BRANCHES" -H "$AUTH_ACCEPT"  -H "$AUTH_TOKEN")"
    BRANCH_DATA=$(echo "$BRANCHES_RESPONSE" | jq -c '.[] | select(.branch.name == "'$CURRENT_BRANCH_NAME'")')
    IS_CONFIGURED=$(jq -r '.configured' <<< ${BRANCH_DATA})
    if $IS_CONFIGURED
    then
        echo "$APP_NAME - $CURRENT_BRANCH_NAME ALREADY CONFIGURED"
    else
        EP_SOURCE_CONFIG="/v0.1/apps/Gredu-Asia/{$APP_NAME}/branches/$SOURCE_BRANCH/config"
        SOURCE_CONFIG_RESPONSE="$(curl -X GET "$BASE_URL$EP_SOURCE_CONFIG" -H "$AUTH_ACCEPT"  -H "$AUTH_TOKEN")"
    #
        # DELETE UNUSED ATTRS & ADD REQUIRED ATTRS TO THE BODY
        BODY=$(echo $SOURCE_CONFIG_RESPONSE | jq 'del(.branch)' | jq 'del(.id)' | jq '.cloneFromBranch="'$SOURCE_BRANCH'"')
        echo $BODY
    #
        # ENCODE CURRENT BRANCH NAME >>> MAKE SURE ABT PERL
        ENCODED_BRANCH_NAME=$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$CURRENT_BRANCH_NAME")
        echo $ENCODED_BRANCH_NAME
    #
        # CLONE CONFIG POST REQUEST
        EP_POST_BRANCH_CONFIG="/v0.1/apps/Gredu-Asia/$APP_NAME/branches/$ENCODED_BRANCH_NAME/config"
        POST_RESPONSE="$(curl -X POST "$BASE_URL$EP_POST_BRANCH_CONFIG" -H "$AUTH_ACCEPT" -H "$AUTH_CONTENT_TYPE" -H "$AUTH_TOKEN" -d "$BODY")"
        echo $POST_RESPONSE
        #
        # AUTOMATE BUILD ONLY FOR DEVELOPMENT
        if [[ "$APP_NAME" == *"Development"* ]]; then
          echo "$APP_NAME Building App"
          COMMIT_SHA=${2}
          EP_POST_BUILD_APP="/v0.1/apps/Gredu-Asia/$APP_NAME/branches/$ENCODED_BRANCH_NAME/builds"
          POST_BUILD_BODY="{\"sourceVersion\": \"$COMMIT_SHA\",\"debug\": false}"
          POST_BUILD_RESPONSE="$(curl -X POST "$BASE_URL$EP_POST_BUILD_APP" -H "$AUTH_ACCEPT" -H "$AUTH_CONTENT_TYPE" -H "$AUTH_TOKEN" -d "$POST_BUILD_BODY")"
          echo $POST_BUILD_RESPONSE
        fi
    fi
#
done