# basic-auth

## 概要
basic認証をかけるproxyのimageです

## 使い方
以下を環境変数に指定してください
- USERNAME
    - basic認証のユーザー名です
    - default: admin
- PASSWORD
    - basic認証のパスワードです
    - default: password
- LISTEN_PORT
    - nginx設定、serverディレクティブのlistenに入る値です
    - default: 80
- SERVER_NAME
    - nginx設定、serverディレクティブのserver_nameに入る値です
    - default: localhost
- PROXY_PASS
    - nginx設定、locationディレクティブのproxy_passに入る値です
    - default: http://localhost/
- HEALTH_PATH
    - basic認証なしで通るヘルスチェクエンドポイントのパスです（ただステータス200が返るだけ）
    - default: /proxy-healthz

## manifest例

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test
  labels:
    app: auth
spec:
  selector:
    matchLabels:
      app: auth
  template:
    metadata:
      labels:
        app: auth
    spec:
      containers:
        - name: auth
          image: <<image-registry>>
          env:
            - name: USERNAME
              value: hoge
            - name: PASSWORD
              value: hogehoge
            - name: PROXY_PASS
              value: http://localhost:9000/
            - name: HEALTH_PATH
              value: /live
```

実際はUSERNAMEやPASSWORDはsecretに設定して`envFrom.secretRef`で渡す想定です
