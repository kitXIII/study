install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop

compose-setup: compose-build compose-install

compose-build:
	docker-compose build

compose-install:
	docker-compose run --rm ruby make install

compose-test:
	docker-compose run --rm ruby make test

compose-lint:
	docker-compose run --rm ruby make lint

compose-shell:
	docker-compose run --rm ruby bash

.PHONY: test