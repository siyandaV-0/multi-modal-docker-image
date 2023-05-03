FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Add new container user

# This method consists of better container security versus running as root
ARG USERNAME=container_user
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# RUN useradd -ms /bin/bash $USERNAME && mkdir /app

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -ms /bin/bash $USERNAME \
    && mkdir /app

USER ${USERNAME}

# Set Working Directory
WORKDIR /app

# Set non-interactive mode 
ENV DEBIAN_FRONTEND=noninteractive 

# Copy ubuntu bash script file into working folder
COPY ./dependencies/ubuntu-deps.sh ./

# Install required Ubuntu dependencies for OpenCV with CUDA
RUN bash ubuntu-deps.sh

# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# See http://bugs.python.org/issue19846
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Copy requirements file into working folder
COPY ./dependencies/mm-requirements.txt ./

#Install requirements for our multi-modal work env
RUN pip3 install -r mm-requirements.txt

# Copy opencv bash script file into working folder
COPY ./dependencies/opencv.sh ./

#Install Opencv from source so it has cuda support:
RUN bash opencv.sh

# Jupyter-lab localhost runs on port 8888
EXPOSE 8888 

# We shall port map the 8888 to port 8989 on a server called bluecrane:
CMD ["bash", "-c", "jupyter-lab --ip 0.0.0.0 --no-browser --notebook-dir=/app --allow-root --NotebookApp.custom_display_url='http://bluecrane:8989'"]

