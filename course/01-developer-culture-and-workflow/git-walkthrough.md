Git Walkthrough
===============

## Objective

Learn the basics of Git and understand what role Github plays in the ecosystem of Ruby and Ruby-on-Rails. Learn concepts, such as *snapshot*, *repository*, *pull*, *push* and *topical branches*.

## Git

Git is a fast, open source, distributed version control system. It's unlike CVS, SourceSafe, ClearCase, Subversion or Perforce, and is somewhat like Mercurial (Hg). Distributed means it works offline. Git is an essential enabler of the ecosystem of Ruby and Ruby-on-Rails.

## Git Snapshots

A git commit is a snapshot of all files and meta information at a given point in time, not a file diff.

## A New Git Repository

Create a GIT repostory offline. We'll call this one *red*.

    $ mkdir cs5356
    $ cd cs5356
    cs5356$ mkdir red
    cs5356$ cd red

    cs5356/red$ git init
    Initialized empty Git repository in /home/dblock/cs5356/red/.git/

    cs5356/red$ touch README.md

    cs5356/red$ git add README.md

    cs5356/red$ git status

    # On branch master
    #
    # Initial commit
    #
    # Changes to be committed:
    #   (use "git rm --cached <file>..." to unstage)
    #
    # new file:   README.md
    #

    cs5356/red$ git commit -m "Added README."
    [master (root-commit) 3923738] Added README.
     0 files changed, 0 insertions(+), 0 deletions(-)
     create mode 100644 README.md

    cs5356/red$

## Our Local Repository

Our previous commit placed our changes into our *local* repository, a concept unique to distributed version control systems like Git and Hg.

Examine the history of this *local* repository.

    cs5356/red$ git log

    commit 392373835e0f7702251d45a088664918e9125c97
    Author: dblock
    Date:   Wed Aug 26 09:34:08 2015 -0500

    Added README.

## Pushing to a Remote Repository: Github

[Create a new repository on Github](https://github.com/repositories/new) called *red*. That's an empty repository with no files. Github ran the same git commands as we just did on their servers.

We can connect our local *red* repository with Github's by adding a remote location called *origin*. This name is just a convention.

    cs5356/red$ git remote add origin git@github.com:<username>/red.git

One can now see the remote branch listed:

    cs5356/red$ git remote
    origin

Push all our changes to Github.

    cs5356/red$ git push -u origin master

Next time you can push all pending changes on all branches.

    cs5356/red$ git push

The opposite of *pushing* is *pulling*. The following updates the local copy to the remote changes on the *master* branch.

    cs5356/red$ git pull origin master

## Cloning

Use `git clone` to get a copy of an existing Github repository to your local machine.

    cs5356$ git clone git@github.com:<username>/red.git green

This creates a new folder called *green* with the contents of the *red* repository, a *local* repository from the *remote* repository on github.

## Topic Branches

Unlike other source controls, branches are cheap. In Git it's considered a good practice to never work on the *master* branch and create *topic branches* instead. A topic branch is created off master.

First, list your branches. You will see that you are on the *master* branch.

    cs5356/red$ git branch

Ensure the *master* branch is up-to-date.

    cs5356/red$ git pull origin master

Create a new branch *readme-changes*.

    cs5356/red$ git checkout -b readme-changes
    Switched to a new branch 'readme-changes'

    cs5356/red$ git status
    # On branch readme-changes
    nothing to commit (working directory clean)

Make some changes on the branch, commit them and push them to Github.

    cs5356/red$ git push origin readme-changes

When the feature on a branch is ready, merge it to *master*.

    cs5356/red$ git checkout master
    cs5356/red$ git merge readme-changes

## Visualize the Branches

Commits add to the log inside Git, allowing one to visualize the changes to each particular branch.

    cs5356/red$ git log --graph

Use the built-in GUI GitK to see this graph

    cs5356/red$ gitk

## Forking

To contribute to someone else's work, create a new *fork* via Github, then clone your fork to your local environment. To submit changes, make *pull requests*.

To pull changes made to the original work, one would need to set up an `upstream` remote repository.

    cs5356/red$ git remote add upstream git@github.com:<original_author>/<upstream_source>.git

    cs5356/red$ git remote
    origin
    upstream

To pull any changes made to upstream one would run the following command:

    cs5356/red$ git pull upstream master

### Homework

Fork https://github.com/Cornell-CS5356-Fall2015/cs5356, clone your fork, add a page for yourself under _people_, including a photo and some personal links. Add a link to this page to a _Students_ section under _People_. Commit, push and make a pull request.

