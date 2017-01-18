FROM ev3dev/debian-jessie-cross

RUN sudo apt-get update
RUN sudo apt-get install gdbserver git --yes --no-install-recommends
RUN mkdir $HOME/ev3dev/
COPY 3rdParty/ev3dev-lang-cpp $HOME
RUN mkdir -p $HOME/ev3dev-lang-cpp/build/
RUN cd $HOME/ev3dev-lang-cpp/build/ && cmake ../ -DCMAKE_TOOLCHAIN_FILE=~/toolchain-armel.cmake && make -j9
RUN sudo cp $HOME/ev3dev-lang-cpp/build/libev3dev.a /usr/lib/
RUN sudo mkdir -p /usr/include/ev3dev/
RUN sudo cp $HOME/ev3dev-lang-cpp/ev3dev.h /usr/include/ev3dev/
ENV PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabi/pkgconfig
