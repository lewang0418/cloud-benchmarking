# cloud-benchmarking
aria init -b ecs -p ecs-simple.yaml -i ecs-simple-inputs.yaml --install-plugins
aria execute -w install -b ecs --task-retries 10 --task-retry-interval 10
aria execute -w uninstall -b ecs --task-retries 10 --task-retry-interval 10

aria init -b rds -p rds-simple.yaml -i ecs-simple-inputs.yaml --install-plugins
aria execute -w install -b rds --task-retries 10 --task-retry-interval 10
aria execute -w uninstall -b rds --task-retries 10 --task-retry-interval 10
