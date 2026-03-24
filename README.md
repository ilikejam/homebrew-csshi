# homebrew-csshi
Homebrew tap for csshi

https://github.com/ilikejam/csshi

## Python modules

We're not a published pypi package, so some effort is required to update the python deps here:  
Update:
* ilikejam/csshi:requirements.txt
* ilikejam/csshi:pyproject.toml

Commit, tag, push with tags, cut Release
```
brew remove csshi
brew untap ilikejam/csshi
brew tap-new ilikejam/csshi
cd /opt/homebrew/Library/Taps/ilikejam/homebrew-csshi/Formula
```
Copy csshi.rb from ilikejam/homebrew-csshi  
Update tar.gz URL and sha256
```
brew update-python-resources -p csshi
```
Pick only the modules required (i.e. those from requirements.txt/pyproject.toml) and paste into csshi.rb
```
rubocop -a csshi.rb
```
Copy csshi.rb back to ilikejam/homebrew-csshi repo  
Commit  
Push
