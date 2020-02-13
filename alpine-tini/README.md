# alpine-tini

## 概要
tiniをpid1で起動するだけのimageです  
tiniについては https://github.com/krallin/tini

## 使い方
任意のコマンドをargsに設定してください

## manifest例

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test
  labels:
    app: tini
spec:
  selector:
    matchLabels:
      app: tini
  template:
    metadata:
      labels:
        app: tini
    spec:
      containers:
        - name: tini
          image: <<image-registry>>
          args: 
            - echo
            - -n
            - hoge
```
