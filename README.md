
## 1. Recommended dev tools to use:

- OS: : `MAC OS, Linux Ubuntu`
- Development env: `Visual Studio Code (VS Code)`
- Terminal client: `Visual Studio Code terminal`

<br/>

## 2. Dependencies & prerequisities on a local PC:
### 2.1 &nbsp; For Linux OS:

  - 2.1.1 &nbsp; Install the latest available version of `Docker`: https://docs.docker.com/get-docker/

  - 2.1.2 &nbsp; Install the latest available version of `Docker compose`: https://docs.docker.com/compose/install/

  - 2.1.3 &nbsp; Disable docker compose v2 experimental features via the CLI, run: `docker-compose disable-v2`

  - 2.1.4 &nbsp; Clone the repo & navigate to the directory:

       `git clone https://github.com/badal-io/airflow2-local.git`

       `cd airflow2-local`

  - 2.1.5 &nbsp; Proceed with the installation and initialization steps (<strong> section #3 and #4 </strong>)

### 2.2 &nbsp; For MAC OS:

  - 2.2.1 &nbsp; Install the latest available version of `Docker Desktop`: https://docs.docker.com/get-docker/

  - 2.2.2 &nbsp; Disable docker compose v2 experimental features via the CLI, run: `docker-compose disable-v2`

  - 2.2.3 &nbsp; Clone the repo:

       `git clone https://github.com/badal-io/airflow2-local.git`

  - 2.2.4 &nbsp; Open the folder with `Visual Studio Code` (open folder)

  - 2.2.5 &nbsp; Open a terminal window `(Menu Terminal -- New Terminal)`

  - 2.2.6 &nbsp; Proceed with the installation and initialization steps (<strong> section #3 and #4 </strong>)

### 2.3 &nbsp; For Windows10 OS:

  - 2.3.1 &nbsp; Install WSL (Windows Linux Subsystem): https://docs.microsoft.com/en-us/windows/wsl/install-win10

  - 2.3.2 &nbsp; Install `Linux Ubuntu 20.04` distribution from the Microsoft Store

  - 2.3.3 &nbsp; Install the latest available version of `Docker Desktop`: https://docs.docker.com/get-docker/

  - 2.3.4 &nbsp; Launch the Linux subsystem in Windows (<strong> Start --> <Subsystem Name> </strong>)

  - 2.3.5 &nbsp; Always switch to `root` user and navigate back to `/home`

  - 2.3.6 &nbsp; Clone the repo & open the folder with Visual Studio Code (open folder):

       `git clone https://github.com/badal-io/airflow2-local.git`

  - 2.3.7 &nbsp; Run the docker istallatino script `./helpers/scripts/docker-wls.sh`

  - 2.3.8 &nbsp; Open Setting sin Docker Desktop, go to <strong> Resources --> WLS Integration </strong> and toggle the   `Ubuntu` subsytem

  - 2.3.9 &nbsp; Open Visual Studio Code and install a new plagin `Remote WLS`

  - 2.3.10 &nbsp; Once finished, you now see a WSL indicator in the bottom left corner, click on it and choose

      `New WSL window using Distro`

  - 2.3.11 &nbsp; Choose the subsytem frm the list and conenct.

  - 2.3.12 &nbsp; Once connected, open the (cloned repo) folder on the same VCS window (open folder)

  - 2.3.13 &nbsp; Open a terminal window `(Menu Terminal -- New Terminal)`

  - 2.3.14 &nbsp; Proceed with the installation and initialization steps (section #3 and #4)

<br/>

## 3. Dependencies to solve before you go
   ### 3.1

  - Add your Py dependencies to the `docker/requirements-airflow.txt` file

  - Adapt and install DAGs into the `dags` folder

  - Adapt and install Plugins into the `plugins` folder

  - Add variables to Airflow: `variables\airflow-vars.json` file

  - Add variables to Docker containers ENV: `variables\docker-env-vars` file, the file is added to the gitignore process

  - Add variables that contain secrets and API keys: `variables\docker-env-secrets` file, the file is added to the gitignore process

  - If there is a custom Airflow configuration file ready, uncomment the line in Dockerfile in order to includ it in the image: `COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg`

<br/>

### 3.2 GCP Project ID for GCP Connection

  - Set the projet-id varibale in the `variables/docker-env-vars` file:

     `GCP_PROJECT_ID='<project-id here>'`

<br/>

## 4. Initialization and run

  - 4.1 Open a termianl Run the following commands (for the first time only):

      `./helpers/scripts/init_airflow.sh`

  - 4.2 Start Airflow and all services:

      `docker-compose up`

  - 4.3 Authentificate for GCP services, run the follwing script:

      `./helpers/scripts/gcp-auth.sh`

  - 4.4  <strong> Airflow 2 local dev is ready!!! </strong>

<br/>

## 5. Commands for operations & maintenance:

  - To stop all Airflow containers (via a new terminal session):

    `docker-compose down`

  - To rebuild containers (if changes are aplied on dockerfile/docker-compose):

    `docker-compose down`

    `docker-compose up --build`

  - To cleaning up all containers and remove database:

    `docker-compose down --volumes --rmi all`

<br/>

## 6. Commands for working inside a container:

  - To run unit tests navigate to the `tests` directory and run the following command:

     `./airflow "test command"`

    example:

     <strong> `cd tests && ./airflow "pytest tests/unit"` </strong>

  - To run integration tests with GCP navigate to the `tests` directory and run the following command:

     `./airflow "test command"`

    example:

     <strong> `cd tests && ./airflow "pytest --tc-file tests/integration/config.ini -v tests/integration"`  </strong>

  - To spin up an Ops container with Bash session:

     `./tests/airflow bash`

  - To print Airflow info:

     `./tests/airflow info`

  - To lauch a python session in Airflow:

     `./tests/airflow python`

  - To access the Airflow Web UI:

     `localhost:8080`

<br/>

## 7. Code linting and stying - Pre commit ##

  - 7.1 Install pre-commit app:

    - For Linux/Windows `pip3 install pre-commit`

    - For MAC-OS `brew install pre-commit`


  - 7.2 Run a pre commit initialization command (inside the same dir where the code was cloned):

    `pre-commit install`

  - 7.3 Run pre-commit tests:     `pre-commit run --all-files`
