#!/bin/bash

TELEGRAM_CLI_PATH="/path/to/telegram-cli"

echo "请输入手机号码："
read -r PHONE_NUMBER

"$TELEGRAM_CLI_PATH" -W -e "auth send_code $PHONE_NUMBER"

echo "请输入验证码："
read -r PHONE_CODE

echo "请输入两步验证码（如果未开启，请直接回车）："
read -r TWO_STEP_CODE

CMD="auth login $PHONE_NUMBER $PHONE_CODE"
if [ -n "$TWO_STEP_CODE" ]; then
  CMD+=" $TWO_STEP_CODE"
fi
"$TELEGRAM_CLI_PATH" -W -e "$CMD"

while true; do
  echo "我是傻逼" | "$TELEGRAM_CLI_PATH" -W -e "msg $PHONE_NUMBER"

  sleep 5
done
