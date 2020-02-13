# logrotate

## 概要
毎分logrotateコマンドが走ります

## 使い方
configmapでlogrotate.confを作成し、  
`/etc/logrotate.conf`にマウントしてください  

## manifest例

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test
  labels:
    app: logrotate
spec:
  selector:
    matchLabels:
      app: logrotate
  template:
    metadata:
      labels:
        app: logrotate
    spec:
      containers:
        - name: logrotate
          image: <<image-registry>>
          volumeMounts:
            - mountPath: /etc/logrotate.conf
              subPath: logrotate.conf
              name: logrotate-conf
      volumes:
        - name: logrotate-conf
          configMap:
            name: config

---
kind: ConfigMap
apiVersion: v1
metadata:
  name: config
data:
  logrotate.conf: |
    /path/to/log/*.log {
      su nobody nobody
      nomail
      rotate 0
      missingok
      nocompress
      copytruncate
      size 1M
    }

```
