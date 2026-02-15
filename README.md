# Scripts

A collection of handy shell scripts.

---

## copy-repo.sh

Copy a GitHub repo's contents into the current directory (without `.git`).

```bash
curl -sO https://raw.githubusercontent.com/akstspace/scripts/main/copy-repo.sh && chmod +x copy-repo.sh
```

```bash
./copy-repo.sh <repo-url> [branch]
```

```bash
# examples
./copy-repo.sh https://github.com/user/repo
./copy-repo.sh https://github.com/user/repo main
```
