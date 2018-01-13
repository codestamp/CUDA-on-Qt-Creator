# Basic .pro configuration
SOURCES += main.cpp
# Cuda sources
CUDA_SOURCES += t1.cu
# Project dir and outputs
PROJECT_DIR = $$system(pwd)
OBJECTS_DIR = $$PROJECT_DIR/Obj
DESTDIR = ../bin
# Path to cuda toolkit install
CUDA_DIR = /usr/local/cuda
# GPU architecture
CUDA_ARCH = sm_21
# nvcc flags (ptxas option verbose is always useful)
NVCCFLAGS = --compiler-options -use-fast-math --Wno-deprecated-gpu-targets
# include paths
INCLUDEPATH += $$CUDA_DIR/include
# lib dirs
QMAKE_LIBDIR += $$CUDA_DIR/lib64
# libs - note than i'm using a x_86_64 machine
LIBS += -lcuda -lcudart
# join the includes in a line
CUDA_INC = $$join(INCLUDEPATH,' -I','-I',' ')

# Prepare the extra compiler configuration (taken from the nvidia forum - i'm not an expert in this part)
cuda.input = CUDA_SOURCES
cuda.output = ${OBJECTS_DIR}${QMAKE_FILE_BASE}_cuda.o

cuda.commands = $$CUDA_DIR/bin/nvcc -m64 -g -G -arch=$$CUDA_ARCH -c $$NVCCFLAGS $$CUDA_INC $$LIBS  ${QMAKE_FILE_NAME} -o ${QMAKE_FILE_OUT}

cuda.dependency_type = TYPE_C # there was a typo here. Thanks workmate!
cuda.depend_command = $$CUDA_DIR/bin/nvcc -g -G -M $$CUDA_INC $$NVCCFLAGS   ${QMAKE_FILE_NAME}
# Tell Qt that we want add more stuff to the Makefile
QMAKE_EXTRA_UNIX_COMPILERS += cuda
