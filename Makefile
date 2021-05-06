init:
	git submodules init
	git submodule update --remote --merge
build:
	docker-compose build
	docker-compose run --rm api python3 manage.py migrate
	docker-compose run --rm api python3 manage.py collectstatic --noinput
	docker-compose run --rm api python3 manage.py populatedb --createsuperuser
run:
	docker-compose up
cleanup:
	docker-compose rm -v
	docker volume rm saleor-platform_saleor-db saleor-platform_saleor-media saleor-platform_saleor-redis
