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
gorupadd devops
gorupadd cloud
gorupadd security
gorupadd infra
gorupadd junior
```

### ✅ Step 2: Create the user accounts with required options
```
useradd -m -s "/bin/bash" -G devops aarav_malhotra
echo "[$(date +'%F %T')] Action: created user 'aarav_malhotra' - success" >> /var/log/onboarding.log
passwd aarav_malhotra
echo "[$(date +'%F %T')] Action: Set password for 'aarav_malhotra' - success" >> /var/log/onboarding.log
chage -d 0 aarav_malhotra
echo "[$(date +'%F %T')] Action: Added aarav_malhotra to group '' - success" >> /var/log/onboarding.log

useradd -m -s "/bin/bash" -G cloud yasmin_hassan
passwd yasmin_hassan
chage -d 0 yasmin_hassan

useradd -m -s "/bin/bash" -G security tariq_mansour
passwd tariq_mansour
chage -d 0 tariq_mansour

useradd -m -s "/bin/bash" -G infra emi_takahashi
passwd emi_takahashi
chage -d 0 emi_takahashi

useradd -m -s "/bin/bash" -G junior lucas_martins
passwd lucas_martins
chage -d 0 lucas_martins
chage -E $(date -d '+90 days' +%F)
```


---

## 📝 My Notes:

---

