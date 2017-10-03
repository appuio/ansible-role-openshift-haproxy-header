OpenShift HAProxy Router Header Customization Role
==================================================

This Ansible role allows to configure HTTP header customizations in OpenShift HAProxy routers.
Currently supports setting HTTP request headers only.

Requirements
------------

One of:

* OpenShift Container Platform 3.4 or later
* OpenShift Origin M5 1.4 or later.

Role Variables
--------------

| Name               | Default value   | Description                                                                                                                                                                                                 |
|--------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| routers            | None (Required) | List of router DeploymentConfigs to configure                                                                                                                                                               |
| set_request_header | None            | Map of request headers to set. Configured with `http-request set-header` in the HAProxy config file. See https://cbonte.github.io/haproxy-dconv/configuration-1.5.html#4-http-request for more information  |

Example Usage
-------------

The following example changes the `Forwarded` request header to contain the port in the host attribute, which
is required by at least some Spring Boot versions.

`playbook.yml`:

    roles:
    - role: ansible-role-openshift-haproxy-header
      routers:
      - ha-router-ex1
      set_request_header:
        Forwarded: "for=%[src];host=%[req.hdr(host)]:%[dst_port];proto=%[req.hdr(X-Forwarded-Proto)]"

License
-------

Apache License Version 2.0

Author Information
------------------

APPUiO Team <info@appuio.ch>
