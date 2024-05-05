# Helpers to prompt user for selections

temp_selection=()

# Function to prompt user for selection
select_options() {
    local title="$1"

    # Display OPTIONS for manual selection
    echo -e "\n$title\n"
    for ((i=0; i<${#OPTIONS[@]}; i+=2)); do
        echo -e "\t[$((i/2 + 1))] ${OPTIONS[$i]}"
    done
    echo ""
    read -rp "Enter numbers to make a selection (comma-separated): " input

    # Process user input to select values
    local selected_options=()
    local valid_selection=true
    IFS=',' read -ra selections <<< "$input"

    for selection in "${selections[@]}"; do
        if [[ "$selection" =~ ^[0-9]+$ ]] && ((selection > 0 && selection <= ${#OPTIONS[@]}/2)); then
            selected_options+=("${OPTIONS[((2 * selection - 1))]}")  # Adjusted index to select values
        else
            valid_selection=false
            break
        fi
    done

    # If all selections are valid, output them
    if "$valid_selection"; then
        # write to global to be accessed via read_selection()
        temp_selection=("${selected_options[@]}")
        return 0
    else
        temp_selection=() # reset variable
        return 1
    fi
}

read_selection() {
    # sort and remove duplicates
    local sorted=($(printf "%s\n" "${temp_selection[@]}" | sort -nu))
    echo "${sorted[@]}"
}

confirm_selection() {
    local title="$1"
    local selected_options=("${@:2}")

    confirmation_elements=()
    for i in "${selected_options[@]}"; do
        confirmation_elements+=("\t[$((i+1))] ${FUNCTIONS[$((i))]}")
    done

    # Ask user to confirm selection
    echo -e "$title\n"
    for element in "${confirmation_elements[@]}"; do
        echo -e "$element"
    done

    echo ""
    read -rp "Is this selection correct? ([Y]es / No): " choice

    # Validate user input
    case "$choice" in
        yes|YES|Yes|y|Y|"")
            return 0
            ;;
        no|NO|No|n|N)
            return 1
            ;;
        *)
            echo "Invalid choice. Please enter 'yes' or 'no'."
            confirm_selection "$title" "${OPTIONS[@]}"  # Recursive call
            ;;
    esac
}

