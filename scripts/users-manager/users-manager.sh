#!/bin/bash

# check the first argument and make sure it's a text file that is not empty and is readable.
# read the file line by line.
# split the line to elements using : as a separator. format -> test:test:+sysadmin,+cloud,-test_user:/home/test:/bin/bash
# validate the elements count. Exit with error on failure.
# store elem 1 in account_name.
# store elem 2 in primary_group.
# store elem 3 in supplementary_groups.
# store elem 4 in home_dir.
# store elem 5 in shell_path.
# create primary group if not exist. empty means primary group will be the same account name if account name does not exist. Write and dislay a log with result if success or display a message if exists.
# create secondary groups if not exist. empty means leave it. each group name must be preceeded by + or - to decide to append or remove. If the groups field starts with = thatmeans to override. Write and dislay a log with result if success or display a message if exists.
# if shell_path is empty, set it to system default, just leave it and don't add -s. if shell path does not exist, use '/usr/sbin/nologin'.
# if home_dir is empty, don't create one. if is given, it must be a full dir including the account dir name.
# if the user exist, use usermod with required options.
# if the user does not exist, create using useradd with required options.

# check the first argument and make sure it's a text file that is not empty and is readable.


if ! [[ -f $1 ]]; then
    echo "Error: file is missing."
    exit 1
fi

if [[ -z $1 ]]; then
    echo "Error: file is empty."
    exit 1
fi

if ! [[ -r $1 ]]; then
    echo "Error: file is not readable by user $USER."
    exit 1
fi


# function
function _create_account() {
    # check if the account already exists
    if getent passwd $1 &> /dev/null; then
        echo "[] Account '${1}' already exists."
        return 1
    else
    # create it if it does not exist
        if sudo useradd -m $1 &> /dev/null; then
            echo "[] Account '${1}' was created successfully."
            return 0
        else
            echo "[] Account '${1}' failed to be created."
            return 2
        fi
    fi

    return 1
}

# function
function _create_group() {
    # check if the group already exists
    if getent group $1 &> /dev/null; then
        echo "[] Group '${1}' already exists."
        return 1
    else
    # create it if its name is set
        if sudo groupadd $1 &> /dev/null; then
            echo "[] Group '${1}' was created successfully."
            return 0
        else
            echo "[] Group '${1}' failed to be created."
            return 2
        fi
    fi
}

while IPS= read -r user_line
    do
        # escape the comment lines
        if [[ $(echo $user_line | cut -c1) == "#" ]]; then
            continue
        fi

        echo $user_line
        echo 

        # extract the account info
        account_name=$(echo $user_line | cut -d':' -f1)
        primary_group=$(echo $user_line | cut -d':' -f2)
        supplementary_groups=$(echo $user_line | cut -d':' -f3)
        comment=$(echo $user_line | cut -d':' -f4)
        home_dir=$(echo $user_line | cut -d':' -f5)
        shell_path=$(echo $user_line | cut -d':' -f6)

        echo $account_name
        echo $primary_group
        echo $supplementary_groups
        echo $home_dir
        echo $shell_path
        echo

        # ACCOUNT
        _create_account $account_name

        # PRIMARY GROUP
        # check if the primary_group is set
        if ! [[ -z $primary_group ]]; then
            # create the group
            _create_group primary_group

            # set the group as the primary group of the user's account
            if sudo usermod -g "$primary_group" "$account_name"; then
                echo "[] Primary group '$primary_group' was set to account '$account_name'."
            else
                echo "[x] Primary group '$primary_group' was not set to account '$account_name'."
            fi
        else
            echo "[] Primary group is not set."
        fi

        # SUPPLEMENTARY GROUPS
        # check if the supplementary_groups is set
        if ! [[ -z $supplementary_groups ]]; then

            # check if override required '='
            if [[ ${supplementary_groups:0:1} == '=' ]]; then
                declare -a user_groups
                IFS=',' read -ra user_groups <<< "${supplementary_groups:1}"
                
                # remove the current supplementary groups
                if sudo usermod -G "" "$account_name"; then
                    echo "[] Removed all the current supplementary groups of the account '$account_name'."
                else
                    echo "[x] Unable to remove all the current supplementary groups of the account '$account_name'."
                fi

                # loop on the user_groups
                for group_name in ${user_groups[@]}
                    do
                        # create the group
                        _create_group $group_name

                        # append the group to the user's account
                        if sudo usermod -aG "$group_name" "$account_name"; then
                            echo "[] Added the supplementary group '$group_name' to account '$account_name'."
                        else
                            echo "[x] Unable to add the supplementary group '$group_name' to account '$account_name'."
                        fi
                    done
            else
                declare -a user_groups
                IFS=',' read -ra user_groups <<< "${supplementary_groups:0}"
                
                # check if add '+' or remove '-' required
                for group_name in ${user_groups[@]}
                    do
                        # append a group '+'
                        if [[ ${group_name:0:1} == "+" ]]; then
                            group_name="${group_name:1}"
                            _create_group "$group_name"
                            sudo usermod -aG "$group_name" "$account_name"
                        # remove a group '-'
                        elif [[ ${group_name:0:1} == "-" ]]; then
                            group_name="${group_name:1}"
                            sudo usermod -rG "$group_name" "$account_name"
                        fi

                    done
            fi 
        else
            echo "[] Supplementary groups are not set."
        fi

        # COMMENT
        sudo usermod -c "$comment" "$account_name"

        # SHELL
        sudo usermod -s "$shell_path" "$account_name"


    done < $1