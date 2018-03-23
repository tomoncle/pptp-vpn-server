# pptp-vpn-server
> 基于pptp的vpn服务搭建部署脚本

## 下载
* **ubuntu环境**:`$ wget https://raw.githubusercontent.com/tomoncle/pptp-vpn-server/master/pptp-vpn-server-ubuntu14.04.sh`
* **centos环境**:`$ wget https://raw.githubusercontent.com/tomoncle/pptp-vpn-server/master/pptp-vpn-server-centos7.sh`



## 使用
* 1.授权：`$ chmod +x pptp-vpn-server-*.sh`
* 2.运行：`$ ./pptp-vpn-server-*.sh`, 执行过程需要你显示的指定你连接的用户名，密码.
   * 参数：`username`: vpn连接的用户名
   * 参数：`password`: vpn连接的密码

## client连接
打开客户端，使用pptp协议连接, 填入你的`服务器地址`，`用户名`和`密码`即可使用．
