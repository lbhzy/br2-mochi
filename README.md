# Mochi 

## 介绍
一个 buildroot 的 br2-external 树

## 使用
```shell
# 下载本仓库和 buildroot 源码
git clone https://github.com/lbhzy/br2-mochi.git
git clone https://github.com/buildroot/buildroot.git

# 配置
cd buildroot
make BR2_EXTERNAL=../br2-mochi qemu_aarch64_virt_defconfig

# 编译
make

# qemu运行
make run
```
