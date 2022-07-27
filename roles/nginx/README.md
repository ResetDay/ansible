## nginx 手动安装方式

### 二进制安装

```
wget https://nginx.org/download/nginx-1.21.0.tar.gz
tar -zxvf nginx-1.21.0.tar.gz
cd nginx-1.21.0
./configure
make
sudo make install
```  

默认安装在/usr/local/nginx