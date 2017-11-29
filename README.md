# Backup Strategy

1. `jenkins/` backup at midnight everyday

2. remove the backup older than 7 days

# Environment Variables

- `JENKINS_BACKUP_PATH` `/mydata/jenkins`

# Cron Jobs

Sequantial order of date parts:

minute (from 0 to 59) hour (from 0 to 23) day of month (from 1 to 31) month (from 1 to 12) day of week (from 0 to 6) (0=Sunday)

## Scripts

1. backup to external disk

    `0 0 * * * /root/Workspace/jenkins-deployment/automation backup`
