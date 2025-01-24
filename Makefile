version ?= 3.8.0

ci: clean stage deps lint build-docker-kon-tiki build-docker-kon-tiki-private

clean:
	rm -rf stage/ logs/ /tmp/packer-tmp/

stage:
	mkdir -p stage/ stage/ansible/roles/ stage/ansible/collections/

init:
	mkdir -p artifacts
	packer plugins install github.com/hashicorp/docker
	packer plugins install github.com/hashicorp/puppet

deps:
	packer plugins install github.com/hashicorp/docker 1.0.10
	packer plugins install github.com/hashicorp/ansible 1.1.1

lint:
	echo "TODO: Ansible Lint"
	# bundle exec puppet-lint \
	# 	--fail-on-warnings \
	# 	--no-documentation-check \
	# 	provisioners/*.pp \
	# 	modules-extra/*/manifests/langs/*.pp
	# shellcheck \
		# provisioners/shell/*.sh

build-docker-kon-tiki:
	mkdir -p logs/ /tmp/packer-tmp/
	PACKER_LOG_PATH=logs/packer-docker-kon-tiki.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-kon-tiki.json \
		templates/packer/docker-kon-tiki.pkr.hcl

build-docker-kon-tiki-private:
	mkdir -p logs/ /tmp/packer-tmp/
	PACKER_LOG_PATH=logs/packer-docker-kon-tiki-private.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-kon-tiki.json \
		templates/packer/docker-kon-tiki-private.pkr.hcl

publish-docker-kon-tiki:
	docker push cliffano/kon-tiki:latest
	docker image push cliffano/kon-tiki:$(version)

publish-docker-kon-tiki-private:
	docker push ghcr.io/cliffano/kon-tiki:latest
	docker image push ghcr.io/cliffano/kon-tiki:$(version)

release:
	rtk release

.PHONY: ci clean stage init deps lint build-docker-kon-tiki build-docker-kon-tiki-private publish-docker-kon-tiki publish-docker-kon-tiki-private release
