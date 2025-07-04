resource "kubernetes_cluster_role" "cluster_role" {
  metadata {
    name = var.namespace
  }

  rule {
    api_groups = ["", "demeter.run", "networking.k8s.io", "gateway.networking.k8s.io", "configuration.konghq.com", "coordination.k8s.io"]
    resources  = ["*"]
    verbs      = ["*"]
  }
}

resource "kubernetes_cluster_role_binding" "cluster_role_binding" {
  metadata {
    name = var.namespace
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = var.namespace
  }
  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = var.namespace
  }
}
