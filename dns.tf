resource "hashicorp_record" "www" {
  domain = "https://first_test.com"
  type   = "A"
  name   = "@"
  value  = hashicorp_droplet.web.ipv4_address
}
