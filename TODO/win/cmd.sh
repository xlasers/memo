#!/usr/bin/env bash

#https://www.jianshu.com/p/bb0ba62b519c


# win下的包管理器:scoop(等价于Linux的apt,mac下的homebrew)安装使用
# cmd命令行切换到powerShell
powerShell

# 安装下载
set-executionpolicy remotesigned -s cu
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# 安装权限(有些程序或许需要),包安装目录默认C:\Users\xxx\scoop\apps
scoop install sudo

# 尝试安装curl,注意-安装需要解压,会默认安装7z
scoop install curl
scoop install grep sed less touch


# 安装不存在的包: Couldn't find manifest for 'jdk'
scoop install jdk
# scoop自带的下载APP比较少一些其他第三方的软件需要添加bucket中,如下方法添加
scoop bucket add extras https://github.com/lukesampson/scoop-extras.git
# 安装三方包如：jdk
scoop install extras/oraclejdk


# 其他相关 ... ...
scoop install python ruby go perl


# 子网掩码
#IP地址是一个32位的二进制数,通常被分割为4个“8位二进制数,2^8=256”(也就是4个字节).IP地址通常用“点分十进制”表示成(a.b.c.d)的形式.

#例如 IP：192.168.1.1,每个点由八位数字组成.
   192  .   168  .    1   .    1
11000000.10101000.00000001.00000001
11111111.11111111.11111111.00000000
   255  .   255  .   255  .    0
# mask:11111111.11111111.11111111.00000000,其中为1的部分表示IP对应长度的部分为网络部分：168.192.1.最后八位为0,最后一个1表示为主机部分,是局域网内部分配的编号.


# 网关 网关
# 网关(Gateway)就是一个网络连接到另一个网络的“关口”.按照不同的分类标准,网关也有很多种.TCP/IP协议里的网关是最常用的,在这里我们所讲的“网关”均指TCP/IP协议下的网关.
# 网关实质上是一个网络通向其它网络的IP地址.这个IP地址,是具有路由功能的IP地址,默认网关也是一个网关,也是具有路由功能的设备的IP地址.
# 注意：在填写默认网关时,主机的IP地址必须和默认网关的IP地址处于同一段.举例：比如有网络A和网络B,网络A的IP地址范围为“192.168.1.1~192. 168.1.254”,子网掩码为255.255.255.0；网络B的IP地址范围为“192.168.2.1~192.168.2.254”,子网掩码为255.255.255.0.#
# 在没有路由器的情况下,两个网络之间是不能进行TCP/IP通信的,即使是两个网络连接在同一台交换机(或集线器)上,TCP/IP协议也会根据子网掩码(255.255.255.0)
# 判定两个网络中的主机处在不同的网络里.而要实现这两个网络之间的通信,则必须通过网关.如果网络A中的主机发现数据包的目的主机不在本地网络中,
# 就把数据包转发给它自己的网关,再由网关转发给网络B的网关,网络B的网关再转发给网络B的某个主机.网络B向网络A转发数据包的过程也是如此.
# 所以说,只有设置好网关的IP地址,TCP/IP协议才能实现不同网络之间的相互通信.



#DHCP: 动态主机配置协议
#TCP/IP协议想要运行正常的话,网络中的主机和路由器不可避免地需要配置一些信息(如接口的IP地址等).有了这些配置信息主机/路由器才能提供/使用特定的网络服务.


# 添加查看路由
# 查看路由
route print

# -p 永久添加路由(命令非常有用,可以指定任何特定的IP或网段指向某网关路由)
route add -p 192.168.0.0 mask 255.255.255.0 172.18.248.254 metric 1
#metric Metric: 为路由指定所需跃点数的整数值(范围是 1 ~ 9999)
# 它用来在路由表里的多个路由中选择与转发包中的目标地址最为匹配的路由,所选的路由具有最少的跃点数.跃点数能够反映跃点的数量,路径的速度,路径可靠性,路径吞吐量以及管理属性. 　　 　　
# Metric用于指出路由的成本,通常情况下代表到达目标地址所需要经过的跃点数量,一个跃点代表经过一个路由器;metric值越高,他的优先级别越低,(默认网关起冲突时可以修改优先级)

# 删除路由(相同网段的全部删除)
route delete 192.168.0.0


# 查找服务:SERVICE_NAME服务名,DISPLAY_NAME显示名
sc query |findstr Mongo
sc delete MongoDB


