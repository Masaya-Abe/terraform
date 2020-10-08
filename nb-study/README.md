# 手順

## Terraform 準備

https://qiita.com/mintak21/items/4a11e084229a1c5915fb

## Terraform plan / apply

TODO

# コマンド集

## user_data_base64 生成

```
cat ec2_user_data.sh | openssl enc -e -base64
```

## ssh 用 key pair 作成

```
ssh-keygen -t rsa -f ~/.ssh/nb-study-key -N ''
```

## 作成した EC2 に ssh 接続

```
ssh -i ~/.ssh/nb-study-key ec2-user@xxx.xxx.xxx.xxx
```

# 参考

◯  Terraform AWS Docs (最新)

https://registry.terraform.io/providers/hashicorp/aws/latest/docs

◯  ECR, ECS を使う場合

https://y-ohgi.com/introduction-terraform/
