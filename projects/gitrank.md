GitRank
--------

This is an already started project that is intended to be used for this course.

### Background
When you are a Developer building something you are often looking for libraries to make you life easier. However, it turns out there are many choices of libraries that does the same thing, How do you choose ? The usual process is to look at the library, the documentation, reviews on the web, and maybe, to be thorough try several. This takes time and we can change that.

### Challenge
There are some services that are emerging around this market like [StackShare](http://stackshare.io/), [OpenHub](https://www.openhub.net/),
[Libraries.io](https://libraries.io/),
[githubRanking.com](githubranking.com), [Product Hunt](http://www.producthunt.com/) ... Let's make something in between those, more innovative and easier to use.

## Team
[Brunno Attorre](../people/brunno-attorre.md), [Nicolas Joseph](../people/nicolas-joseph.md)

## First user Story
Our first user story can be found on: [Issue #53](https://github.com/gitlinks/gitrank-web/issues/53)

## Project Management
We are using Waffle as our project management tool. You can get a view about issues and features being added on the project. [Waffle](https://waffle.io/gitlinks/gitrank-web)

## Branches
The main project page can be seen on: https://github.com/gitlinks/gitrank-web
There are, currently, two main branches:
- Master: contains the code that will be deployed on the production server.
- Develop: contains the most recent code, including the last development made by the team (such as user stories, MVP, etc...). This is the source deployed in the test environment.
- All the other branches are for development only and contains specific features being developed that migh not be functional.

## CI Engine
- We are using Circle CI as our continous integration server. All the tests and builds run on each commit. The project page is:
https://circleci.com/gh/gitlinks/gitrank-web

## Servers
- Production server: [gitrank.io](https://gitrank.io)
- Test server: [dev.gitrank.io](http://dev.gitrank.io)

**Extensive information about the project can be found [here](https://github.com/gitlinks/github-rank-project)**
