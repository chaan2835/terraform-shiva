### outputs

outputs are used to show the data from aws what we are creating so that we can see the data in our console at the time of creating the infra itself.
========================================
syntax
```
output "name-we-prefer"{
    value = ""
}
```
========================================
example

```
output "ip_address" {
  value = aws_instance.sample-instance-1.public_ip
}
```
========================================
# Data Sources

These are used to fetch the info from the cloud.
The information is used as inputs for our infrastructure