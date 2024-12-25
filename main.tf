# Install prometheus helm_chart
resource "helm_release" "prometheus" {
  create_namespace = true
  namespace        = "monitoring"
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts/"
  chart            = "kube-prometheus-stack"
  version          = var.chart_version
  values           = [var.values_yaml_body]
}

resource "helm_release" "loki" {
  create_namespace = true
  namespace        = "monitoring"
  name             = "loki"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "loki-distributed"
  version          = var.loki_chart_version
  values           = [templatefile("${path.module}/confs/custom_loki_distributed_values.yml", {
    AWS_ACCESS_KEY_ID = var.s3_bucket_data.aws_access_key_id,
    AWS_SECRET_ACCESS_KEY = var.s3_bucket_data.aws_secret_access_key,
    NAME_OF_BUCKET = var.s3_bucket_data.name_of_bucket,
    REGION = var.s3_bucket_data.region
  })]


  depends_on = [
    helm_release.prometheus
  ]
}

resource "kubectl_manifest" "loki_gateway_headless_svc" {
  yaml_body = file("${path.module}/confs/loki-gateway-headless-svc.yaml")

  depends_on = [
    helm_release.loki
  ]
}

resource "helm_release" "promtail" {
  create_namespace = true
  namespace        = "monitoring"
  name             = "promtail"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "promtail"
  version          = var.promtail_chart_version
  #values           = [var.values_yaml_body]

  depends_on = [
    kubectl_manifest.loki_gateway_headless_svc
  ]
}



