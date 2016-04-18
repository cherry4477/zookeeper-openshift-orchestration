# 一个主从复制的zookeeper编排
##简介
1主2从。带超级账号。
注意，由于zookeeper的2181并未使用http协议，所以现在不能走route只能在内部访问。
应用的地址需要给出全名：
```sb-instanceid-zk.<projectname>.svc.cluster.local```
使用方式：

	1.必须在网内，抱歉
	2.zkCli.sh -server sb-instanceid-zk:2181
##生成
	1.执行编排，生成4个service和3个rc，其中每个rc一个pod.
	2.注意替换其中的instanceid
	3.注意替换其中超级用户名和密码。supper:xxxx，其中xxx的编码方式见zk说明文档。简单说先sha1再base64
	
##绑定
直接返回密码，没有用户一说，所以很简单
##注意事项
如果不希望别人访问zookeeper集群，请要设置acl在根上。
测试可以通过如下方式：
```echo ruok | nc <service_ip> 2181; echo```

