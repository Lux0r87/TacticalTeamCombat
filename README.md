# TacticalTeamCombat


# GIT Commands
: git status<br>
Shows the status for changed files.

: git pull origin branch-name<br>
Gets the latest commits from that branch.

: git add path-to-file<br>
Adds the given file to the commit. You can use a dot (.) to add all files to the commit.

: git commit -m "The message of the commit"<br>
Only commit the files that are added using the git add command.

: git push origin branch-name<br>
Pushes the commits to the server.

: git branch name<br>
Creates a branch with the given name.

: git checkout name<br>
Goes to the branch that has the given name. For example: "git checkout master", will go to the master branch.

: git merge branch-name<br>
Merges the given branch with the branch you're currently on.

: git tag -a v0.0.1 -m 'version 0.0.1'<br>
Annotated Tag: The -m specifies a tagging message, which is stored with the tag.

: git push origin --tags<br>
This will transfer all of your tags to the remote server that are not already there.
