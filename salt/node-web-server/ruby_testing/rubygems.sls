# rubygems.sls
backup:
  gem.installed:
    - name: backup
    - ruby: 2.1.5
    - user: {{ pillar.elife.deploy_user.username }}