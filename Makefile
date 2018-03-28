ci: clean tools deps lint

clean:
	rm -rf logs modules

init:
	mkdir -p artifacts

deps:
	r10k puppetfile install --moduledir modules --verbose

tools:
	gem install puppet-lint r10k

lint:
	puppet-lint \
		--fail-on-warnings \
		--no-documentation-check \
		provisioners/*.pp
	shellcheck \
		provisioners/*.sh

docker:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-kon-tiki.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-kon-tiki.json

.PHONY: ci clean init deps tools docker
