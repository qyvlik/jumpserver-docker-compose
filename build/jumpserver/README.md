# jumpserver docker

## docker build

**预计镜像大小 1G**

```bash
docker build -t jms .
```

## 适合运行的宿主机系统

`Ubuntu`

## 容器内进程用户

`jumpserver`

## 容器可用的环境变量

以 `JUMPSERVER_*` 为前缀的环境变量，具体替换见 [docker-entrypoint](docker-entrypoint.sh)

## 容器内时区

绑定到宿主机的时区，如果需要特别指定时区而又不想修改时区，请执行修改 [Dockerfile](Dockerfile) 添加如下命令

```dockerfile
...

WORKDIR ${OPT_PATH}

RUN echo "Asia/Shanghai" > /etc/timezone && \
 dpkg-reconfigure -f noninteractive tzdata
 
COPY docker-entrypoint.sh .

...
```
