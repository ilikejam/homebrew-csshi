# homebrew-csshi
Homebrew tap for csshi

https://github.com/ilikejam/csshi

## Python version

As an arbitrary default (but probably reasonable given the sorts of people who use `csshi`), we track the `awscli` homebrew formula's python version.

## Python modules

We're not a published pypi package, so some effort is required to update the python deps here.
In the main csshi repo:
Update:
* requirements.in
* pyproject.toml

Run: `pip-compile --generate-hashes --strip-extras requirements.in`
Test csshi, commit, push, tag, push tags, cut new Release

Then:
```
cd /opt/homebrew/Library/Taps/ilikejam/homebrew-csshi/Formula
```
Update tar.gz URL and sha256 in `csshi.rb`
```
brew update-python-resources csshi
cp csshi.rb $TMPDIR/
rubocop -a $TMPDIR/csshi.rb
cp -f $TMPDIR/csshi.rb csshi.rb
```
Commit, push
