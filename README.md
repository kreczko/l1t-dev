# Docker for L1T development
While most of the CMS services and software will run on dedicated Scientific
Linux 6 or CentOS 7 machines, the developers OS might be very different.
In order to facilitate code development on local hardware, this project provides
several [docker containers](https://www.docker.com/) for the CMSSW software and
DQM GUI. The whole setup (CMSSW + DQM GUI) uses [docker-compose](https://docs.docker.com/compose/)
for configuration.

After start the DQM GUI will become available under [http://localhost:8060/dqm/dev](http://localhost:8060/dqm/dev)
(start-up time is 30-60s) and the current directory will be available in the CMSSW container (more later).


## Prerequisites
 1. Install [Docker](https://www.docker.com)
 2. Install docker-compose: `pip install -U docker-compose`

## Development workflow

### Before starting the containers
When starting to work with this setup, it needs to be adjusted for your machine first.
Firstly, run the following commands to get the code:

```bash
git clone https://github.com/kreczko/l1t-dev.git
cd l1t-dev
```

Next, adjust (if needed) the following parameters in `setup.sh`:
```bash
export CMSSW_VERSION="CMSSW_<version>"
export SCRAM_ARCH="<scram arch>"
```
which define which CMSSW version to set up. You can create additional CMSSW project
areas later on, but this specific version will be automatically set up for you.

Finally, please run the following script:
```bash
./first-time-only.sh
```
It will create the necessary folder structure and build the containers
specifically for your system (user ID, etc).

### Starting the containers
To start the containers, simply run
```
./start.sh
```
and you will be automatically placed into the CMSSW container (path `/code`).
By default `/code` inside the container is mapped to `l1t-dev/dev` on your host machine.
It is recommended you run any editor to change the code on the host machine.

### Data access
By default this setup will map `l1t-dev/dev/data` on your host to `/data` inside the container.
Please put any files you want to analyse locally into that folder.
The DQM container will mount your grid certificate, so you can use it for remote data access.
To do so, run
```
source /scripts/setup_grid.sh
```
and you will be asked for your grid certificate password.

**Getting samples**: TBD
For EG:
 - dataset=/DoubleEG/Run2016D-ZElectron-23Sep2016-v1/RAW-RECO

For Jet & Sums:
 - /SingleMuon/Run2016D-ZMu-23Sep2016-v1/RAW-RECO

### Running DQM workflow
TBD

### Uploading to DQM GUI

```bash
/scripts/upload_to_dqm_gui.sh <file to upload>
```
