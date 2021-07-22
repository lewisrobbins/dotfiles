# dotfiles
My MacOS dot files

## Installing

1. Clone the repository
2. Initialise the submodules

```sh
git submodule init
```

3. Clone submodules

```sh
git submodule update --recursive
```

## Updating Submodules

To update all the submodules, run:

```sh
git submodule update --remote
```

## Back-ups

1. Create a `cronttab` entry with:

```sh
crontab -e
```

2. Insert

```sh
05 18 * * SUN /Users/<user>/Documents/dev/dotfiles/backup.sh
```

3. View all `cron` jobs with `crontab -l`

All submodules are tracking the `master` branch of each repository

[GitBook Submodule
Reference](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
