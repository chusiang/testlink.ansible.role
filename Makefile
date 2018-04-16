.PHONY: main syntax_check lint_check boot run clean

main: syntax_check lint_check

init:
	if [ ! -d "ansible-retry" ]; then mkdir "ansible-retry"; fi
	ansible-galaxy install -f -p roles -r requirements.yml

syntax_check:
	ansible-playbook --syntax-check setup*.yml

lint_check:
	ansible-lint --exclude=roles setup*.yml

boot:
	vagrant up

run:
	vagrant provision

clean:
	rm -f setup.retry
	vagrant destroy

