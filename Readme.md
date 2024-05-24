# 빌드 순서
## 
    1. 제공된 도커 이미지와 LiDAR2INS 소스코들 이용해 빌드 시도 할 것.
    2. 1번 과정에서 실패 시, opencv-2.4.13, boost-1.72.0, eigen-3.3.7, pcl-1.9.1, Pangolin, jsoncpp 라이브러리를 설치.
    3. opencv-2.4.13 소스코드는 따로 제공. 해당 소스코드를 사용하여 빌드하는 것을 추천,
    4. opencv-24.13 버전을 새로 다운로드 받을 시, opencv_20_04.sh파일 안에 설명된 에러 대처법에 따라 빌드 시도할 것.
    5. pcl 라이브러리의 경우 빌드 시간이 4시간 정도 소요됨. 
    6. 0번~8번과정을 따라갈 것.
    7. 이 밖의 에러 시 ccww2339@naver.com으로 문의.

## 
    https://hub.docker.com/repository/docker/ccww2339/lidar2ins_20_04_v2/general
    도커 이미지(ccww2339/lidar2ins_20_04_v2) 제공 시, 9번으로 
    제공된 이미지에서 빌드 실패 시, prerequisities폴더에 제공된 압축 파일 사용. 
## 0. workspace 설정.
    cd ${your_ws}/src
## 1. opencv-2.4.13
    opencv_20_04.sh 파일을 실행.
## 2. eigen-3.3.7 (참고: https://www.youtube.com/watch?v=Q5RD1HDjpk0)
    cd ${your_ws}/src
    tar -xvf ./eigen-3.3.7.tar.gz
    cd eigen-3.3.7
    mkdir build
    cd build
    cmake ..
    make install
## 3. boost 1.72 버전 이하 설치 (참고: https://qiita.com/tobimogura/items/adeaa59b3ebac1d3c3a8)
    cd ${your_ws}/src
    wget -c 'https://sourceforge.net/projects/boost/files/boost/1.72.0/boost_1_72_0.tar.bz2'
    tar -xvf boost_1_72_0.tar.bz2
    cd boost_1_72_0
    ./bootstrap.sh
    ./b2 install
## 4. VTK 패키지 설치
    apt-get update
    apt-get install -y python3-vtk7
## 5. pcl-1.9.1 버전 설치
    cd ${your_ws}/src
    1. pcl-1.9.1.zip 파일 다운로드.
    2. unzip ./pcl-1.9.1.zip
    cd ./pcl-pcl-1.9.1
    mkdir build
    cd build
    cmake ..
    make install
## 6. Pangolin 설치
    cd ${your_ws}/src
    git clone https://github.com/stevenlovegrove/Pangolin.git
    cd Pangolin
    # Install dependencies (as described above, or your preferred method)
    # ./scripts/install_prerequisites.sh recommended
    apt install libglew-dev
    mkdir build
    cd build
    cmake ..
    make install
    # Configure and build
    # cmake -B build
    # cmake --build build
## 7. jsoncpp 설치
    cd ${your_ws}/src
    git clone https://github.com/open-source-parsers/jsoncpp.git
    cd jsoncpp
    mkdir build
    cd build
    cmake .. -DBUILD_SHARED_LIBS=OFF -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    make install
## 8. LiDAR2INS 설치
    apt update
    apt install nano
    # 제공된 LiDAR2INS로 빌드 시도 후, 되지 않을 떄, 
    git clone https://github.com/OpenCalib/LiDAR2INS.git
    cd LiDAR2INS
    nano CMakeLists.txt
    # find_package(Qt5 REQUIRED COMPONENTS Core Gui Widgets Concurrent OpenGL Test) 코드를 30번 줄에 추가
    
    # 제공된 LiDAR2INS를 사용 시.
    cd LiDAR2INS

    mkdir -p build && cd build
    # build
    cmake .. && make
## 9. 제공 도커 이미지 활용.
    cd LiDAR2INS
    mkdir -p build && cd build
    # build
    cmake .. && make
    # 빌드 실패 시, 8번 참조 바람. 새로 다운로드 후, CMakeList.txt 수정.
