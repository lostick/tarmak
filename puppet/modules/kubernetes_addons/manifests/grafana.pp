class kubernetes_addons::grafana(
  $image=$::kubernetes_addons::params::grafana_image,
  $version=$::kubernetes_addons::params::grafana_version,
) inherits ::kubernetes_addons::params {
  require ::kubernetes

  if $::prometheus::mode == 'Full' {
    kubernetes::apply{'heapster-grafana':
      manifests => [
        template('kubernetes_addons/grafana-svc.yaml.erb'),
        template('kubernetes_addons/grafana-deployment.yaml.erb'),
      ],
    }
  }
}
