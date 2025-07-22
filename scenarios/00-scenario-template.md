# 🧪 Scenario 01 - Bulk User Onboarding

## 🧭 Context
The HR department provides a CSV file (`new_users.csv`) every week with new employees. You need to create user accounts in bulk based on this file and assign them to the correct departments.

## 🛠️ Tasks
1. Create users based on the CSV (`username,fullname,department`).
2. Assign each user to a group that matches their department name.
3. Create home directories with proper permissions.
4. Set a temporary password and force password change on first login.
5. Log all actions in `/var/log/user_onboarding.log`.

---

## 🧪 My Solution

### ✅ Step 1: Reviewed the CSV
```csv
alice, Alice Johnson, marketing
bob, Bob Smith, engineering
charlie, Charlie Ray, hr
```
---

## 📝 My Notes:
- Used chage -d 0 to force password change.
- Might add error handling in v2.
