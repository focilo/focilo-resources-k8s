Getting started
===============

First, install latest stable release of `reana-resources-k8` package:

.. code-block:: console

   $ pip install reana-resources

or use development version:

.. code-block:: console

   $ mkvirtualenv reana-resources-k8s
   Using base prefix '/usr'
   New python executable in $HOME/.virtualenvs/test/bin/python3
   Also creating executable in $HOME/.virtualenvs/test/bin/python
   Installing setuptools, pip, wheel...done.
   virtualenvwrapper.user_scripts creating $HOME/.virtualenvs/test/bin/predeactivate
   virtualenvwrapper.user_scripts creating $HOME/.virtualenvs/test/bin/postdeactivate
   virtualenvwrapper.user_scripts creating $HOME/.virtualenvs/test/bin/preactivate
   virtualenvwrapper.user_scripts creating $HOME/.virtualenvs/test/bin/postactivate
   virtualenvwrapper.user_scripts creating $HOME/.virtualenvs/test/bin/get_env_details
   $ git clone https://github.com/reanahub/reana-resources-k8s.git
   Cloning into 'reana-resources-k8s'...
   remote: Counting objects: 131, done.
   remote: Total 131 (delta 0), reused 0 (delta 0), pack-reused 131
   Receiving objects: 100% (131/131), 36.03 KiB | 0 bytes/s, done.
   Resolving deltas: 100% (62/62), done.
   Checking connectivity... done.
   $ cd reana-resources-k8s
   $ pip install .
   Processing $HOME/private/src/reana-resources-k8s
   Collecting jinja2-cli>=0.6.0 (from reana-resources-k8s==0.0.1.dev20170123)
     Using cached jinja2_cli-0.6.0-py2.py3-none-any.whl
   Collecting PyYAML>=3.12 (from reana-resources-k8s==0.0.1.dev20170123)
   Collecting jinja2 (from jinja2-cli>=0.6.0->reana-resources-k8s==0.0.1.dev20170123)
     Using cached Jinja2-2.9.5-py2.py3-none-any.whl
   Collecting MarkupSafe>=0.23 (from jinja2->jinja2-cli>=0.6.0->reana-resources-k8s==0.0.1.dev20170123)
   Building wheels for collected packages: reana-resources-k8s
     Running setup.py bdist_wheel for reana-resources-k8s ... done
     Stored in directory: $HOME/.cache/pip/wheels/e0/37/f6/aae65584a32d4d0918c0332d67e75bf7946c5ce641752efcd4
   Successfully built reana-resources-k8s
   Installing collected packages: MarkupSafe, jinja2, jinja2-cli, PyYAML, reana-resources-k8s
   Successfully installed MarkupSafe-1.0 PyYAML-3.12 jinja2-2.9.5 jinja2-cli-0.6.0 reana-resources-k8s-0.0.1.dev20170123

Second, you can build resource manifests by doing:

.. code-block:: console

   $ reana-resources-k8s build-manifests
   Created -> $HOME/reana/configuration-manifests/deployments/job-controller.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/message-broker.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/storage-admin.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/yadage-alice-worker.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/yadage-atlas-worker.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/yadage-cms-worker.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/yadage-lhcb-worker.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/workflow-controller.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/workflow-monitor.yaml
   Created -> $HOME/reana/configuration-manifests/deployments/zeromq-msg-proxy.yaml
   Created -> $HOME/reana/configuration-manifests/namespaces/alice.yaml
   Created -> $HOME/reana/configuration-manifests/namespaces/atlas.yaml
   Created -> $HOME/reana/configuration-manifests/namespaces/cms.yaml
   Created -> $HOME/reana/configuration-manifests/namespaces/lhcb.yaml
   Created -> $HOME/reana/configuration-manifests/resourcequotas/alice-quota.yaml
   Created -> $HOME/reana/configuration-manifests/resourcequotas/atlas-quota.yaml
   Created -> $HOME/reana/configuration-manifests/resourcequotas/cms-quota.yaml
   Created -> $HOME/reana/configuration-manifests/resourcequotas/lhcb-quota.yaml
   Created -> $HOME/reana/configuration-manifests/services/job-controller.yaml
   Created -> $HOME/reana/configuration-manifests/services/message-broker.yaml
   Created -> $HOME/reana/configuration-manifests/services/workflow-controller.yaml
   Created -> $HOME/reana/configuration-manifests/services/workflow-monitor.yaml
   Created -> $HOME/reana/configuration-manifests/services/zeromq-msg-proxy.yaml


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
