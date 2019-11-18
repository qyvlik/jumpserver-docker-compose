# jumpserver-docker-compose

## docker build

```bash
docker build -t jms ./build/jumpserver

docker build -t jms-nginx ./build/nginx
```

## 注意事项

1. 需要手动创建 docker volume 挂载的文件夹，却设置好对应的权限，详见 [jms](build/jumpserver)
2. [.env.example](.env.example) 包含了一些预设的环境变量，更多环境变量，详见 [jumpserver](build/jumpserver)
3. [jms-nginx](build/nginx) 包含了 `luna`
4. [jms-nginx](build/nginx) 通过 docker volume 技术与 [jms](build/jumpserver) 共享文件
5. **本 docker-compose 编排仅在 ubuntu18.04 上测试运行过**
6. **未在 docker swarm 模式下测试过**。

## 参考

- http://docs.jumpserver.org/zh/docs/setup_by_prod.html
- http://docs.jumpserver.org/zh/docs/setup_by_ubuntu18.html
- https://github.com/wojiushixiaobai/docker-compose