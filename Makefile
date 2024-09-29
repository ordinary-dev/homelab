common_args := -i inventory.ini --ask-vault-pass -e@vaulted_vars.yml

all: common networkvm webserver

networkvm: wireguard

webserver: tls haproxy docker minio postgresql mastodon vaultwarden

%:
	ansible-playbook $(common_args) $*.yml
