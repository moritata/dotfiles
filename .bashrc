# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
export AWS_CREDENTIAL_FILE=/home/ec2-user/.aws/credential-file.txt
export EC2_PRIVATE_KEY=~/.aws/pk-ULUGJGSZJ7KBOTULIFST73LZI757AGYT.pem
export EC2_CERT=~/.aws/cert-ULUGJGSZJ7KBOTULIFST73LZI757AGYT.pem
export EC2_URL=http://ec2.ap-northeast-1.amazonaws.com/

