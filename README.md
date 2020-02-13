# kubernetes-utility-images

ちょっとしたDockerfile置き場  
解説はそれぞれのreadmeに  

## image build
release/[dirname]/[version] というタグを切ってリポジトリにpushするとgithub actionsがimageをビルドしてECRにpushします　　
例）release/alpine-tini/v1.0.0 -> alpine-tiniのimageがv1.0.0のtagでpush  
