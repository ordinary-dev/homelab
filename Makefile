all: networkvm webserver

common_args := -i inventory.ini --ask-vault-pass -e@vaulted_vars.yml

common:
	ansible-playbook $(common_args) common.yml

networkvm: wireguard

webserver: tls haproxy docker minio postgresql mastodon vaultwarden

wireguard:
	ansible-playbook $(common_args) wireguard.yml

tls:
	ansible-playbook $(common_args) tls.yml

haproxy:
	ansible-playbook $(common_args) haproxy.yml

docker:
	ansible-playbook $(common_args) docker.yml

minio:
	ansible-playbook $(common_args) minio.yml

postgresql:
	ansible-playbook $(common_args) postgresql.yml

mastodon:
	ansible-playbook $(common_args) mastodon.yml

vaultwarden:
	ansible-playbook $(common_args) vaultwarden.yml
