<h1 style="Text-Align:center; background-color:DodgerBlue;">
Multi-Modal Models Docker Image:
</h1>

---
<h4 style="Text-Align:left;color:black; background-color:Gold;">
    <ul>
    <li>This image builds a multi-modal environment for use in jupyter-lab <br>
    <li>The image builds opencv from source code to have cuda support. <br>
    <li>You can then run the cv algorithms using the GPU for faster processing.<br>
    <li>This will serve you well if you can deploy the container to a remote server.<br>
    </ul>
</h4>
<br>

<h2 style="Text-Align:left; background-color:MediumSeaGreen;">
Working Directory:
</h2>

<h4 style="Text-Align:left;color:black; background-color:Gold;">
Our working Directory is structured as follows:
</h4>

```
.
└── computer-vision-docker-image
    ├── dependecies
    │   ├── mm-requirements.txt
    │   ├── ubuntu-deps.sh
    │   └── opencv.sh
    ├── test-code
    │   ├── controlnet.ipynb
    │   └── stable-diffusion.ipynb    
    ├── Dockerfile
    ├── docker-compose.yml
    └── ReadME.md
```
<br>

<h2 style="Text-Align:left; background-color:MediumSeaGreen;">
To build the image run the docker-build bash script
</h2>

```shell
 docker-compose build
```
<h4 style="Text-Align:left;color:black; background-color:Gold;">
If you need to make updates to the content of the container, e.g. 
installing new packages with pip- you can specify these in the cv-requirements.txt file in the dependencies folder.
</h4>

<br> 

 ---

<h2 style="Text-Align:left; background-color:MediumSeaGreen;">
To launch the image run the docker-run bash script 
</h2>

```shell
 docker-compose up
```
<h4 style="Text-Align:left;color:black; background-color:Gold;">
The docker run bash scripts allow for ease of launching into the container's jupyter-lab. <br> 
This docker run script uses docker-compose commands to achieve this.<br> 
</h4>
