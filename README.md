# Install-script-for-OpenCV4-Ubuntu

The script automates the installation of OpenCV4 on Ubuntu.
1. Copy it to your home folder.
2. Make it executable: sudo chmod +x installcv420_ubuntu.sh
3. run ./installcv420_ubuntu.sh

Hope it works for you,

Cheers

PS: 

1. Check that the path to the .../pkgconfig containing opencv4.pc really is in the environment variable LD_LIBRARY_PATH.

2. If you encouter errors regarding missing -lprotobuf for say TARGET_LINK_LIBRARIES in CMakelist.txt do install these: 

   sudo apt-get install protobuf-compiler libprotobuf-dev
   
   This line could/should be added into the install script.
   
3. For missing OpenGL libs -lglut -lGL -lGLU installing these fixed it for me:

   sudo apt-get install freeglut3 freeglut3-dev

   



I AM READING AN (IMO CRAPPY) OPENCV4 BOOK FROM PACKT AND WHILE DOING THAT I FIND STUFF THAT IS NOT WORKING OR MISSING FROM THE UBUNTU ENVIRONMENT. I WILL ADD NOTES ABOUT THOSE HERE.
