# basic structure
<!-- amr:amr:test1,test2,tes3:Amr Hassan:/bin/bash:2025-07-26:3:99999:0:0:2025-09-26 -->

# detailed structure
user        amr # user name
pgroup      amr # primary group
sgroups     test1,test2,tes3 # supplementary groups
comment     Amr Hassan # comment
shell       /bin/bash # shell path
cdate       2025-07-26 # create date
mndays      3 # minimum days
mxdays      99999 # max days
wdays       0 # warning days
idays       0 # inactive days
xdate       2025-09-26 # expiry date

user        jim
....

# notes
> the format is `field_name field_value # optional comment`.
> extra spaces between the 3 parts don't count.
> don't accept a field with empty value.
> all field names are lowercase.
> each field does not start with whitespace.
> only a blank line seperates records.
> the value of sgroups field does not accept spaces between group names.
> any date field like `cdate` and `xdate` accepts only the date foramt `yyyy-mm-dd`.
> each field's value in the users' file will override the current one.

# to do
...

# --------------------------------------------------------------------------------

username:
primary group:
supplementary groups:
comment:home dir:
shell path

# possible values for passwd fields

username
> required.
> if exist, do nothing.
> if not exist, create it with minimal default options.
>> allowed chars [a-zA-Z0-9_-]

primary group
> optional.
> if empty and user account exist, do nothing.
> if empty and user account is not  exist, create a group with the same name and set it to the account as a primary group.
> if set and user account exist, then create it if not exist, then set it to the account.
>> allowed chars [a-zA-Z0-9_-]

supplementary groups
> optional.
> if empty, do nothing.
> if set, must have a specific format `:=grp1,grp2:`, `:+grp1,+grp2,-grp3`.
> if the field starts with `=`, then all groups will be assigned and override the current existing groups. Once `=` is used, the `+` or `-` are not allowed.
> if the field does not start with `=`, then each group name must be preceeded by `+` to append or `-` to remove. If no sign was used before the group name, it will be ignored.
> if the group name needed to be assigned or appended does not exist, it will be created first.
>> allowed chars [a-zA-Z0-9_-]

comment
> optional.
> if empty, do nothing.
> if set, set it to the account.
>> allowed chars [ascci and non-ascii]
>> must be quoted by double quotes.

home dir
> optional.
> if empty and user is not exist, do not create a home dir for the user.
> if empty and user is exist, do nothing.
> if set and user is exist, user has a dir, and it is the same dir, then do nothing.
> if set and user is exist, user has a dir, and it is a new dir, then create the new home dir, and don not move the content from old dir to the new one.
>> must be an absolute path.

shell path
> optional.
> if empty and user is not exist, set the shell to `/bin/sh`.
> if empty and user exist, do nothing.
> if set and user exists, check if the shell path exists, then set it to the user.
>> must be an absolute path.

# possible values for shadow fields

last password change date in epoch days:
minimum number of days between password changes:
maximum number of days between password changes:
number of days of warning before password expires:
inactivity period after password after password expiry:
account expiry date as epoch days or `yyyy-mm-dd`

change date
> optional.
> if empty, do nothing.
> if set, apply it.
>> accepts only date format `yyyy-mm-dd`.
>> if new user and no value is set, default value will be `default`.

minimum days
> optional.
> if empty, do nothing.
> if set, apply it.
>> accepts only integers `negative or positive`.
>> if new user and no value is set, default value will be `0`.

maximum days
> optional.
> if empty, do nothing.
> if set, apply it.
>> accepts only integers `negative or positive`.
>> if new user and no value is set, default value will be `99999`.

warning days
> optional.
> if empty, do nothing.
> if set, apply it.
>> accepts only integers `negative or positive`.
>> if new user and no value is set, default value will be `7`.

inactivity days
> optional.
> if empty, do nothing.
> if set, apply it.
>> accepts only integers `negative or positive`.
>> if new user and no value is set, default value will be `0`.

expiry date
> optional.
> if empty, do nothing.
> if set, apply it.
>> accepts only date format `yyyy-mm-dd`.
>> if new user and no value is set, default value will be ``.
