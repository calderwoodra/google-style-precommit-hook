A handy [pre-commit](http://pre-commit.com/) hook which will run Google's java
code style formatter for you on your code!

Usage:

```
repos:
-   repo: https://github.com/calderwoodra/google-style-precommit-hook.git
    sha: be756657f2f7e3882e43ce005746dfa8c949a671
    hooks:
    -   id: google-style-java
```

*Note*: this file stores Google's code style formatter jar in a `.cache/`
directory so that it doesn't need to be re-downloaded each time.  You will
probably want to add `.cache/` to the `.gitignore` file of the project which
uses this hook.
