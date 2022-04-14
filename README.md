# Pyenv Virtualenv for Windows (Sorta'ish)

This addon is an attempt to bring pyenv virtual environment features to windows similarly to pyenv-virtualenv for linux and mac do.
This addon is not associated with the official project, and I feel they would implement this solution differently.
This drop-in addon to pyenv essentially automates virtual env creation with some sugar added.

The script automates the following:
```
pyenv shell 3.8.5
python -m pip install virtualenv
python -m venv env
```

How this would work with a newly installed version of python installed with pyenv, is activate/shim that version with `pyenv shell`, and then install virtualenv/venv and call it to create an env.
My python 3.6+ projects have been tested, and a single 2.7 project. I have not tested with python 2 before 2.7, or python 3 before 3.6.

# Installation
Drop the pyenv-virtualenv.bat file into your `C:\Users\<user>\.pyenv\pyenv-win\libexec\` directory (wherever you installed pyenv.)

# Usage
Pretty straightforward, you can create env's either from a version or from the current shimmed version, and either in the pyenv versions directory or the current directory with the -d argument.

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

# Bug Possiblities
This has not been well tested, and there may be bugs. This addon works for me on my windows 10 pro system. You are welcome to play with it, submit a pull request, etc. Feel free to fix anything you'd like. It is all done in batch which I'm not great at. But the only other option was vbs, and I know more batch than vbs.

# Have an issues?
If you have an issue with the script, I'll try and help, but my responses may be slow with a day job and six kids.

# To the Pyenv folks...
Hey, I wish I had time to make an actual pull request and learn pyenv's structure, but I don't have time, and I threw this together. Please take it and make it something officially supported if it is helpful. As an aside, I think this is also how creating envs should work on the nix and mac versions :)
