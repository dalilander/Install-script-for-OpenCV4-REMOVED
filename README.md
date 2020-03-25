# Install-script-for-OpenCV4-Ubuntu

The script automates the installation of OpenCV4 on Ubuntu.
1. Copy it to your home folder.
2. Make it executable: sudo chmod +x installcv420_ubuntu.sh
3. run ./installcv420_ubuntu.sh

Hope it works for you,

Cheers

PS. Check that the path to the .../pkgconfig containing opencv4.pc really is in the environment variable LD_LIBRARY_PATH.

PPS. If with book examples you encouter errors regarding missing -lprotobuf for TARGET_LINK_LIBRARIES 

do install these:

sudo apt-get install protobuf-compiler libprotobuf-dev
