# Author: Mariusz Wiśniewski

# Instructions
# docker build -t <image_name> .
# docker run -it --name <container_name> <image_name> /bin/zsh

# Then, if you want to use the container, you can do:
# docker start <container_name>
# docker attach <container_name>

FROM alpine:latest
RUN apk update && \
    apk --no-cache add zsh git vim zsh-autosuggestions zsh-syntax-highlighting \
     bind-tools curl exa g++ clang cmake make valgrind fzf
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc && \
    echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc && \
    echo "export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'" >> ~/.zshrc && \
    echo "source /usr/share/fzf/key-bindings.zsh" >> ~/.zshrc

RUN echo "alias ls='exa --icons --color=always --group-directories-first'" >> ~/.zshrc && \
    echo "alias ll='exa -alF --icons --color=always --group-directories-first'" >> ~/.zshrc && \
    echo "alias la='exa -a --icons --color=always --group-directories-first'" >> ~/.zshrc && \
    echo "alias l='exa -F --icons --color=always --group-directories-first'" >> ~/.zshrc && \
    echo "alias l.='exa -a | egrep \"^\.\"'" >> ~/.zshrc
ENTRYPOINT /bin/zsh
