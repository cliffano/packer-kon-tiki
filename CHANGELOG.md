# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added
- Add smartcrop

## 3.10.0 - 2025-07-06
### Added
- Add FFmpeg

## 3.9.0 - 2025-01-24
### Added
- Add go installation at 1.23.5

### Fixed
- Fix missing go path for checkmake

## 3.8.0 - 2025-01-24
### Added
- Add checkmake installation

## 3.7.0 - 2025-01-19
### Changed
- Upgrade node.js to 23.5.0
- Upgrade release-action to 1.1.0

## 3.6.0 - 2024-12-27
### Added
- Add pipx
- Add /root/.local/bin to PATH for pipx-installed packages

### Changed
- Upgrade Ubuntu to 24.04
- Replace ansible.builtin.pip with community.general.pipx

## 3.5.0 - 2024-10-20
### Added
- Add vim package

## 3.4.0 - 2024-10-05
### Added
- Add /usr/local/node/ symlink to version specific node path

## 3.3.0 - 2024-09-29
### Changed
- Upgrade Bob to 3.1.0

## 3.2.0 - 2024-09-28
### Changed
- Upgrade Bob to 3.0.0
- Update release workflows to use cliffano/release-action

## 3.1.0 - 2024-09-24
### Added
- Re-add Hugo
- Add version to npm packages installation

## 3.0.2 - 2024-09-22
### Fixed
- Fix env PATH to include provisioned software

## 3.0.1 - 2024-09-22
### Fixed
- Fix call to old target init on publish workflows
- Fix broken virtualenv sourcing by temporarily switching to studio:1.15.0

## 3.0.0 - 2024-09-21
### Added
- Add Packer plugins for Docker and Ansible

### Changed
- Replace Packer template format to HCL2
- Replace Puppet with Ansible for provisioning

## 2.3.0 - 2024-05-10
### Added
- Add jq

## 2.2.0 - 2024-02-04
### Removed
- Remove inexisting software from info script

### Fixed
- Fix private package publishing error to use classic token

## 2.1.0 - 2024-01-27
### Added
- Add temporary bundler pin to v2.4.22 to support Ruby 2.7.x
- Add Docker plugin for Packer

### Changed
- Upgrade Terraform to 1.7.1
- Upgrade Packer to 1.10.0
- Upgrade node.js to 20.x

## 2.0.1 - 2023-08-01
### Fixed
- Fix missing init call on publish GH Actions

## 2.0.0 - 2023-07-31
### Changed
- Switch base OS to Ubuntu 20.04
- Upgrade node.js to 18.x

## 1.8.0 - 2023-02-05
### Changed
- Upgrade Terraform to 1.3.7
- Upgrade Packer to 1.8.5

## 1.7.0 - 2022-10-19
### Added
- Add info script to list command versions

### Changed
- Upgrade Terraform to 1.3.2
- Upgrade Packer to 1.8.3

## 1.6.0 - 2022-09-11
### Added
- Add dnf and gh

## 1.5.0 - 2022-03-26
### Added
- Add git for using terraform-kon-tiki via Git branch

## 1.4.2 - 2022-01-26
### Fixed
- Fix missing write package permission for private image publishing

## 1.4.1 - 2022-01-26
### Fixed
- Fix repository name for private image publishing

## 1.4.0 - 2022-01-26
### Changed
- Separate ghcr.io registry processing to *-private resources

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
