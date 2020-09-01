resource "helm_release" "cluster" {
  name  = "example"
  chart = "../charts/example"
}
