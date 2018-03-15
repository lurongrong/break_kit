if [[ `uname` == 'Linux' ]]; then

    yum -y update
    yum -y install git vim golang ansible expect ctags tmux lrzsz

    if [[ ! -d /home/golang ]];then
        mkdir -p /home/golang
    fi

    echo  "+++++++++config golang+++++++++++++"

    if [[ ! -d /usr/lib/golang ]];then
        echo 'export GOROOT=/usr/lib/golang
        export GOBIN=$GOROOT/bin
        export GOPATH=/home/golang
        export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' > /etc/profile.d/go.sh
        echo '# Golang Path
        export GOROOT=/usr/lib/golang
        export GOBIN=$GOROOT/bin
        export GOPATH=/home/golang
        export PATH=$PATH:$GOROOT/bin$GOPATH/bin' >> ~/.bashrc

        source ~/.bashrc
        source /etc/profile
        ldconfig
        go version
        go env
    fi

elif [[`uname` == 'Darwin' ]]; then

    if [ ! -f /usr/local/bin/brew ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    sudo brew install ctags wget lrzsz tmux

    if [ ! -f /usr/local/bin/pip ]; then
        sudo easy_install pip
    fi

    if [ ! -f ~/.on-my-zsh.lock ];then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        sudo brew install zsh-autosuggestions
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
        echo 'have installed oh-my-zsh' > ~/.on-my-zsh.lock
    fi

    if [ ! -f /usr/local/bin/sshpass ]; then
        brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
    fi
    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

    cd /usr/local/bin
    sudo wget https://raw.github.com/mmastrac/iterm2-zmodem/master/iterm2-send-zmodem.sh
    sudo wget https://raw.github.com/mmastrac/iterm2-zmodem/master/iterm2-recv-zmodem.sh
    sudo chmod 777 /usr/local/bin/iterm2-*
fi

echo "download get-pip.py"
wget -q https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
python /tmp/get-pip.py

if [[ ! -d ~/.pip ]];then
    mkdir -p ~/.pip
fi

echo "=======install pip========"
cp -rf pip.conf ~/.pip

sudo pip install --upgrade pip
sudo pip install future frozendict pep8 pyflakes autopep8 autoflake isort

echo "+++++rc +++++config vim & git+++++++++++++++"

sudo cp -rf files/vimrc ~/.vimrc
sudo cp -rf files/gitconfig ~/.gitconfig
sudo cp -rf files/gitignore_global ~/.gitignore_global
sudo cp -rf files/tmux.conf ~/.tmux.conf
sudo cp -rf files/pyauto  /usr/local/bin/
sudo cp -rf files/p8ln /usr/local/bin/
sudo cp -rf files/git-changed-ln  /usr/local/bin/

sudo chmod +x /usr/local/bin/pyauto /usr/local/bin/p8ln /usr/local/bin/git-changed-ln

if [[ -d ~/.vim/ftplugin ]];then
    cp -rf ftplugin .vim/
fi

echo "======= install vundle.vim============="

if [[ ! -d ~/.tmux/plugins.tpm ]];then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [[ ! -d ~/.vim/bundle/vundle.vim ]];then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    echo "please edit .vimrc and execute :PluginInstall"
fi

echo "++++++++++++++config finished+++++++++++++++++"
