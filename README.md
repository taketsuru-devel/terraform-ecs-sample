# 環境
amazon linux2
v0.13.0

# terraform勉強中
- ec2インスタンスを使ったvpc

# できるもの
- ec2インスタンスを使ったvpc

# input
- project名
- cluster名
- ec2のkeypair
- ec2のimage_id

# output
- vpcのid
- vpcのsubnet_ids
- vpcのsecurity_group_id

## inherited from vpc
- vpcのcidr
- subnetの{cidr,az}のlist

# コマンド
- terraform init
- terraform plan
- terraform apply
- terraform destroy
