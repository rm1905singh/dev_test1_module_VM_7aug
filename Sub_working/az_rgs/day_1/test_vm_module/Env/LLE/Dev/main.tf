module "m_rg" {
  source  = "../../../module/1_rg"
  rg_name = var.rg_name
}
module "m_vent" {
  depends_on = [module.m_rg]
  source     = "../../../module/2_vnet"
  vnets      = var.vnets

}
module "m_subnet" {
  depends_on = [module.m_vent]
  source     = "../../../module/3_subnet"
  subnets    = var.subnets

}
module "m_nic" {
  depends_on = [module.m_subnet]
  source     = "../../../module/4_nic"
  nics       = var.nics

}
module "m-pip" {
  depends_on = [module.m_nic]
  source     = "../../../module/5_pip"
  pips       = var.pips

}

module "m_nsg" {
  depends_on = [module.m-pip]
  source     = "../../../module/6_nsg"
  nsgs       = var.nsgs
  security   = var.security_rule
}
module "m_nsgas" {
  depends_on = [module.m_nsg]
  source     = "../../../module/7_nsg_ass"
  nsgass     = var.nsgass

}
module "m_vm" {
  depends_on = [module.m_nsgas]
  source     = "../../../module/8_vm"
  vms        = var.vms

}

#module "m_ab" {
#  depends_on = [module.m_vm]
# source     = "../../../module/9_az_basion"
#azbasions  = var.azbasions
#}
