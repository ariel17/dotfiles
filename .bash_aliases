### TaskWarrior

alias t="task"
alias ta="tl +ACTIVE"
alias td="tl +DUE"
alias ti="t inbox"
alias tl="t list"
alias to="tl +OVERDUE"
alias tt="tl +TODAY"

function func_q1 {
    if [ $# -ne 1 ]; then
        task q1
    else
        task $1 mod prio:H +urg -unu
        task inbox
    fi
}

function func_q2 {
    if [ $# -ne 1 ]; then
        task q2
    else
        task $1 mod prio:H +unu -urg 
        task inbox
    fi
}

function func_q3 {
    if [ $# -ne 1 ]; then
        task q3
    else
        task $1 mod prio:L +urg -unu  
        task inbox
    fi
}

function func_q4 {
    if [ $# -ne 1 ]; then
        task q4
    else
        task $1 mod prio:L +unu -urg 
        task inbox
    fi
}

alias q1="func_q1"
alias q2="func_q2"
alias q3="func_q3"
alias q4="func_q4"


### Misc

alias publicip="wget http://ipinfo.io/ip -qO -"
alias m="pandoc ~/development/ariel17/aprendiendo/7-habitos/mision.rst | lynx -stdin"
alias r="pandoc ~/development/ariel17/aprendiendo/retrospectivas/ultima.rst | lynx -stdin"
alias d="docker"
alias dc="docker-compose"

### Private Aliases

source ~/.bash_private_aliases
