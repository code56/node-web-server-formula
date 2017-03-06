node-web-server-library-repository:
	builder.git_latest:
		- name: git@github.com:code56.node-web-server-library.git
		- identity: {{ pillar.elife.projects_builder or '' }}
		- rev: {{ salt['elife.rev']() }}
		- branch: {{ salt['evanthia_branch.branch']() }}
		- force_fetch: True
		- force_checkout: True
		- force_reset: True
		- fetch_pull_requests: True


	file.directory:
		-name: /srv/node-web-server
