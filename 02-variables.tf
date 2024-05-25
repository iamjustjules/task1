variable "project_id" {
  description = "The Google Cloud project ID."
  default     = "terraform-gcp-justjules"
  type = string
}

variable "region" {
  description = "The region in which the bucket will be created."
  default     = "us-central1"
}

variable "credentials" {
  description = "The path to the service account key file."
  default     = "C:\\Users\\Julie\\OneDrive\\Documents\\Career\\Tools\\BlackManosphere\\01-GCP\\20240511/terraform-gcp-justjules-793f0d4e098d.json"
}
variable "bucket_name" {
  description = "The name of the GCS bucket."
  default     = "terraform-gcp-justjules-task1"
}

