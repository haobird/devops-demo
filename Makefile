# 启动服务
start_init: # 创建基础网络服务
	docker network create -d bridge dczone_default
	mkdir -p /data
	
start_zone: # 开启基础服务
	docker-compose -f zone.yml up --force-recreate --build -d 

start_test:
	docker run --privileged --rm  -v Dockerfile:/Dockerfile plugins/docker --dry-run
start_test1:
	docker run --privileged -it -e PLUGIN_TAG=latest -e PLUGIN_REPO=haobird/hello-world -e DRONE_COMMIT_SHA=d8dbe4d94f15fe89232e0402c6e8a0ddf21af3ab -v $(pwd):$(pwd) -w $(pwd) plugins/docker --dry-run

start_test2:
	docker run --privileged -it  -v Dockerfile:/Dockerfile -v /var/run/docker.sock:/var/run/docker.sock plugins/docker --dry-run

# 删除镜像和容器
destory_image: # 停止容器并删除镜像
	docker-compose -f base.yml down 

# 停止服务
stop_dev: 
	docker-compose -p dczone_web -f dev.yml stop
stop_base:
	docker-compose -f base.yml stop


# 进入web容器
goto_nginx:
	docker exec -it dczone_nginx_1 /bin/bash 
goto_web:
	docker exec -it dczone_web_1 /bin/bash  