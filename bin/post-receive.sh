#!/bin/bash


# Project configuration
PROJECT_NAME="EPMO"
ROOT="/home/users/epmo_user/html/epmo-drupal"
PROJECT_PATH="${ROOT}/app"
GIT_PATH="${ROOT}/deploy.git"
ENV="staging"
ENV_URL="https://site25.inconito-prv-cse01.nfrance.net/"


# Slack
SLACK_CHANNEL="general"
SLACK_HOOK="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"


# Start deploy
echo -e "\e[32mStarting Deploy ${PROJECT_NAME} ...\e[0m"


# Code update
while read oldrev newrev ref
do
    BRANCH=`echo $ref | cut -d/ -f3`
    git --work-tree=${PROJECT_PATH} --git-dir=${GIT_PATH} checkout -f $BRANCH > /dev/null 2>&1
done

echo -e "\e[32m> Code updated with branch ${BRANCH}\e[0m"


# Run build
${PROJECT_PATH}/bin/build.sh [staging|prod]


# Slack notification
#curl -X POST --data-urlencode 'payload={"channel": "#'$SLACK_CHANNEL'", "username": "monkey-bot", "text": "EPMO: New deploy on '$ENV'.", "icon_emoji": ":monkey_face:", "attachments":[{"color":"#088A08","fields":[{"title":"Notes","value":"Deploy status: OK \n Environment: '$ENV' \n URL: <'$ENV_URL'>","short":false}]}]}' $SLACK_HOOK > /dev/null 2>&1

# End deploy
echo -e "\e[32mDeploy finished!\e[0m\e[0m"
