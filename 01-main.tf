# Google bucket
resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
  uniform_bucket_level_access = true
}

# Public IAM binding for the bucket
resource "google_storage_bucket_iam_binding" "public_read" {
  bucket = google_storage_bucket.my_bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers"
  ]
}

# index.html file
resource "google_storage_bucket_object" "index_html" {
  name          = "index.html"
  bucket        = google_storage_bucket.my_bucket.name
  source        = "index.html"
  content_type  = "text/html"
}

# image files
resource "google_storage_bucket_object" "jandk_png" {
  name          = "Jandk.png"
  bucket        = google_storage_bucket.my_bucket.name
  source        = "Jandk.png"
  content_type  = "image/png"
}

resource "google_storage_bucket_object" "jandn_jpg" {
  name          = "JandN.jpg"
  bucket        = google_storage_bucket.my_bucket.name
  source        = "JandN.jpg"
  content_type  = "image/jpeg"
}

data "google_secret_manager_secret_version" "my_secret" {
  secret      = "terraform-gcp-secret"
  version     = "latest"
  provider    = google-beta
}

