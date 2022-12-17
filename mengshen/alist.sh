#!/bin/bash
cat /dev/null :> .replit
cat > .replit <<-EOF
run = ["bash", "main.sh"]
language = "bash"
entrypoint = "main.sh"

[env]
DB_TYPE="sqlite3"
DB_HOST=""
DB_PORT=""
DB_USER=""
DB_PASS=""
DB_NAME=""
DB_FILE="data/data.db"
DB_TABLE_PREFIX="x_"
DB_SLL_MODE="true"
EOF

rm -rf replit.nix

cat /dev/null :> main.sh
cat > main.sh <<-EOF
# rm -rf alist* data/ #Uncomment this line to update
if [ ! -f "alist" ];then
  curl -L https://github.com/alist-org/alist/releases/download/v3.6.0/alist-linux-amd64.tar.gz
  tar -zxvf alist.tar.gz
  rm -f alist.tar.gz
fi
./alist admin
echo -e "\e[45m 上面的password后面的字符就是你的密码 \e[0m"
echo -e "\033[32m 开始运行项目 \033[0m"
./alist server --no-prefix
EOF

sh main.sh