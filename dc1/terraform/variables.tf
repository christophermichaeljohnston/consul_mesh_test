variable "cluster_name" {
  type    = string
  default = "dc1"
}

variable "cluster_version" {
  type    = string
  default = "1.26"
}

variable "vpc_id" {
  type    = string
  default = "setme"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["setme"]
}

variable "eks_managed_node_groups" {
  type = map(any)
  default = {
    "consul" : {
      "name" : "consul"
    }
  }
}

variable "eks_managed_node_group_defaults" {
  default = {
    "min_size" : "3",
    "max_size" : "5",
    "desired_size" : "3",
    "instance_types" : ["t3.medium"],
    "capacity_type" : "ON_DEMAND",
    "update_config" : {
      "max_unavailable" : "1"
    },
    "iam_role_additional_policies" : {
      "AmazonEBSCSIDriverPolicy" : "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    },
    "block_device_mappings" : {
      "xvda" : {
        "device_name" : "/dev/xvda"
        "ebs" : {
          "volume_size"           = "50"
          "volume_type"           = "gp3"
          "delete_on_termination" = "true"
        }
      }
    }
  }
}

variable "node_security_group_additional_rules" {
  type = any
  default = {
    "ingress_self_all" : {
      "description" : "Node to node all ports/protocols"
      "protocol" : "-1"
      "from_port" : "0"
      "to_port" : "0"
      "type" : "ingress"
      "self" : "true"
    },
    "ingress_cluster_all" : {
      "description" : "Cluster to node all ports/protocols"
      "protocol" : "-1"
      "from_port" : "0"
      "to_port" : "0"
      "type" : "ingress"
      "source_cluster_security_group" : "true"
    },
    "egress_all" = {
      "description" : "Node all egress"
      "protocol" : "-1"
      "from_port" : "0"
      "to_port" : "0"
      "type" : "egress"
      "cidr_blocks" : ["0.0.0.0/0"]
      "ipv6_cidr_blocks" : ["::/0"]
    }
  }
}
