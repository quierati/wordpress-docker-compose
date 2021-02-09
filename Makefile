init: loadenv compose install plugins users

loadenv:
	@echo "export \$$(cut -d= -f1 .env)"

compose:
	docker-compose up --build -d
	sleep 60

install:
	bash -x scripts/install.sh

plugins:
	bash -x scripts/plugins.sh

users:
	bash -x scripts/users.sh

backup:
	bash -x scripts/backup.sh

url:
	docker-compose run --rm wpcli option update home $1
	docker-compose run --rm wpcli option update siteurl $1
