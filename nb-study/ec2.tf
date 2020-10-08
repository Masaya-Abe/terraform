resource "aws_key_pair" "nb-study-key" {
  key_name   = "nb-study-key"
  public_key = file("~/.ssh/nb-study-key.pub")
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


resource "aws_instance" "web_pu1a" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_1a.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [
    aws_security_group.nb-study-web-instance.id
  ]

  user_data_base64 = <<EOF
IyEvYmluL3NoCgpzdWRvIHl1bSAteSBpbnN0YWxsIGdjYy1jKysKc3VkbyB5dW0g
LXkgaW5zdGFsbCBnaXQKCmdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vbnZt
LXNoL252bS5naXQgfi8ubnZtCnNvdXJjZSB+Ly5udm0vbnZtLnNoCgplY2hvIC1l
IC1uICJcbmlmIFtbIC1zIH4vLm52bS9udm0uc2ggXV0gOyB0aGVuXG4gICBzb3Vy
Y2Ugfi8ubnZtL252bS5zaFxuZmlcblxuIiA+PiB+Ly5iYXNoX3Byb2ZpbGUKCm52
bSBpbnN0YWxsIHYxMi4xOC4zCm52bSB1c2UgdjEyLjE4LjMKbnBtIGluc3RhbGwg
ZXhwcmVzcy1nZW5lcmF0b3IgLWcKCm1rZGlyIGFwcApjZCBhcHAvCmV4cHJlc3Mg
c2FtcGxlLWFwcApjZCBzYW1wbGUtYXBwCm5wbSBpbnN0YWxsCm5vZGUgLi9iaW4v
d3d3ICYK
EOF
  key_name = aws_key_pair.nb-study-key.id

}

resource "aws_instance" "web_pu1c" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_1c.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.nb-study-key.id
  vpc_security_group_ids      = [
    aws_security_group.nb-study-web-instance.id
  ]

  user_data_base64 = <<EOF
IyEvYmluL3NoCgpzdWRvIHl1bSAteSBpbnN0YWxsIGdjYy1jKysKc3VkbyB5dW0g
LXkgaW5zdGFsbCBnaXQKCmdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vbnZt
LXNoL252bS5naXQgfi8ubnZtCnNvdXJjZSB+Ly5udm0vbnZtLnNoCgplY2hvIC1l
IC1uICJcbmlmIFtbIC1zIH4vLm52bS9udm0uc2ggXV0gOyB0aGVuXG4gICBzb3Vy
Y2Ugfi8ubnZtL252bS5zaFxuZmlcblxuIiA+PiB+Ly5iYXNoX3Byb2ZpbGUKCm52
bSBpbnN0YWxsIHYxMi4xOC4zCm52bSB1c2UgdjEyLjE4LjMKbnBtIGluc3RhbGwg
ZXhwcmVzcy1nZW5lcmF0b3IgLWcKCm1rZGlyIGFwcApjZCBhcHAvCmV4cHJlc3Mg
c2FtcGxlLWFwcApjZCBzYW1wbGUtYXBwCm5wbSBpbnN0YWxsCm5vZGUgLi9iaW4v
d3d3ICYK
EOF
}
