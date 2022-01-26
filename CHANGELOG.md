# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 1.3.0 - 2022-01-26
### Changed
- Include Ruby dependencies in Makefile deps target

### Removed
- Remove tools Makefile target

### Fixed
- Fix publish source ref to use released version instead of main branch

## 1.2.0 - 2022-01-26
### Added
- Add GH Actions release-* and publish-*

### Changed
- Upgrade node.js to 16.x
- Upgrade Packer to 1.7.9
- Upgrade Terraform to 1.1.4

### Fixed
- Fix Ansible installation on Centos7 with Python 3.6

## 1.1.0 - 2021-06-20
### Added
- Initial version
