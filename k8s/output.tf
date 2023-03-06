output "client_certificate" {
  value     = azurerm_kubernetes_cluster.mordor.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.mordor.kube_config_raw
  sensitive = true
}

output "default_node_pool" {
  value = azurerm_kubernetes_cluster.mordor.default_node_pool
}

output "identity_type" {
  value = azurerm_kubernetes_cluster.mordor.identity.0.type

}