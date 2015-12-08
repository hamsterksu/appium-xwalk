FROM davidbaena/appium

MAINTAINER gdubina@dataart.com

RUN mkdir -p /opt/xwalkdriver
COPY files/xwalkdriver64_xwalk_15 /opt/xwalkdriver
COPY files/appium-pathces/android.js.patch /tmp/android.js.patch
COPY files/appium-pathces/android-hybrid.js.patch /tmp/android-hybrid.js.patch

RUN chmod +x /opt/xwalkdriver/xwalkdriver64_xwalk_15
RUN patch /home/jenkins/.local/lib/node_modules/appium/lib/devices/android/android.js < /tmp/android.js.patch
RUN patch /home/jenkins/.local/lib/node_modules/appium/lib/devices/android/android-hybrid.js < /tmp/android-hybrid.js.patch

ENV appium_args "-p 4723 --chromedriver-executable=/opt/xwalkdriver/xwalkdriver64_xwalk_15"