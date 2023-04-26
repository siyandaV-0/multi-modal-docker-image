FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04
# FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10 # For Load-Balancing

# Add new container user
# This method consists of better container security versus running as root
ENV USERNAME container_user
RUN useradd -ms /bin/bash $USERNAME && mkdir /app

# Set the ownership and permissions of the working directory
RUN chown -R $USERNAME:$USERNAME /app
RUN chmod -R 777 /app

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
CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter-lab --ip 0.0.0.0 --no-browser --notebook-dir=/app --allow-root --NotebookApp.custom_display_url='http://bluecrane:8989'"]

