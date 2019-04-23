provider "kubernetes" {
  config_context_cluster   = "bburns-aad"
}

resource "kubernetes_service" "example" {
  metadata {
    name = "${var.name}"
    namespace = "${var.namespace}"
  }

  spec {
    selector {
      app = "${var.name}"
    }
    port {
      port = 80
      target_port = 80
    } 
  }
}

resource "kubernetes_replication_controller" "example" {
  metadata {
    name = "${var.name}"
    namespace = "${var.namespace}"
    labels {
      app = "${var.name}"
    }
  }

  spec {
    selector {
      app = "${var.name}"
    }
    replicas = "${var.replicas}"
    template {
      volume {
        name = "content"
        empty_dir {}
      }
      container {
        name = "busybox"
        image = "busybox"
        command = [ "sh", "-c", "while true; do echo $(hostname) v1 > /data/index.html; sleep 60; done" ]
        volume_mount {
          name = "content"
          mount_path = "/data"
        }
      }
      container {
        image = "nginx:1.7.8"
        name  = "web"
        volume_mount {
          name = "content"
          mount_path = "/usr/share/nginx/html"
          read_only = true
        }
      }
    }
  }
}
