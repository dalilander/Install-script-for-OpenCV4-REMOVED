#################################################
# INSTALL OPENCV4.2.0 ON UBUNTU 18.04 OR DEBIAN #
#################################################

# Kudos and thanks to those unknown ppl who wrote parts 1,2 and 3

# There are some checking points where the script halts, just comment them out if you want to
# run through the whole thing without any interruptions

# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# NEXT A BUNCH OF DEPENDENCIES ACCORDING TO A CERTAIN BOOK FOR OPENCV4 BUT MANY OF THESE 
# SEEM TO BE DEPRECATED FOR UBUNTU 18.04 AND AS SUCH UNNECESSARY, I HAVEN'T CHECKED EACH INDIVIDUALLY

sudo apt-get -y install libopencv-dev build-essential cmake libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils 

# WE ADD THIS FOR CHARACTER RECOGITION
sudo apt-get install -y tesseract-ocr libtesseract-dev libleptonica-dev

read -p "Check point, press enter to continue"


# 2. INSTALL MORE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# For Qt:
sudo apt-get install -y qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen

# 3. INSTALL THE LIBRARY (YOU CAN CHANGE '4.2.0' FOR THE LAST STABLE VERSION)
sudo apt-get install -y unzip wget

read -p "Check point, press enter to continue."

wget https://github.com/opencv/opencv/archive/4.2.0.tar.gz -O opencv.tar.gz
tar -zxvf opencv.tar.gz
wget https://github.com/opencv/opencv_contrib/archive/4.2.0.tar.gz -O opencv_contrib.tar.gz
tar -zxvf opencv_contrib.tar.gz

read -p "Check point, press enter to continue."

mv opencv-4.2.0 opencv
cd opencv
mkdir build
cd build

cmake -D OPENCV_GENERATE_PKGCONFIG=ON -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_V4L=ON -D WITH_EIGEN=ON -D WITH_OPENGL=ON -D FORCE_VTK=ON -D WITH_TBB=ON -D WITH_XINE=ON -D BUILD_EXAMPLES=ON -D BUILD_PERF_TESTS=OFF -D ENABLE_PRECOMPILED_HEADERS=OFF ..-D INSTALL_C_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D BUILD_opencv_python3=ON -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-4.2.0/modules ..

make -j4
sudo make install
sudo ldconfig

ls -l /usr/local/lib/pkgconfig

read -p "Check point, did cmake/make add opencv4.pc in the above forlder? Should have, press enter to continue."

# 4. TESTING WITH AN EXAMPLE

cd ~/opencv/samples/cpp

g++ opencv_version.cpp  $(pkg-config --cflags --libs opencv4) -o showCV_version

#RUN WITH

./showCV_version

#DONE-BYE



