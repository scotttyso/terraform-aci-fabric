variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "dest_group_dn" {
  description = "Smart CallHome Destination Group Distinguished Name.  This should have already been created by the 'smart_callhome_dest' module"
  type        = string
}
