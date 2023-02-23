# Install prometheus helm_chart
resource "helm_release" "prometheus" {
  create_namespace = true
  namespace        = "kube-system"
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts/"
  chart            = "prometheus"
  version          = var.chart_version
}



