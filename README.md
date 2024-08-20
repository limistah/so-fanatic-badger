## StackOverflow Fanatic Badge Earner

[Fanatic badge](https://stackoverflow.com/help/badges/83/fanatic) is one of the easiest to earn on Stackoverflow.

It requires consistently logging on to s/o every day for 100 days. That is a lot of discipline for a geeky Q&A site.

I intend to solve this with the attached ruby script.

## How to run
Install dependencies:
```bash
bundler install
```

Provide two environment variables(for GitHub action, set them as action secrets):
- SO_EMAIL: the login email to the account
- SO_PASSWORD: the password for the account

Run the script:
```bash
./script.rb
```

## Enable Automation with Github Action
Update the .github/workflows/cron.yml, set the cron value to something like: 15 */2 * * *'
```yaml
on:
  schedule:
    - cron: '15 */2 * * *'  # At every 15 minutes past the 8th hour
```
Then wait for the next 100 days to get your badge.

[Check this commit](https://github.com/limistah/so_login_crawler/blob/2f65a84a89321aefcc118de071755aeac7086c75/.github/workflows/cron.yml) for a complete reference

## Bug Report
Please file an issue.

## Contribution
Just open a PR.
