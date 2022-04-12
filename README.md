# Pyenv Virtualenv (Sorta'ish)

This is an attempt to bring virtual environment usage to windows in a similar way that pyenv-viertualenv for linux and mac works ( or how I think it should work)

This is not associated with the offical project, and I have a feeling they would impliment this solution differently.

This is a drop in addon to pyenv that essentially automates virtual env creation with some sugar added.

The script basically automates the following:

```
pyenv shell 3.8.5
python -m pip install virtualenv
python -m venv env
```

It does some logic matching to detect older python 2 versions as well. I have a feeling that this requires at least python 3.3 also, but I don't have time to test this.
I have a couple hated legacy python 2.7 projects that I did test this with and it works.
Any of my python 3.5+ projects have worked as well.

# Installation
Simply drop the `pyenv-virtualenv.bat` file into your `C:\Users\<user>\.pyenv\pyenv-win\libexec\` directory (or where ever you installed pyenv.)

# Usage
Pretty strait forward, you can create env's either from a version, or from the current shimmed version, and either in the pyenv versions directory, or the current directory with the `-d` argument.


# Bugs
This has not been well tested, and there may be bugs. This works for my on my windows 10 pro system. You are welcome to play with it, sub pull reqs, etc. Feel free to fix anything you'd like. It is all done in batch which I hate. But they only other option was vbs, and sadly I know more batch than vbs.
