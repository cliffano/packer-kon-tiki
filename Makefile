version ?= 1.3.1-pre.0

ci: clean deps lint build-docker-kon-tiki build-docker-kon-tiki-private

clean:
	rm -rf logs modules

init:
	mkdir -p artifacts

deps:
	gem install bundler
	bundle install --binstubs -j4
	bundle exec r10k puppetfile install --moduledir modules

lint:
	puppet-lint \
		--fail-on-warnings \
		--no-documentation-check \
		provisioners/*.pp
	shellcheck \
		provisioners/*.sh

build-docker-kon-tiki:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-kon-tiki.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-kon-tiki.json \
		templates/docker-kon-tiki.json

build-docker-kon-tiki-private:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-kon-tiki-private.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-kon-tiki.json \
		templates/docker-kon-tiki-private.json

build-docker-kon-tiki-cred:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-kon-tiki-cred.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		templates/docker-kon-tiki-cred.json

publish-docker-kon-tiki:
	docker push cliffano/kon-tiki:latest
	docker image push cliffano/kon-tiki:$(version)

publish-docker-kon-tiki-private:
	docker push ghcr.io/cliffano/kon-tiki:latest
	docker image push ghcr.io/cliffano/kon-tiki:$(version)

release:
	rtk release

.PHONY: ci clean init deps build-docker-kon-tiki build-docker-kon-tiki-cred publish-docker-kon-tiki release
