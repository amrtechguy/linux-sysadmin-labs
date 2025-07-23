# 🧑‍💻 Scenario 01: New Department Onboarding (Global Team Expansion)

## 🌍 Background

The IT department at **GlobalTech Solutions Inc.**, a multinational technology company, is onboarding a new cross-functional global team into the central Linux server `core-srv01`. Each team member requires a secure user account, correct group assignments, and baseline access configurations. This operation must comply with the company’s internal IT policy and international security standards.

### 🧭 New Employees to Onboard

- **Aarav_Malhotra** (India) – DevOps Engineer
- **Yasmin_Hassan** (Egypt) – Cloud Solutions Architect
- **Tariq_Al-Mansour** (UAE) – Security Analyst
- **Emi_Takahashi** (Japan) – Infrastructure Engineer
- **Lucas_Martins** (Brazil) – Junior Sysadmin (Contractor)

---

## 🛠️ Tasks

1. **Create user accounts** for the above employees using appropriate usernames.
2. **Set secure initial passwords** and enforce a password change at first login.
3. **Assign users to relevant groups** based on their roles:
   - `devops`, `cloud`, `security`, `infra`, `junior`
4. **Create and validate home directories** with correct ownership and permissions.
5. **Ensure the default shell is `/bin/bash`** for all users.
6. **Log all actions taken** (user creation, group assignment, etc.) to `onboarding.log`.
7. **Set account expiration** for **Lucas_Martins** exactly 90 days from today.

---

## 🧪 My Solution


### ✅ step 1: Create the groups
```
sudo groupadd devops && \
echo "[$(date +'%F %T')] Action: created group 'devops' - success" | sudo tee -a /var/log/onboarding.log

sudo groupadd cloud && \
echo "[$(date +'%F %T')] Action: created group 'cloud' - success" | sudo tee -a /var/log/onboarding.log

sudo groupadd security && \
echo "[$(date +'%F %T')] Action: created group 'security' - success" | sudo tee -a /var/log/onboarding.log

sudo groupadd infra && \
echo "[$(date +'%F %T')] Action: created group 'infra' - success" | sudo tee -a /var/log/onboarding.log

sudo groupadd junior && \
echo "[$(date +'%F %T')] Action: created group 'junior' - success" | sudo tee -a /var/log/onboarding.log
```

