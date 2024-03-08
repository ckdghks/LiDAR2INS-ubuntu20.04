# install dependencies
apt-get update
apt-get install -y wget
apt-get install -y git
apt-get install -y unzip
apt-get install -y zip
apt-get install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
apt-get install -y software-properties-common
apt-get install -y build-essential
# add-apt-repository 'deb http://archive.ubuntu.com/ubuntu/ trusty main'
# add-apt-repository 'deb http://archive.ubuntu.com/ubuntu/ trusty universe'
# apt install gcc-4.7 g++-4.7 -y
# update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 50
# update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.7 50
apt-get install -y cmake
apt-get install -y libgtk2.0-dev
apt-get install -y pkg-config
apt-get install -y python3-numpy python3-capstone
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
apt-get install -y libjpeg-dev libpng-dev libtiff-dev libjasper-dev
apt-get install -y libflann-dev
apt-get install -y libdc1394-22-dev

apt-get install -y openjdk-8-jdk
apt-get install -y default-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

add-apt-repository 'deb http://security.ubuntu.com/ubuntu xenial-security main'
apt update
apt-get -qq install libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2 libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libv4l-dev python3-capstone python3-numpy libtbb-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils
 
# download opencv-2.4.13
# wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.11/opencv-2.4.13.zip
# unzip opencv-2.4.13.zip
cd opencv-2.4.13
# mkdir release
cd release
 
# compile and install
cmake -G "Unix Makefiles" -DENABLE_PRECOMPILED_HEADERS=OFF -D CMAKE_CXX_COMPILER=/usr/bin/g++ CMAKE_C_COMPILER=/usr/bin/gcc -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=OFF -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D BUILD_FAT_JAVA_LIB=ON -D INSTALL_TO_MANGLED_PATHS=ON -D INSTALL_CREATE_DISTRIB=ON -D INSTALL_TESTS=ON -D ENABLE_FAST_MATH=ON -D WITH_IMAGEIO=ON -D BUILD_SHARED_LIBS=OFF -D WITH_GSTREAMER=ON ..
make all -j4 # 4 cores
make install
 
# ignore libdc1394 error http://stackoverflow.com/questions/12689304/ctypes-error-libdc1394-error-failed-to-initialize-libdc1394
 
# build 시 에러
# https://makejarvis.tistory.com/43 참조.

#python
#> import cv2
#> cv2.SIFT
#<built-in function SIFT>