FROM ubuntu:16.04
WORKDIR /
RUN export CC=clang
RUN export CXX=clang++
RUN apt-get update
RUN apt-get install -y git clang ninja-build cmake
RUN git clone https://github.com/llvm-mirror/llvm.git
WORKDIR /llvm
RUN git checkout release_36
WORKDIR /llvm/projects
RUN git clone https://github.com/llvm-mirror/compiler-rt.git
WORKDIR /llvm/projects/compiler-rt.git
RUN git checkout release_36
WORKDIR /llvm/tools
RUN git clone https://github.com/llvm-mirror/clang.git
WORKDIR /llvm/tools/clang
RUN git checkout release_36
WORKDIR /
RUN mkdir build
WORKDIR build
RUN cmake -G Ninja ../llvm
RUN ninja
RUN ninja install
