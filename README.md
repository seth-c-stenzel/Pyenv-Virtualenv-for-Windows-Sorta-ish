# Pyenv Virtualenv for Windows (Sorta'ish)

This is an attempt to bring virtual environment usage to windows in a similar way that pyenv-virtualenv for linux and mac works ( or how I think it should work on windows)

This is not associated with the offical project, and I have a feeling they would impliment this solution differently.

This is a drop in addon to pyenv that essentially automates virtual env creation with some sugar added.

The script basically automates the following:

```
pyenv shell 3.8.5
python -m pip install virtualenv
python -m venv env
```

The way this would work with a newly installed version of python installed with pyenv, is that it would activate/shim that version with a pyenv shell call, and then install virtualenv for python 2.7, or use venv for 3 to create an env.

It does some checks to detect older python 2 versions or at least worked with 2.7. It does install virtualenv for whatever 2.7 version you are creating from.
I have a feeling that this requires at least python 3.3 also, but I don't have time to test this.
Any of my python 3.6+ projects have worked as well.

# Installation
Simply drop the `pyenv-virtualenv.bat` file into your `C:\Users\<user>\.pyenv\pyenv-win\libexec\` directory (or where ever you installed pyenv.)

# Usage
Pretty strait forward, you can create env's either from a version, or from the current shimmed version, and either in the pyenv versions directory, or the current directory with the `-d` argument.

```
>pyenv virtualenv

Usage for pyenv virtualenv:
   virtualenv <env_name>                Creates env from current env in pyenv versions directory       
   virtualenv <env_name> -d             Creates env from current env in current working directory      
   virtualenv <pyenv_version> <env>     Creates env from specified version in pyenv versions directory 
   virtualenv <pyenv_version> <env> -d  Creates env from specified version in current working directory


>pyenv versions   
  2.7.18
  3.10.0b3
* 3.10.0b3-system (set by C:\Users\*****\.pyenv\pyenv-win\version)
  3.11.0a7

>pyenv virtualenv 3.10.0b3 env -d
```

# Bugs
This has not been well tested, and there may be bugs. This works for my on my windows 10 pro system. You are welcome to play with it, sub pull reqs, etc. Feel free to fix anything you'd like. It is all done in batch which I hate. But they only other option was vbs, and sadly I know more batch than vbs.

# Issues
If you have an issue with the script, I'll try and help, but with a day job and 6 kids, my responses may be slow. 
