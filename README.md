# homebrew-csshi
Homebrew tap for csshi

https://github.com/ilikejam/csshi

## Python version

As an arbitrary default (but probably reasonable given the sorts of people who use `csshi`), we track the `awscli` homebrew formula's python version.

## Python modules

We're not a published pypi package, so some effort is required to update the python deps here:  
Update:
* ilikejam/csshi:requirements.txt
* ilikejam/csshi:pyproject.toml

Commit, tag, push with tags, cut Release
```
cd /opt/homebrew/Library/Taps/ilikejam/homebrew-csshi/Formula
```
Update tar.gz URL and sha256 in `csshi.rb`
```
brew update-python-resources -p csshi
```
Pick only the modules required (i.e. those from requirements.txt/pyproject.toml) and paste into `csshi.rb`
```
rubocop -a csshi.rb
```
Commit  
Push
