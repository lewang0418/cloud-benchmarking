# cloud-benchmarking

This repository contains a TOSCA blueprint for running benchmarking workflows of computing instances and MySQL instances

The contents of this repository:

- The Blueprint that you will execute to install benchmarking packages, run benchmarking and collect results.
- The supporting scripts.


## How to Execute this Blueprint for ECS (Elastic Computing Service) instances

### Step 1: Initialize

`aria init -b ecs -p ecs-simple.yaml -i ecs-simple-inputs.yaml --install-plugins`

### Step 2: Install to start to install and run workflows

Then run the `install` workflow:

`aria execute -w install -b ecs --task-retries 10 --task-retry-interval 10`

### Step 3: Uninstall to collect results

To uninstall the application we run the `uninstall` workflow:

`aria execute -w uninstall -b ecs --task-retries 10 --task-retry-interval 10`


## How to Execute this Blueprint for RDS (Relational Database Services) instances

### Step 1: Initialize

`aria init -b rds -p rds-simple.yaml -i rds-simple-inputs.yaml --install-plugins`

### Step 2: Install to start to install and run workflows

Then run the `install` workflow:

`aria execute -w install -b rds --task-retries 10 --task-retry-interval 10`

### Step 3: Uninstall to collect results

To uninstall the application we run the `uninstall` workflow:

`aria execute -w uninstall -b rds --task-retries 10 --task-retry-interval 10`


## Note
You need to modify the `ecs-simple-inputs.yaml` and `rds-simple-inputs.yaml` according to your own environment, e.g endpoint of ECS and RDS instances, and log server, etc.



