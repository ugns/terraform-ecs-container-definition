variable "name" {
  type        = string
  description = "Name of the container."
}

variable "cpu" {
  type        = number
  default     = 0
  description = "Number of CPU allocation."
}

variable "memory" {
  type        = number
  default     = 0
  description = "Number of memory allocation."
}

variable "essential" {
  type        = bool
  default     = true
  description = "If true and that container fails or stops for any reason, all other containers that are part of the task are stopped."
}

variable "image" {
  type        = string
  description = "The image used to start a container. This string is passed directly to the Docker daemon. Images in the Docker Hub registry are available by default. Other repositories are specified with either repository-url/image:tag or repository-url/image@digest."
}

variable "env_vars" {
  type        = list(object({ name = string, value = string }))
  default     = []
  description = "Environment variables to pass to the container on startup."
}

variable "secrets" {
  default     = []
  type        = list(object({ name = string, valueFrom = string }))
  description = "List of secrets to pass to the container on startup."
}

variable "mounts" {
  default     = []
  type        = list(object({ sourceVolume = string, containerPath = string }))
  description = "List of mount points inside the container."
}

variable "ports" {
  default     = []
  type        = list(object({ containerPort = number, protocol = string }))
  description = "List of ports exposed by the container with their protocol."
}

variable "log_group_name" {
  type        = string
  description = "Name of the log group the docker container will ship its logs to. Log will be shipped to a log stream whose name will be prefixed with the container name or optional stream prefix."
}

variable "stream_prefix" {
  default     = ""
  type        = string
  description = "Value of the log stream prefix the docker container will ship its logs to."
}
