node-web-server-repository:
    builder.git_latest:
        - name: git@github.com:code56.node-web-server.git
        - identity: {{ pillar.elife.projects_builder or '' }}
        - rev: {{ salt['elife.rev']() }}
        - target: /srv/node-web-server/
        - branch: {{ salt['elife.branch']() }}
        - force_fetch: True
        - force_checkout: True
        - force_reset: True
        - fetch_pull_requests: True

    file.directory:
        - name: /srv/node-web-server
        - user: {{ pillar.elife.deploy_user.username }}
        - group: {{ pillar.elife.deploy_user.username }}
        - recurse: 
            - user
            - group
        - require:
            - builder: node-web-server-repository


