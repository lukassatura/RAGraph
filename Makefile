.PHONY: setup init update test lint build mypy check build publish doc examples clean


setup:
	pyenv install --verbose --skip-existing
	pyenv local
	poetry config virtualenvs.prefer-active-python true

init:
	poetry install -E all

update:
	poetry update --lock
	poetry install -E all

test:
	poetry run pytest --verbose --color=yes --junit-xml=tests/results.xml -o junit_family=xunit1 --cov-report xml:tests/coverage.xml --cov=. tests

lint:
	poetry run pylint --rcfile=.pylintrc --exit-zero spellcheck tests -r n --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" > sonar-result

mypy:
	poetry run mypy <project-name> --no-strict-optional --check-untyped-defs --ignore-missing-imports  --junit-xml=tests/mypy.xml --exclude='<project-files-to-exclude>/*'

check: test mypy lint
	cat sonar-result

build:
	poetry build

publish:
	poetry publish -r <artifactory-name>

doc:
	poetry run pydoc-markdown -p spellcheck --render-toc > doc/spellcheck.md
	@for api_version in $$(find openapi/*.yaml | sed -n 's/.*\/openapi_v\(.*\)\..*/\1/p') ; do \
  		widdershins --environment openapi/md_config.json openapi/openapi_v$$api_version.yaml -o doc/openapi_v$$api_version.md ; \
    done

clean:
	rm -rf .mypy_cache .pytest_cache tests/*.xml .coverage sonar-result dist .venv