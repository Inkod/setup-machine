.PHONY: help
help:
	@echo 'Run `make install` to do stuff!'

.PHONY: install
install: install.lock
	ansible-playbook -K setup.yml --verbose

install.lock:
	@echo "1st time run, let's install required tools"
	sudo apt update -y
	sudo apt install -y software-properties-common
	sudo apt install ansible git ssh -y
	# Success! let's create the lock file not to run this step again
	@touch $@
