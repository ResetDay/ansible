## grafana 手动安装方式

### 二进制安装
```
wget https://dl.grafana.com/enterprise/release/grafana-enterprise-9.0.4.linux-amd64.tar.gz
tar -zxvf grafana-enterprise-9.0.4.linux-amd64.tar.gz
```
### RPM安装
```
wget https://dl.grafana.com/enterprise/release/grafana-enterprise-9.0.4-1.x86_64.rpm
sudo yum install grafana-enterprise-9.0.4-1.x86_64.rpm

sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
sudo systemctl enable grafana-server
```

二进制和RPM安装各有优缺点，二进制需要自己编写启动和停止脚本，而RPM安装依赖systemctl，该命令无法在纯docker中运行。
因此为了保证兼容性，在ansible中应该采用二进制安装方式比较合理。


### TODO

目前只是简单实现，可参考更多项目实现对ssl、dashboard、datasource、plugin的配置控制

https://github1s.com/goldstrike77/ansible-role-linux-grafana

https://github1s.com/0x0I/ansible-role-grafana



