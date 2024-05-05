
setup-zsh() {
    local order=$(find_function_index "zsh")

    echo "Hello from zsh setup!"
    local bash_index=$(find_function_index "bash")
    update_status $order "done"
}

