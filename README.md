# 开发环境的一点个人配置
一份自己开发机的配置，依赖 git

## omz

一份很简单的自用 omz 配置文件

```sh
# 检查系统是否有 zsh
cat /etc/shells
echo $SHELL

# 安装 zsh
yum install zsh

# 设置 zsh
chsh -s /bin/zsh

# zsh 准备好后安装 omz
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# 一些插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 安装 powerlevel10k 依赖
wget https://github.com/sharkdp/fd/releases/download/v8.3.2/fd-v8.3.2-x86_64-unknown-linux-gnu.tar.gz
tar xf fd-v*-x86_64-unknown-linux-gnu.tar.gz
cd fd-v*-x86_64-unknown-linux-gnu
cp fd /bin
gzip fd.1
cp fd.1.gz /usr/share/man/man1
cp autocomplete/fd.bash /usr/share/bash-completion/completions/fd
source /usr/share/bash-completion/completions/fd
fd
```

## tmx

目前我的 tmux 版本是 2.7，这份配置文件可能在低版本下会有报错

```sh
yum install -y tmux
```

## neovim

目前我的 nvim 版本是 0.8，这份配置文件可能在低版本下会有报错

```sh
# 安装
git clone https://github.com/neovim/neovim.git
git checkout origin/release-0.7

# 依赖
sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl

# ninja 默认并行编译
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/local/nvim install

# 安装 npm，lsp 会用到
wget https://nodejs.org/dist/v16.6.2/node-v16.6.2-linux-x64.tar.gz
x node-v16.6.2-linux-x64.tar.gz
mv node-v16.6.2-linux-x64 /usr/local/node
ln -sf /usr/local/node/bin/node /usr/local/bin/node
ln -sf /usr/local/node/bin/npm /usr/local/bin/npm

# 一些可选安装项
npm install -g neovim
# python 最好 3.7 以上
pip install neovim
pip3 install neovim

# Lua 一些插件
# https://github.com/wbthomason/packer.nvim
# https://github.com/hrsh7th/nvim-cmp
# https://github.com/williamboman/nvim-lsp-installer
# https://github.com/nvim-telescope/telescope.nvim

# lsp
# 选择自己需要的 lsp
# 部分 lsp 依赖 npm, pip, clang，安装 lsp 之前需要提前安装这些依赖
yum install -y clang

# telescope 部分功能依赖 ripgrep
# https://github.com/BurntSushi/ripgrep
# wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz

# 图标美化
# 服务器安装 nerd font
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
./install.sh Hack
# Mac 安装 nerd font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
# 修改 iterm2 -> preferences -> profiles -> text -> Non-ASCII Font 选择新安装字体
```

## 键盘映射

```
# 基础按键
/ 搜索
shift + h 和 shift + l 切换buffer
ctl + k 标记当前词高亮
zc、zo 折叠和展开折叠

# telescope
; + ff 搜索文件
; + fs 搜索字符
; + fg 模糊搜索字符
; + fr 搜索 lsp 引用
; + fm 搜索本文件书签
; + fma 搜索所有书签

insert 模式下
ctl + j/k 上下选择
ctl + c 关闭
up/down 历史搜索
CR 打开
ctl + x 竖直打开
ctl + v 水平打开 
ctl + t 新 tab 打开
tab 选中并移动下一个
shift + tab 选中并移动上一个
ctl + u/d 预览移动 

normal 模式
j/k 上下选择
esc 关闭
up/down 历史搜索
CR 打开
ctl + x 竖直打开
ctl + v 水平打开 
ctl + t 新 tab 打开
tab 选中并移动下一个
shift + tab 选中并移动上一个
ctl + u/d 预览移动 
gg/G 头尾移动

# gitsigns
shift + j 和 shift + k 上下跳转 git hunk
; + hr 恢复 git hunk
; + hp 预览 git hunk
; + hd diff 文件

# nvim-tree
ctl + n 打开关闭显示文件夹
a 新加文件，新加文件夹时以 / 结尾
d 删除
ctl + r、r 重命名
c 复制
x 剪切
p 粘贴
o 关闭节点
- 显示上一层目录
CR 编辑文件
tab 预览文件
ctl + x 竖直打开
ctl + v 水平打开 
ctl + t 新 tab 打开
> 下一个同级节点
< 上一个同级节点
J 第一个同级节点
K 最后一个同级节点
R 刷新

# autopairs
ctl + e 显示插入下一个插入

# comment
gcc 行注释
gc 块注释

# completions
ctl + k/j、tab/shift + tab 上下选择
ctl + d/u 滚动
ctl + c 关闭
CR 选中

# toggleterm
ctl + \ 打开终端
ctl + j 切回 nvim

# boookmark
mm 当前行标记或取消标记
mn、mp 上下移动
ma 显示所有标记
mc 取消所有标记
mx 取消当前 buffer 标记

# lsp
gd 跳转声明
ctl + ] 跳转定义
K 查看声明
gr 查看引用
gh 头文件跳转
rn 重命名

# bufferline
; + num 跳转到指定 buffer，只支持 1～9

# 翻译
; + t
ctl + wp 跳入结果界面

# easy motion
; + jw 跳转单词
; + ja 任意跳转
; + jc 跳转单一字符
```

## 软链配置文件

```sh
sh init.sh
```
