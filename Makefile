-include ./.env

# POC
init-poc: 
	cd environments/poc && terraform init

plan-poc:
	cd environments/poc && terraform plan -var-file=config.tfvars 

apply-poc:
	cd environments/poc && terraform apply -var-file=config.tfvars 

destroy-poc:
	cd environments/poc && terraform destroy -var-file=config.tfvars
