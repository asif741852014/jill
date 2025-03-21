module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"
  vpcid = module.vpc.vpcid
}

module "iam" {
  source = "./modules/iam"
  
}

module "eks" {
  source                = "./modules/eks"
  master_arn            = module.iam.master_arn
  public_subnet_az1_id = module.iam.subnet_1
  public_subnet_az2_id = module.iam.subnet_2
  worker_arn            = module.iam.worker_arn
  instance_size         = "t2.medium"
  eks_security_group_id = module.sg.sgid

  
  }