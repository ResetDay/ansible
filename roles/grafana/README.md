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

## Provision

[官方文档](https://grafana.com/docs/grafana/latest/administration/provisioning/)

conf/provisioning 目录下模块
- access-control
- dashboards
- datasources
- notifiers
- plugins

这些模块可以通过配置方式加载，可以在部署时候预先配置好，而不用在新部署的时候通过UI来手动配置

### datasources配置示例
conf/provisioning/datasources/prometheus.yaml
```
apiVersion: 1

deleteDatasources:
  - name: prometheus
    orgId: 1

datasources:
- name: prometheus
  type: prometheus
  orgId: 1
  access: proxy
  url: http://localhost:9090
  # <bool> allow users to edit datasources from the UI.
  editable: false

```

### dashboards配置示例
conf/provisioning/dashboards 
dashboard可以按目录进行分类,在把json复制到目录下
```
apiVersion: 1

providers:
  - name: 'host'
    orgId: 1
    folder: 'host'
    type: file
    disableDeletion: false
    updateIntervalSeconds: 60 #how often Grafana will scan for changed dashboards
    options:
      path: /opt/grafana/conf/provisioning/dashboards/host
```

### TODO 

目前只是简单实现，可参考更多项目实现对ssl、plugin的配置控制

https://github1s.com/goldstrike77/ansible-role-linux-grafana

https://github1s.com/0x0I/ansible-role-grafana



