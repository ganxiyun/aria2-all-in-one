# Overview
It provides a all-in-one package as Docker for aria2 and AriaNG (WebUI for aria2).

## Highlight
+ 29Mb.  
+ Edit config file out of the image.  
Move file completed to another folder.  
(Tasks that contains more than one files will not be moved.)  

# Installation
## Installation on Linux with Docker installed
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
xujinkai/aria2-with-webui
```
  
II. Open `http://serverip:6880/` for aria2-webui, open `http://serverip:6888/` to browse data folder.  

## Installation on QNAP

# Build 
`sudo docker build -f Dockerfile -t xujinkai/aria2-with-webui .`  
