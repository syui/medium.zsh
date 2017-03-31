## medium.zsh

- jq, zsh

https://github.com/Medium/medium-api-docs

`medium.json` : https://medium.com/me/applications

```bash
$ medium.zsh help

$ medium.zsh m
{
  "data": {
    "id": "5303d74c64f66366f00cb9b2a94f3251bf5",
    "username": "majelbstoat",
    "name": "Jamie Talbot",
    "url": "https://medium.com/@majelbstoat",
    "imageUrl": "https://images.medium.com/0*fkfQiTzT7TlUGGyI.png"
  }
}

# post
$ cat medium.json|jq .body
$ cat body.json
$ medium.zsh p
```

## Author

Syuu Ichinose (a.k.a. syui)