### ✅ Step 2: Create the user accounts with required options
```
# user 1
sudo useradd -m -s "/bin/bash" -G devops aarav_malhotra && \
echo "[$(date +'%F %T')] Action: created user 'aarav_malhotra' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: created home directory for user 'aarav_malhotra' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: set default shell '/bin/bash' to user 'aarav_malhotra' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: added user 'aarav_malhotra' to group 'devops' - success" | sudo tee -a /var/log/onboarding.log

sudo passwd aarav_malhotra && \
echo "[$(date +'%F %T')] Action: set initial password for 'aarav_malhotra' - success" | sudo tee -a /var/log/onboarding.log

sudo chage -d 0 aarav_malhotra && \
echo "[$(date +'%F %T')] Action: changed the account creation date of 'aarav_malhotra' to 0 - success" | sudo tee -a /var/log/onboarding.log

# user 2
sudo useradd -m -s "/bin/bash" -G cloud yasmin_hassan && \
echo "[$(date +'%F %T')] Action: created user 'yasmin_hassan' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: created home directory for user 'yasmin_hassan' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: set default shell '/bin/bash' to user 'yasmin_hassan' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: added user 'yasmin_hassan' to group 'cloud' - success" | sudo tee -a /var/log/onboarding.log

sudo passwd yasmin_hassan && \
echo "[$(date +'%F %T')] Action: set initial password for 'yasmin_hassan' - success" | sudo tee -a /var/log/onboarding.log

sudo chage -d 0 yasmin_hassan && \
echo "[$(date +'%F %T')] Action: changed the account creation date of 'yasmin_hassan' to 0 - success" | sudo tee -a /var/log/onboarding.log

# user 3
sudo useradd -m -s "/bin/bash" -G security tariq_mansour && \
echo "[$(date +'%F %T')] Action: created user 'tariq_mansour' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: created home directory for user 'tariq_mansour' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: set default shell '/bin/bash' to user 'tariq_mansour' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: added user 'tariq_mansour' to group 'security' - success" | sudo tee -a /var/log/onboarding.log

sudo passwd tariq_mansour && \
echo "[$(date +'%F %T')] Action: set initial password for 'tariq_mansour' - success" | sudo tee -a /var/log/onboarding.log

sudo chage -d 0 tariq_mansour && \
echo "[$(date +'%F %T')] Action: changed the account creation date of 'tariq_mansour' to 0 - success" | sudo tee -a /var/log/onboarding.log

# user 4
sudo useradd -m -s "/bin/bash" -G infra emi_takahashi && \
echo "[$(date +'%F %T')] Action: created user 'emi_takahashi' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: created home directory for user 'emi_takahashi' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: set default shell '/bin/bash' to user 'emi_takahashi' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: added user 'emi_takahashi' to group 'infra' - success" | sudo tee -a /var/log/onboarding.log

sudo passwd emi_takahashi && \
echo "[$(date +'%F %T')] Action: set initial password for 'emi_takahashi' - success" | sudo tee -a /var/log/onboarding.log

sudo chage -d 0 emi_takahashi && \
echo "[$(date +'%F %T')] Action: changed the account creation date of 'emi_takahashi' to 0 - success" | sudo tee -a /var/log/onboarding.log

# user 5
sudo useradd -m -s "/bin/bash" -G junior lucas_martins && \
echo "[$(date +'%F %T')] Action: created user 'lucas_martins' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: created home directory for user 'lucas_martins' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: set default shell '/bin/bash' to user 'lucas_martins' - success" | sudo tee -a /var/log/onboarding.log && \
echo "[$(date +'%F %T')] Action: added user 'lucas_martins' to group 'junior' - success" | sudo tee -a /var/log/onboarding.log

sudo passwd lucas_martins && \
echo "[$(date +'%F %T')] Action: set initial password for 'lucas_martins' - success" | sudo tee -a /var/log/onboarding.log

sudo chage -d 0 lucas_martins && \
echo "[$(date +'%F %T')] Action: changed the account creation date of 'lucas_martins' to 0 - success" | sudo tee -a /var/log/onboarding.log

sudo chage -E $(date -d '+90 days' +%F) lucas_martins && \
echo "[$(date +'%F %T')] Action: changed the account expiration date of 'lucas_martins' to $(date -d '+90 days' +%F) - success" | sudo tee -a /var/log/onboarding.log
```


---

## 📝 My Notes:
- Used the tools: `useradd`, `passwd`, `chage`, `date`, `tee`.
- Used a single command to create an account with home directory, default shell, and supplementary group `sudo useradd -m -s "/bin/bash" -G junior lucas_martins`.
- Used `&&` to make sure the previous command is executed successfully or the next one will not execute. This way I make sure that the log will be appended only if the command was executed successfully.
- Used `\` to tell the shell that the rest of the command is on the next line.
- Used `tee -a` to append to the log file that requires a root permission. Tryed `sudo echo "..." >> /var/log/onboarding.log`, but it didn't work because the `sudo` will apply only to the `echo` not the redirection `>>`. Also, found that the shell applies the stream redirection `>>` before executing the `echo`, so using `tee -a` allowed me to echo the log text and append it to the log file and also print it to the standard output after the appending is done.
- Used `chage -d 0` to set the account's password creation date to 0 which is old and even before the '1970-01-01' when the epoch time stars. I think that triggers the system to force the user to change the password, because it's too old.
---

## 🔁 Automating the solution:




