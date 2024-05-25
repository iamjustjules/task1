output "website_url" {
  value       = "http://${google_storage_bucket.my_bucket.name}.storage.googleapis.com/index.html"
  description = "URL of the static website."
}

output "secret_value" {
  value       = data.google_secret_manager_secret_version.my_secret.secret_data
  description = "The value of the fetched secret."
  sensitive   = true  
}
