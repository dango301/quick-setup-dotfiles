
setup-bash() {
    local order=$(find_function_index "bash")

    echo "Hello from bash setup!"
    update_status $order "done"
}
