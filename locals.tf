locals {
    name_prefix = "${var.prefix}"
    name_suffix = "${lookup(var.envname, var.my_environment, "-WARNING-UNEXPECTED-ENVIRONMENT")}"
}