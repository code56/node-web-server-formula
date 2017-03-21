node-web-server-repository:
    builder.git_latest:
        - name: git@github.com:code56/node_web_server.git
        #- branch: branch_for_vagrant
        - identity: {{ pillar.elife.projects_builder.key or '' }}
        - rev: branch_for_vagrant
        - target: /srv/node-web-server/
        - branch: {{ salt['elife.branch']() }}
        - force_fetch: True
        - force_checkout: True
        - force_reset: True
        - fetch_pull_requests: True

    file.directory:
        - name: /srv/node_web_server
        - user: {{ pillar.elife.deploy_user.username }}
        - group: {{ pillar.elife.deploy_user.username }}
        - recurse: 
            - user
            - group
        - require:
            - builder: node-web-server-repository


node-web-server-deb-dependencies:
    pkg.installed:
        - pkgs:
            - ruby-dev
            - rake 


#added these 3 lines need to test them to see if they are working
npm-install:
    cmd.run:
        - name: sudo npm install
        - cwd: /srv/node-web-server/
        - user: {{ pillar.elife.deploy_user.username }}
        - require:
            - node-web-server-deb-dependencies
            - node-web-server-repository
    

node-web-server-database:
    mysql_database.present:
        - name: {{ pillar.node_web_server.db.name}}
        - connection_pass: {{pillar.elife.db_root.password}}
        - require:
            - mysql-ready


node-web-server-database-user:
    mysql_user.present:
        - name: {{ pillar.node_web_server.db.user }}
        - password: {{ pillar.node_web_server.db.password }}
        - connection_pass: {{ pillar.elife.db_root.password }}
        {% if pillar.elife.env in ['dev'] %}
        - host: '%'
        {% else %}
        - host: localhost
        {% endif %}
        - require:
            - mysql-ready


#any references to pillar, cannot have -, needs to be underscore
node-web-server-database-access:
    mysql_grants.present:
        - user: {{ pillar.node_web_server.db.user }}
        - connection_pass: {{ pillar.elife.db_root.password }}
        - database: {{ pillar.node_web_server.db.name }}.*
        - grant: all privileges
        {% if pillar.elife.env in ['dev'] %}
        - host: '%'
        {% else %}
        - host: localhost
        {% endif %}
        - require:
            - node-web-server-database
            - node-web-server-database-user


# only run the bash file with the rake commands to populate 
# the mysql database if it wasn't run before

# testing to run a shell script

Run testing_bash.sh:
    cmd.run:
        - name: sudo bash testing_bash.sh
        - cwd: /srv/node-web-server/public/assets/bash
        - stateful: True


run my rake simple.rb:
    cmd.run:
        - name: sudo ruby simple.rb
        - cwd: /srv/node-web-server/public/assets/ruby/
        - stateful: False






        




