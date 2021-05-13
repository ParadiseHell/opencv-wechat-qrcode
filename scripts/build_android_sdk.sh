#!/bin/sh

echo "Clone opencv"
git clone -b 4.5.2 https://github.com/opencv/opencv.git >/dev/null

echo "Clone opencv_contrib"
git clone -b 4.5.2 https://github.com/opencv/opencv_contrib.git >/dev/null

# 删除 opencv_contrib 不是微信二维码识别的 modules
echo "Remove other modules in opencv_contrib/modules"
cd opencv_contrib/modules
ls | grep -P "^((?!wechat_qrcode).)+$" | xargs -d"\n" rm -fr

# 创建 build 目录进行编译
cd ${GITHUB_WORKSPACE} && mkdir build && cd build

# 编译
python ${GITHUB_WORKSPACE}/opencv/platform/android/build_sdk.py \
	--extra_modules_path=${GITHUB_WORKSPACE}/opencv_contrib/modules/ \
	--no_ccache \
	--build_doc
