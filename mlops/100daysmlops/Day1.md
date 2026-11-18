**Day 1: Create a Python Virtual Environment for ML**

The xFusionCorp Industries data science team requires a standardized Python environment for their new machine learning project. Set up a virtual environment on the controlplane host that includes all necessary ML libraries.


The work is done on the controlplane host under /root/code/.

The end state must satisfy the following:

a Python virtual environment named ml-env exists under /root/code/;
the environment has numpy, pandas, scikit-learn, and matplotlib installed;
a requirements.txt capturing the installed packages is saved at /root/code/requirements.txt.

**Errors**:

Virtual environment directory '/root/code/ml-env' does not exist for full solution please refer to https://github.com/kodekloudhub/100-days-of-mlops-solutions

numpy cannot be imported in the venv: Traceback (most recent call last):

Virtual environment directory '/root/code/ml-env' does not exist for full solution please refer to https://github.com/kodekloudhub/100-days-of-mlops-solutions


**Solution**

* Open your terminal, navigate to your project folder using cd path/to/your/project, and run the creation command.
venv is a common standard like a virtual environment. Inside which isolated python libraries will be installed in the folder ml-env.
This separates python dependencies installed on the machine to python dependencies available on the virtual environment.  

*python3 -m venv ml-env*

* Activate the Virtual Environment:
Once created, activate the environment so your terminal uses its isolated Python interpreter.

*source ml-env/bin/activate*

* Install libraries. Run python -m pip install <package-name> to add dependencies.

*python3 -m pip install numpy pandas scikit-learn matplotlib*

* Save dependencies. Run pip freeze > requirements.txt to record your installed packages for sharing.

*pip freeze > requirements.txt*