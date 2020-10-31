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

## inherited from vpc
- vpcのcidr
- route tableのcidr
- subnetのcidr
- subnetのaz

# output
- vpcのid
- subnetのid
- security groupのid

# コマンド
- terraform init
- terraform plan
- terraform apply
- terraform destroy
