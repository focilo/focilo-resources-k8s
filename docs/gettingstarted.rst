Getting started
===============

First, install latest stable release of `reana-resources-k8` package:

.. code-block:: console

   $ pip install reana-resources

or use development version:

.. code-block:: console

   $ git clone https://github.com/reanahub/reana-resources-k8s.git
   Cloning into 'reana-resources-k8s'...
   remote: Counting objects: 131, done.
   remote: Total 131 (delta 0), reused 0 (delta 0), pack-reused 131
   Receiving objects: 100% (131/131), 36.03 KiB | 0 bytes/s, done.
   Resolving deltas: 100% (62/62), done.
   Checking connectivity... done.
   $ cd reana-resources-k8s
   $ pip install .
   Processing /home/rodrigdi/reanahub-forks/reana-resources-k8s
     Requirement already satisfied (use --upgrade to upgrade): reana-resources-k8s==0.0.1.dev20170123 from file:///home/rodrigdi/reanahub-forks/reana-resources-k8s in /home/rodrigdi/.virtualenvs/reana-resources-k8s/lib/python3.5/site-packages/reana_resources_k8s-0.0.1.dev20170123-py3.5.egg
   Building wheels for collected packages: reana-resources-k8s
     Running setup.py bdist_wheel for reana-resources-k8s ... done
     Stored in directory: /home/rodrigdi/.cache/pip/wheels/c7/22/44/782e373fa02c011646424f7830a9273af9b4a59970610e1255
   Successfully built reana-resources-k8s

Second, you can build resource manifests by doing:

.. code-block:: console

   $ reana-resources-k8s build-manifests
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/job-controller.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/message-broker.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/storage-admin.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/yadage-alice-worker.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/yadage-atlas-worker.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/yadage-cms-worker.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/yadage-lhcb-worker.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/workflow-controller.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/workflow-monitor.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/deployments/zeromq-msg-proxy.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/namespaces/alice.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/namespaces/atlas.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/namespaces/cms.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/namespaces/lhcb.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/resourcequotas/alice-quota.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/resourcequotas/atlas-quota.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/resourcequotas/cms-quota.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/resourcequotas/lhcb-quota.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/services/job-controller.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/services/message-broker.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/services/workflow-controller.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/services/workflow-monitor.yaml
   Created -> /home/rodrigdi/reanahub-forks/reana-resources-k8s/reana_resources_k8s/templates/../configuration-manifests/services/zeromq-msg-proxy.yaml

Once it is done, a directory called `configuration-manifests` with the following structure should be available:

.. code-block:: console

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


Lastly, instantiate the components using the CLI tool `kubectl` like follows:

.. code-block:: console

   $ kubectl create --recursive -f configuration-manifests
   deployment "job-controller" created
   deployment "message-broker" created
   deployment "workflow-controller" created
   deployment "workflow-monitor" created
   deployment "yadage-alice-worker" created
   deployment "yadage-atlas-worker" created
   deployment "yadage-cms-worker" created
   deployment "yadage-lhcb-worker" created
   deployment "zeromq-msg-proxy" created
   namespace "alice" created
   namespace "atlas" created
   namespace "cms" created
   namespace "lhcb" created
   resourcequota "alice-quota" created
   resourcequota "atlas-quota" created
   resourcequota "cms-quota" created
   resourcequota "lhcb-quota" created
   service "job-controller" created
   service "message-broker" created
   service "workflow-controller" created
   service "workflow-monitor" created
   service "zeromq-msg-proxy" created
   pod "storage-admin" created
