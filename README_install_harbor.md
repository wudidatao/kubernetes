1.设置当前主机名
./hostname.sh

2.设置主机解析
./dns.sh

3.初始化环境
./selinux.sh
./firewalld.sh
./docker.sh
./docker-compose.sh
./ntpd.sh

4.安装harbor，第一个节点执行
./harbor2_install.sh
第二个节点执行
./harbor3_install.sh

5.启动服务
./harbor_start.sh

6.关闭服务
./harbor_stop.sh

7.访问服务
./harbor_view.sh

8.配置所有节点对harbor的访问,这个脚本在各个节点上执行
./harbor_crt.sh
