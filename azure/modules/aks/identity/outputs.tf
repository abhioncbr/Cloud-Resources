output "kube_config" {
  value = azurerm_kubernetes_cluster.aks-identity-cluster.kube_config_raw
}