output "definition" {
  description = "Object representing the container definition."
  value = {
    name              = var.name
    cpu               = var.cpu
    memoryReservation = var.memory
    essential         = var.essential
    image             = var.image
    environment       = var.env_vars
    secrets           = var.secrets
    mountPoints       = var.mounts
    portMappings      = var.ports
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = var.log_group_name
        awslogs-region        = data.aws_region.current.name
        awslogs-stream-prefix = coalesce(var.stream_prefix, var.name)
      }
    }
  }
}
