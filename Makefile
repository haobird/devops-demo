# 启动服务
start_init: # 创建基础网络服务
	docker network create  dczone_default
	mkdir -p /data
	
start_zone: # 开启基础服务
	docker-compose -f zone.yml up --force-recreate --build -d 

start_base: # 开启基础服务
	docker-compose -f base.yml up --force-recreate -d 



# 删除镜像和容器
destory_image: # 停止容器并删除镜像
	docker-compose -f base.yml down && docker rmi smart-office_script smart-office_api

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