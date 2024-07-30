## Deploy EC2 Instance , VPC , Public & Private Subnet, IG and Route Table with Terraform Script and Github Action Workflow


#Create .pem file to access ec2 instance using ssh-keygen 

```shell
    ssh-keygen
```
#Enter...Enter...Enter... ,you got your keys. Rename it as .pem and .pub should be look like below 

```shell
   your_key_pair.pem
   your_key_pair.pub
``` 


#Step 1 : Initialize the Terraform

```shell
terraform init

```

#Step 2 : Check the configuration plan

```shell
terraform plan

```

#Step 3 : Apply the configuration with custome input variable

```shell
terraform apply -var "instance_name=your_instance_name"  -var "key_pair_name=your_key_pair"  -var "volume_size=30"  -var "instance_type=t3.micro"  -auto-approve

``` 

#Step 4 : Clean Up 

```shell
terraform destroy

```


❓Questions

If you found a bug, have a question or an idea 💡, don't hesitate to create new issues.

## Contributions
If you find any issues or have suggestions for improvements, please open an issue or create a pull request.
All contributions are welcome.🙏

By Akshay Patil


## License
This project is licensed under the MIT License 

