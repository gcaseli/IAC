variable "memory_size" {
  description = "quantida máxima de memória que a lambda vai usar"
}

variable "timeout" {
  description = "tempo máximo de execução da lambda"
}

variable "role_arn" {}

variable "tags" {
  type = "map"
}