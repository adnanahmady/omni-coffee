define default
$(if $(1), $(1), $(2))
endef

setup:
	@touch .backend/home/.nuget
	@touch .backend/home/.dotnet
	$(MAKE) up
	$(MAKE) shell run="sudo chmod -R 777 /home/docker/.nuget"
	$(MAKE) shell run="sudo chmod -R 777 /home/docker/.dotnet"
	$(MAKE) shell run="dotnet restore"
	$(MAKE) shell run="dotnet tool restore"
	$(MAKE) shell run="dotnet dev-certs https --trust"


up:
	docker compose up -d ${up-with}

down:
	docker compose down ${down-with}

build:
	docker compose build ${build-with}

restart:
	docker compose restart ${restart-with}

logs:
	docker compose logs ${log-with}

shell:
	docker compose exec $(call default,${service},backend) $(call default,${run},bash)

ps:
	docker compose ps
status: ps

