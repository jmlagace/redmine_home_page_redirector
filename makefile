run: run-redmine-4
	
run-redmine-4:
	docker run --rm -it -v "$(shell pwd)":/usr/src/redmine/plugins/redmine_home_to_my_page:ro -p 8000:3000  redmine:4
	
run-redmine-3:
	docker run --rm -it -v "$(shell pwd)":/usr/src/redmine/plugins/redmine_home_to_my_page:ro -p 8000:3000  redmine:3
	
run-redmine-2:
	docker run --rm -it -v "$(shell pwd)":/usr/src/redmine/plugins/redmine_home_to_my_page:ro -p 8000:3000  redmine:2