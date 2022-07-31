## ansible自动化部署各类组件集合

tags说明：
- install 安装程序（包括更新配置、停止、启动）
- start 启动程序(包括更新配置、启动)
- stop 停止程序
- restart 重启程序(包括更新配置、停止、启动)
- update 更新配置和脚本
- reload 热加载配置文件
- uninstall 停止服务并删除服务目录

下面组件部署和控制比较简单粗暴，适合快速部署开发和测试环境，生产环境还要根据实际环境进行优化

| 组件  | 命令 | 
| ------------- | ------------- | 
| grafana  | ansible-playbook -i inventory grafana.yml -t install/start/stop/restart/update/uninstall  | 
| nginx  | ansible-playbook -i inventory nginx.yml -t install  | 
| prometheus  | ansible-playbook -i inventory prometheus.yml -t install/start/stop/restart/reload  | 
| node_exporter  | ansible-playbook -i inventory node_exporter.yml -t install/start/stop/restart  | 
