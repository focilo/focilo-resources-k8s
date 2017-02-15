Getting started
===============

To be able to deploy the REANA system, the Kubernetes configuration must be generated. In order to do so, we should do the following.

.. code-block:: sh

   $ python setup.py install
   $ reana-resources-k8s build-manifests

Once we have done it, we should be able to see the directory `configuration-manifests` with the following structure:

.. code-block:: sh

   $ tree reana_resources_k8s/configuration-manifests/
   reana_resources_k8s/configuration-manifests/
   ├── deployments
   │   ├── job-controller.yaml
   │   ├── message-broker.yaml
   │   ├── storage-admin.yaml
   │   ├── workflow-controller.yaml
   │   ├── workflow-monitor.yaml
   │   ├── yadage-alice-worker.yaml
   │   ├── yadage-atlas-worker.yaml
   │   ├── yadage-cms-worker.yaml
   │   ├── yadage-lhcb-worker.yaml
   │   └── zeromq-msg-proxy.yaml
   ├── namespaces
   │   ├── alice.yaml
   │   ├── atlas.yaml
   │   ├── cms.yaml
   │   └── lhcb.yaml
   ├── resourcequotas
   │   ├── alice-quota.yaml
   │   ├── atlas-quota.yaml
   │   ├── cms-quota.yaml
   │   └── lhcb-quota.yaml
   └── services
       ├── job-controller.yaml
       ├── message-broker.yaml
       ├── workflow-controller.yaml
       ├── workflow-monitor.yaml
       └── zeromq-msg-proxy.yaml


Then, the next step would be to instantiate the components using the CLI tool `kubectl` like:

.. code-block:: sh

   $ kubectl create --recursive -f configuration-manifests
