**Day 2: Fix a Broken JupyterLab Server Configuration**

A teammate has configured a JupyterLab server for the xFusionCorp Industries data science team; however, the server is not functioning as expected. Inspect the configuration, diagnose any issues, and start the server.

JupyterLab is already installed in the virtual environment at /root/code/ml-env/. The team's configuration file is at /root/code/jupyter_lab_config.py and is visible in the file explorer. Start the server with the config (e.g. /root/code/ml-env/bin/jupyter lab --config /root/code/jupyter_lab_config.py --allow-root, as the lab runs as root) and observe how it comes up so you can see what is misconfigured.

The end state must satisfy the following:

the running server listens on port 8888;
it binds on 0.0.0.0;
the notebook root directory is /root/notebooks/ (create the directory if it does not exist);
the server is still running when you click Check (the check connects to it on port 8888).
With the configuration corrected and JupyterLab running, the Jupyter UI button at the top of the lab opens the notebook interface.

**Solution**

* Change the configs from jupyter_lab_config.py
* Set the path to c.ServerApp.root_dir = '/root/notebooks'
* Run the command /root/code/ml-env/bin/jupyter lab --config /root/code/jupyter_lab_config.py --allow-root
* Click ports and check it is running.