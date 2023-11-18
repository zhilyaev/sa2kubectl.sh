# sa2kubectl.sh

## Install

```bash
wget https://raw.githubusercontent.com/zhilyaev/sa2kubectl.sh/main/sa2kubectl.sh
chmod +x sa2kubectl.sh
```

## How to use?

```bash
export cluster=<cosmetic name>
export server=<server address>
export secret=<sa-secret>
export sa=<app-role>
export ns=<sa-ns>

./sa2kubectl.sh
```
