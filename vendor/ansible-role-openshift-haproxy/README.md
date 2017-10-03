OpenShift HAProxy Role
======================

This Ansible role customizes OpenShift HAProxy routers by modifying their DeploymentConfigs to run scripts before
the routers start. This role is designed to be used by other roles and doesn't provide any scripts itself.
Typically these pre-start scripts patch the routers's config template.

Requirements
------------

One of:

* OpenShift Enterprise 3.2
* OpenShift Container Platform 3.3 or later
* OpenShift Origin M5 1.3 or later.

Role Variables
--------------

| Name             | Default value    | Description                                                                                                    |
|------------------|------------------|----------------------------------------------------------------------------------------------------------------|
| routers          | None (Required)  | List of router DeploymentConfigs to configure                                                                  |
| prestart_scripts | None (Required)  | Dictionary of pre-start scripts to add to routers                                                              |
| env              | []               | List of dicts with `name` and `value` keys containing additional environment variables to configure on routers |

Dependencies
------------

* <https://github.com/appuio/ansible-module-openshift>

Example Usage
-------------

`meta/main.yml` of role using this role:

    dependencies:
    - src: git+https://github.com/appuio/ansible-role-openshift-haproxy
      version: v1.1.0
      prestart_scripts:
        patch-ipv6.sh: "{{ lookup('file', 'files/patch-ipv6.sh') }}"

Also see:

* <https://github.com/appuio/ansible-role-openshift-haproxy-ipv6>
* <https://github.com/appuio/ansible-role-openshift-haproxy-letsencrypt>

License
-------

Apache License Version 2.0

Author Information
------------------

APPUiO Team <info@appuio.ch>
