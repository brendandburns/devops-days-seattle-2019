provider "kubernetes" {
  config_context_cluster   = "bburns-aad"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "terraform-demo"
  }
}
