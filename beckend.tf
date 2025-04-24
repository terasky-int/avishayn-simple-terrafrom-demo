terraform {
  backend "remote" {
    organization = "Terasky"

    workspaces {
      name = "avishayn-simple-terrafrom-demo"
    }
  }
}
