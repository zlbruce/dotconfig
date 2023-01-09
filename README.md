# dotconfig
我的一些配置文件，用于备份。

## VIM配置
我主要是使用vim，原则上应该也是兼容neovim，使用[vim-plug](https://github.com/junegunn/vim-plug)来管理插件，先执行
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
再拷贝`.vimrc`到`~/.vimrc`：
```bash
cp -v .vimrc ~/.vimrc
```
最后执行安装即可：
```bash
vim -c ":PlugInstall"
```

### 附加软件
* [ripgrep](https://github.com/BurntSushi/ripgrep)：性能更好的grep工具
* [global](https://www.gnu.org/software/global/)：gtags工具，比ctags好用太多。可以使用 leaderf gtags 来自动管理 gtag 数据库文件。

### 重点插件介绍

* [leaderf](https://github.com/Yggdroot/LeaderF)：开箱即用的模糊查找插件，功能强大
  * 查找文件
  * 查找与管理 buffer
  * 使用 rg 文件内容搜索
  * gtags 管理，使用 leaderf gtags 来做符号的查找非常的简单好用
* [vim-easymotion](https://github.com/easymotion/vim-easymotion)：实现快速的跳转
* [undotree](https://github.com/mbbill/undotree)：可以备份整个的编辑记录，以备不时之需
* [nerdtree](https://github.com/preservim/nerdtree)：树形文件列表，查看文件结构时使用
* [vim-polyglot](https://github.com/sheerun/vim-polyglot): 语法高亮，支持很多文件类型
* [vim-highlighter](https://github.com/azabiong/vim-highlighter)：高亮单词插件，可以方便的高亮某个单词
* [vim-startify](https://github.com/mhinz/vim-startify)：首屏插件，可以显示最近打开文件，也可以自己添加一些收藏的文件
* [lightline](https://github.com/itchyny/lightline.vim)：自定义状态栏的外观插件
* [onedark](https://github.com/joshdick/onedark.vim)：颜色主题
