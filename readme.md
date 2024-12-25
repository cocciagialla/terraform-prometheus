https://medium.com/@jayvardhanchandel/ultimate-guide-to-monitoring-logging-on-aws-eks-prometheus-grafana-loki-and-promtail-3a2a67c45ab1

Terraform module to install Prometheus by the official helm chart 

https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack

n.b.: uninistall CRDs manually

------------------
S3 configuration:
- Head over to the AWS S3 console and create a bucket with a unique name. 
- create an IAM policy in the AWS console. You can find the policy in confs/aws-s3-policy.json, but remember to add your bucket's ARN.
- ceate an IAM user, attach the policy, and create an access_key_id and secret_access_key