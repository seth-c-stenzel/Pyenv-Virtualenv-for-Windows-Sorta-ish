# Pyenv Virtualenv for Windows (Sorta'ish)

## Intro
I use pyenv on windows to manage multiple versions of python, and like the simplicity it offers. I started using it after using it at a previous job but on linux / mac. For linux and mac there is an addon for pyenv which allows you to create virtual envs fairly easy as well as a few other things. I really missed that feature of being able to quickly create a new env from a current shimmed python version on windows. I figured a version for windows would come eventually, but hasn't yet, and so this week decided if I could make something that would get me most of the way there myself in a day (which I did), it would be worth it.

## What this is
This addon is an attempt to bring pyenv virtual environment features to windows similarly to pyenv-virtualenv for linux and mac.
This addon is not associated with the official project, and I feel they would implement this solution VERY differently.
This drop-in addon to pyenv essentially automates virtual env creation with checks and cleanup added.

The script automates the following:
```
pyenv shell 3.8.5
python -m pip install virtualenv
python -m venv env
```

How this would work with a newly installed version of python installed with pyenv, is the desired shimmed version is activated with `pyenv shell`, and then virtualenv/venv is installed and used to create a new env.

My python 3.6+ projects have been tested, and a single 2.7 project. I have not tested with python 2 before 2.7, or python 3 before 3.6.

## Installation
Drop the pyenv-virtualenv.bat file into your `C:\Users\<user>\.pyenv\pyenv-win\libexec\` directory (wherever you installed pyenv.)

## Usage
Pretty straightforward, you can create env's either from a selected version or from the current shimmed version, and either in the pyenv `versions` directory or the current working directory with the `-d` argument.

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

## Bug Possiblities
This has not been well tested, and there may be bugs. This addon works for me on my windows 10 pro system. You are welcome to play with it, submit a pull request, etc. Feel free to fix anything you'd like. It is all done in batch which I'm not great at. But the only other option was vbs, and I know more batch than vbs.

## Have an issues?
If you have an issue with the script, I'll try and help, but my responses may be slow with a day job and six kids.

## To the Pyenv folks...
Hey, I wish I had time to make an actual pull request and learn pyenv's structure, but I don't have time, and I threw this together. Please take it and make it something officially supported if it is helpful. As an aside, I think this is also how creating envs should work on the nix and mac versions :)

## The future
I will probably keep trying to add more of the nix/macos virtual env features to this over time, such as activating the envs after and some of its other features. One thing that I like better about my script is that it assumes the user may want to create a new env in the pyenv versions directory OR the current project directory.

Updates will sure to be slow as batch is kinda annoying to do things in, and I don't feel like using vbs right now either. Help on this front is welcome, and if gets to a polished point, maybe we can move things over to the official repo.

It probably should be redone with vbs or maybe ps to be more like the official repo. I know vbs / ps is way easier than batch, but I already knew some batch, and got too far in before thinking maybe batch was not the way to go, plus I don't know vbs, and don't feel like learning it right now as I'm trying to pickup Rust already.
