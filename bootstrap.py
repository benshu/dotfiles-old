import os
import datetime
import sys

files_to_bootstrap = [
    '.aliases',
    '.bash_profile',
    '.bash_prompt',
    '.bashrc',
    '.curlrc',
    '.editorconfig',
    '.exports',
    '.functions',
    '.gdbinit',
    '.gitattributes',
#    '.gitconfig',
    '.gitignore',
    '.gvimrc',
    '.hgignore',
    '.hushlogin',
    '.inputrc',
    '.screenrc',
    '.spacemacs',
    '.tmux.conf',
    '.vimrc',
    '.wgetrc',
    '.zshrc'
]
# TODO - add .vim folder
# .vim:
# backups
# colors
# swaps
# syntax
# undo


def query_yes_no(question, default="yes"):
    """Ask a yes/no question via raw_input() and return their answer.

    "question" is a string that is presented to the user.
    "default" is the presumed answer if the user just hits <Enter>.
        It must be "yes" (the default), "no" or None (meaning
        an answer is required of the user).

    The "answer" return value is True for "yes" or False for "no".
    """
    valid = {"yes": True, "y": True, "ye": True,
             "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = raw_input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "
                             "(or 'y' or 'n').\n")


def link_files():
    home = os.getenv('HOME')
    cwd = os.getenv('PWD')
    for file in files_to_bootstrap:
        target = home + '/' + file
        source = cwd + '/' + file
        if os.path.isfile(target):
            print 'File exists, creating backup @ ' , target
            os.system('mv ' + target + ' ' + target + '.backup' + datetime.datetime.now().isoformat())
        print('ln -nfs ' + target + ' ' + source)
        os.system('ln -nfs ' + source + ' ' + target)
        print('Linked ', target)
    pass


def main():
    print("This will link the dotfiles from the current directory to your home folder\n If a file exists it will be renamed to <filename>.backup")
    if query_yes_no("Are you sure ?"):
        link_files()
    pass

if __name__ == "__main__":
    main()
