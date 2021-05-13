#!/bin/sh

#git clone -b 4.5.2 https://github.com/opencv/opencv.git

git clone -b 4.5.2 https://github.com/opencv/opencv_contrib.git

# 删除 opencv_contrib 不是微信二维码识别的 modules
cd opencv_contrib/modules
ls | grep -P "^((?!wechat_qrcode).)+$" | xargs -d"\n" rm -fr
ls

cd ${GITHUB_WORKSPACE}
pwd
