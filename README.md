### jupyter-vscode

Based on this [Dockerfile](https://gist.github.com/dirkcgrunwald/d3d5669e291e8249f5b4f6ad8b6c1f46)

### To run:

```
docker run -it -p 8888:8888 -e GRANT_SUDO=yes --user root jupyter_vscode
```

Maps port 8888 (where jupyter runs inside container)

Give the joyvan user `sudo` privileges


### Notes

It's a huge docker image. 3.5 gb. Wonder why ...


### Usage

vscode runs at localhost:8888/codeserver

