compose-setup: compose-build compose-install

compose-build:
	docker-compose build

compose-install:
	docker-compose run --rm ruby bash -c 'bundle install'

test:
	docker-compose run --rm ruby bash -c 'bundle exec rake test'

lint:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop'

.PHONY: test