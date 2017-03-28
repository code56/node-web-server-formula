ruby:
    pkgrepo.managed:
        - name: pub https://cache.ruby-lang.org/pub/ruby/2.2 trusty main
        - key_url: http://deb.nodesource.com/gpgkey/nodesource.gpg.key
        - file: /etc/apt/sources.list.d/nodesource.list

    pkg.installed:
        - name: nodejs
        - require:
            - pkgrepo: nodejs
