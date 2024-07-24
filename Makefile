-include ./.env

# POC
init-poc: 
	cd environment/poc && terraform init

plan-poc:
	cd environment/poc && terraform plan -var-file=config.tfvars 

apply-poc:
	cd environment/poc && terraform apply -var-file=config.tfvars 

destroy-poc:
	cd environment/poc && terraform destroy -var-file=config.tfvars
