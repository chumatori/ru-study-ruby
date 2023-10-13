run_project:
	docker-compose build
	docker-compose run --rm ruby bundle

run_tests:
	docker-compose run --rm ruby bundle exec rake test

run_linter:
	docker-compose run --rm ruby bundle exec rubocop -A
