# Contributing

This project is work of [many contributors](https://github.com/Cornell-CS5356-Fall2015/cs5356/graphs/contributors).
You're encouraged to submit [pull requests](https://github.com/Cornell-CS5356-Fall2015/cs5356/pulls),
[propose features and discuss issues](https://github.com/Cornell-CS5356-Fall2015/cs5356/issues).

In the examples below, substitute your Github username for `contributor` in URLs.

## Fork the Project

Fork the [project on Github](https://github.com/Cornell-CS5356-Fall2015/cs5356) and check out your copy.

```
git clone https://github.com/contributor/cs5356.git
cd cs5356
git remote add upstream https://github.com/Cornell-CS5356-Fall2015/cs5356.git
```

## Create a Topic Branch

Make sure your fork is up-to-date and create a topic branch for your feature or bug fix.

```
git checkout master
git pull upstream master
git checkout -b my-feature-branch
```

## Contribute

Add your document, or make changes.

## Commit Changes

Make sure git knows your name and email address:

```
git config --global user.name "Your Name"
git config --global user.email "contributor@example.com"
```

Writing good commit logs is important. A commit log should describe what changed and why.

```
git add ...
git commit
```

## Push

```
git push origin my-feature-branch
```

## Make a Pull Request

Go to https://github.com/contributor/cs5356 and select your feature branch.
Click the 'Pull Request' button and fill out the form. Pull requests are usually reviewed within a day or two.

## Rebase

If you've been working on a change for a while, rebase with upstream/master.

```
git fetch upstream
git rebase upstream/master
git push origin my-feature-branch -f
```

## Be Patient

It's likely that your change will not be merged and that the nitpicky maintainers will ask you to do more, or fix seemingly benign problems. Hang on there!

## Thank You

Please do know that we really appreciate and value your time and work. We love you, really.
