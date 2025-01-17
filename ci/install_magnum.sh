# Select Compiler
if [ "$COMPILER" = "gcc" ]; then
export CC=/usr/bin/gcc && export CXX=/usr/bin/g++
fi
if [ "$COMPILER" = "clang" ]; then
export CC=/usr/bin/clang && export CXX=/usr/bin/clang++
fi

mkdir -p ~/.deps
cd ~/.deps
# install Corrade
git clone https://github.com/mosra/corrade.git
cd corrade
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_INSTALL_PREFIX=/usr ..
make -j
sudo make install
cd ../..

# install Magnum
git clone https://github.com/mosra/magnum.git
cd magnum
mkdir build && cd build
# Ubuntu
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DWITH_AUDIO=ON -DWITH_DEBUGTOOLS=ON -DWITH_GL=ON -DWITH_MESHTOOLS=ON -DWITH_PRIMITIVES=ON -DWITH_SCENEGRAPH=ON -DWITH_SHADERS=ON -DWITH_TEXT=ON -DWITH_TEXTURETOOLS=ON -DWITH_TRADE=ON -DWITH_GLFWAPPLICATION=ON -DWITH_WINDOWLESSGLXAPPLICATION=ON -DWITH_OPENGLTESTER=ON -DWITH_ANYAUDIOIMPORTER=ON -DWITH_ANYIMAGECONVERTER=ON -DWITH_ANYIMAGEIMPORTER=ON -DWITH_ANYSCENEIMPORTER=ON -DWITH_MAGNUMFONT=ON -DWITH_OBJIMPORTER=ON -DWITH_TGAIMPORTER=ON -DWITH_WAVAUDIOIMPORTER=ON -DCMAKE_INSTALL_PREFIX=/usr ..
make -j
sudo make install
cd ../..

# install MagnumPlugins
git clone https://github.com/mosra/magnum-plugins.git
cd magnum-plugins
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DWITH_ASSIMPIMPORTER=ON -DWITH_DDSIMPORTER=ON -DWITH_JPEGIMPORTER=ON -DWITH_OPENGEXIMPORTER=ON -DWITH_PNGIMPORTER=ON -DWITH_TINYGLTFIMPORTER=ON -DWITH_STBTRUETYPEFONT=ON  -DCMAKE_INSTALL_PREFIX=/usr ..
make -j
sudo make install
cd ../..

# install MagnumIntegration
git clone https://github.com/mosra/magnum-integration.git
cd magnum-integration
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DWITH_DART=ON -DWITH_EIGEN=ON  -DCMAKE_INSTALL_PREFIX=/usr -DDART_DIR=$DART_DIR ..
make -j
sudo make install
cd ../..

sudo ldconfig
cd $CI_HOME
