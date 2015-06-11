{% from "salt/map.jinja" import salt_settings with context %}

include:
  - salt.master

salt-syndic:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_syndic }}
{% endif %}
  service:
    - running
    - watch:
{% if salt_settings.install_packages %}
      - pkg: salt-master
{% endif %}
      - file: {{ salt_settings.config_path }}/master
