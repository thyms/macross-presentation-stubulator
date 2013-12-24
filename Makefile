# type 'make -s list' to see list of targets.

run-app:
	PORT=5001 ./node_modules/forever/bin/forever ./node_modules/nodemon/nodemon.js server.js

test-app:
	@echo 'No test to run for this project'

test-app-ci:
	@echo 'No test to run for this project'

setup-project:
	npm install

git-pre-commit:
	@current_branch=$$(git rev-parse --abbrev-ref HEAD) && \
	if [ $$current_branch = 'develop' ]; then \
		make test-app && \
		heroku config:add COMMIT_HASH=$$(git rev-parse HEAD) --app macross-presentation-stub01; \
	fi

deploy-app:
	@commit_hash=$$(git rev-parse HEAD) && \
  if [ $$ENV = 'prod01' ]; then \
    while [ -z "$$COMMIT_HASH" ]; do \
      read -r -p "Enter commit hash: " COMMIT_HASH; \
    done && \
    if [ $$COMMIT_HASH = $$commit_hash ]; then \
      git push $$ENV develop:master && \
      heroku config:add COMMIT_HASH=$$commit_hash --app macross-presentation-$$ENV; \
    fi \
  else \
    git push $$ENV develop:master && \
    heroku config:add COMMIT_HASH=$$commit_hash --app macross-presentation-$$ENV; \
  fi

.PHONY: no_targets__ list
no_targets__:
list:
	@sh -c "$(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | sort"
