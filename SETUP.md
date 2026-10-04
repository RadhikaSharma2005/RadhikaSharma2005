# GitHub profile setup

This folder holds your profile README and the extras around it. About 15 minutes of clicking.

## 1. Publish the profile README

GitHub shows a repo's README on your profile page when the repo has **exactly your username** as its name.

1. Go to https://github.com/new and name the repo `RadhikaSharma2005`. Make it **Public**, and leave "Add a README" unticked.
2. From this folder, run:

   ```bash
   git init -b main
   git add .
   git commit -m "Add profile README"
   git remote add origin https://github.com/RadhikaSharma2005/RadhikaSharma2005.git
   git push -u origin main
   ```

3. In the new repo, open **Actions**, then **Generate contribution snake**, then **Run workflow**. This creates the `output` branch the snake image loads from. Until it has run, that image shows as broken.

## 2. Profile settings (github.com/settings/profile)

| Field | Suggested value |
|---|---|
| Name | Radhika Sharma |
| Bio | ex-SDE Intern @ Amazon · Backend (Java, Spring Boot, Node, FastAPI, PostgreSQL) |
| Location | Your city, India |
| Social accounts | your LinkedIn URL |
| Profile picture | a clear headshot (the default identicon looks like an abandoned account) |

Tick **Available for hire** under the hireable setting.

## 3. Pin the right repos

On your profile, click **Customize your pins** and pin, in this order:

1. `CinePass-Ticket-booking-System`
2. `SnapCab`
3. BusGPS, once it's pushed
4. `faq-backend`

## 4. Add repo descriptions and topics

Right now every repo shows "No description". Preview what the script will set:

```powershell
.\scripts\update-repo-metadata.ps1
```

Then apply it with a token (the script's header says how to make one):

```powershell
$env:GITHUB_TOKEN = "<your token>"; .\scripts\update-repo-metadata.ps1 -Apply
```

Or set them by hand with the ⚙️ next to "About" on each repo page.

## 5. Tidy up old repos

Recruiters skim the repo list. Go to each repo's **Settings → Archive this repository**, or make it private:
`Test`, `project1`, `Project2`, `Project3`, `WEBD`, `toDoList`, and the `CodeClash` fork. Archiving keeps their history.

## 6. Give CinePass a strong README

The pinned project is what people actually open. Put the live-demo link, a screenshot or GIF, an architecture section (seat holds, payments, idempotency), and "how to run the tests" at the top.

## Before you push

- Check the emails. The README uses `radhikashar2005@gmail.com`, taken from your master resume.
- Add links to your Codeforces, LeetCode and CodeChef profiles if you'd like the 🏆 line to be clickable. I couldn't find your handles.
