rbenv_deps:
  pkg.latest:
    - names:
      - autoconf
      - automake
      - bison
      - build-essential
      - curl
      - git
      - libc6-dev
      - libncurses5-dev
      - libreadline-dev
      - libreadline-gplv2-dev 
      - libsqlite3-0
      - libsqlite3-dev
      - libssl-dev
      - libtool
      - libxml2 
      - libxml2-dev 
      - libxslt1-dev
      - libyaml-dev
      - openssl
      - sqlite3
      - subversion
      - tklib 
      - zlib1g
      - zlib1g-dev 

myrbenv:
  rbenv.install_rbenv:
    - name: "install_rbenv"
    - user: {{ pillar.elife.deploy_user.username }}

ruby-2.1.5:
  rbenv.installed:
    #- default: True
    - user: {{ pillar.elife.deploy_user.username }}
    - require:
      - pkg: rbenv_deps   
    