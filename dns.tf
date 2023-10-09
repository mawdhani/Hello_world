resource "hashicorp_record" "www" {
  domain = "https://madhuri.com"
  type   = "A"
  name   = "@"
  value  = hashicorp_droplet.web.ipv4_address
}