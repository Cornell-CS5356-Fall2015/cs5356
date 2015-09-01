# Developer Culture and Workflow

* [Lecture Slides PDF](cs5356-01-developer-culture-and-workflow.pdf) / [Google Docs](https://docs.google.com/a/dblock.org/presentation/d/1_YizH6yDzBmtGYcNPENEcxWiYBpg8T_CmMg8Nv7pJMU/edit?usp=sharing)

## Software Eating the World

_In 2007, right before the first iPhone launched, [Marc Andreessen](https://en.wikipedia.org/wiki/Marc_Andreessen) asked Steve Jobs the obvious question: The design of the iPhone was based on discarding every physical interface element except for a touchscreen. Would users be willing to give up the then-dominant physical keypads for a soft keyboard? His answer was brusque: "They’ll learn." Steve turned out to be right._

_A great deal of product development is based on the assumption that products must adapt to unchanging human needs or risk being rejected. Yet, time and again, people adapt in unpredictable ways to get the most out of new tech._

_People change, then forget that they changed, and act as though they always behaved a certain way and could never change again. Because of this, unexpected changes in human behavior are often dismissed as regressive rather than as potentially intelligent adaptations._

_But change happens anyway. "Software is eating the world" is the most recent historic transformation of this sort._

_Creative people tinker to figure out the most interesting applications, others build on those, and entire industries are reshaped._

This incremental approach is the very nature of startups and is examined in [Breaking Smart](http://breakingsmart.com/season-1), quoted throughout this lecture.

## Software First

We have begun operating a transition to software-first computing. Ride-sharing is a great illustration.

_To traditionalists, particularly in the United States, the car is a motif for an entire way of life, and the smartphone just an accessory. To early adopters who have integrated ridesharing deeply into their lives, the smartphone is the lifestyle motif, and the car is the accessory. To generations of Americans, owning a car represented freedom. To the next generation, not owning a car will represent freedom._

_And this dramatic reversal in our relationships to two important technologies – cars and smartphones – is being catalyzed by what was initially dismissed as "yet another trivial app."_

Today we are almost able to put a chip into every single object on earth at a minimal cost and interconnect these chips. Making this useful and changing our world by doing so is going to be done with software. We're only at the beginning of this transformation where software is eating the world.

## Startups

A typical startup begins by selecting a domain, formulating a hypothesis, iterating within this domain and only then, maybe, discovering a business where customers are willing to pay for a product. Thus, many startups are 100% software. It's a medium in virtually infinite supply with incredible potential where a "trivial" app can change our world.

How do we approach building a technology company? What does this all mean in the context of Software Engineering?

## Many Possible Futures

At its simplest, a technology company enabled by software has many possible outcomes (or futures). A startup may pick one such future and attempt to iterate towards it. Often, after making a few steps it will learn something new, make a turn or abandon the entire path and _pivot_. Therefore, the Software Engineering practice in a startup has two almost conflicting responsibilities.

1. Deliver working software to achieve the outcome currently chosen.
2. Enable all possible outcomes.

### A Waterfall Model

One could deliver working software to achieve the outcome currently chosen by carefully planning the entire path, dividing the deliverables into milestones, then implementing these deliverables. The question asked by the waterfall model is _What are all the steps I need to make to achieve my outcome?_

However, many of possible outcomes are yet to be discovered. This model doesn't easily allow to ensure all possible outcomes, or at least carries the risk of going too far in the wrong direction.

### An Iterative Model

Instead of considering the entire path towards a future outcome, consider just the next step, implement it and reexamine the situation. This is sometimes called an agile, but more generally is an iterative model. The question asked by this model is _What do I need to do next to achieve this and possibly other outcomes?_ Iterative or agile comes with various ways of practicing it, from Extreme Programming (only focus on what you need to do next), to Scrum (plan an iteration that lasts a few weeks) or Kanban (use a control system).

## Engineering Practice

To achieve any outcome, an Engineering practice must create a repeatable system in which _what_ we are trying to make may change rapidly, but _how_ we make can be an increasingly solid foundation that makes more of everything possible as time goes by. From a purely software engineering perspective we begin by creating a _development workflow_ that, in turn, contributes to establishing a _development culture_.

## Staying Organized

We need a bare minimum of process in which a group of committed individuals is iterating with software. This group includes _pigs_ and does not include _chickens_ from the [business fable of The Chicken and the Pig](https://en.wikipedia.org/wiki/The_Chicken_and_the_Pig). This can take a form of a get-together in which individuals propose tasks that can be accomplished by them (eg. _setup source control_) and the next meeting (eg. _a quick check-in tomorrow at 11am_) is decided.

It's equally important to maintain a strong working relationship with the chickens, though. One possible way of doing it may be to collaborate on a domain wiki (see below).

## Tracking Tasks

The number of tasks is going to grow rapidly, so we need a place to track them and to provide visibility into them.

We need a place to put _ideas_, _next_ workitems, items being worked on _now_, and _done_ items. The focus should be on simplicity, systems like [Trello](https://trello.com) or [Waffle.io](https://waffle.io) work well. It's the responsibility of each team member to create and move their tasks around.

## Understanding the Domain

Most projects model some elements of the real world, so it's important that all team members use the same language and that the same words have the same meanings in everybody's minds and code. Phil Karlton (at Netscape Communications, Phil held the title of Principal Curmudgeon), once said: _There are only two hard things in Computer Science: cache invalidation and naming things._ One good way to understand the domain is to create a written taxonomy and to discuss terms between team members. Working on a domain wiki is a great way to engage non-engineers in regular conversations with engineers, an essential collaboration.

## Using Source Control

Source Control, also known as _Version Control_ or _Revision Control_ lets you _track files_, particularly code, over time and to effectively _collaborate_ between multiple engineers. It also provides history, so you can experiment with a safety net.

We're going to learn Git. Git is a fast, open source, distributed version control system. It's unlike CVS, SourceSafe, ClearCase, Subversion or Perforce, and is somewhat like Mercurial (Hg). Distributed means it works offline. Git is an essential enabler of the open-source ecosystem as the fork and pull model is the default _open-source workflow_.

* [Git Walkthrough](/course/01-developer-culture-and-workflow/git-walkthrough.md)

## Development Environment

A development environment is a set of tools and settings that you are often familiar with. An interesting way of creating a repeatable environment across multiple computes is _dotfiles_, enabling you to backup, restore and sync preferences and settings for your toolbox, share yours and learn from others.

## Editors

An editor is one of those essential tools in your toolbox. These days most developers use a range of _text editors_ to _integrated developer environments_. Most popular editors are [Sublime Text](http://www.sublimetext.com), [Vim](http://www.vim.org) and [Emacs](http://www.gnu.org/software/emacs). There're some more specialized editors, such as [Eclipse](http://www.eclipse.org) for Java and some newcomers like [Atom](https://atom.io).

## Onboarding

When you start a project, write a _Getting Started_ guide that explains how to setup the project. Often it's just a README.md document. When a new developer starts working on a project they typically begin by reading this guide and updating it with any changes that have not been made as the project evolved. Those changes are often their first commit.

The quality of the onboarding documentation usually speaks volumes about the project.

## Code Style Guides

Every major project has its own style guide: a set of conventions (sometimes arbitrary) about how to write code for that project. It is much easier to understand a large codebase when all the code in it is in a consistent style. There're style guides published by companies like [Google](https://github.com/google/styleguide) and style guides enforced by software, such as [RuboCop](https://github.com/bbatsov/rubocop). Generally the purpose of a style guide is to make code look as if it were written by one person.

## Continuous Delivery

Continuous Delivery is a software engineering approach in which teams keep producing valuable software in short cycles and ensure that the software can be reliably released at any time.

## Continuous Deployment

A good system can be setup locally, setup for testing by 1 developer, setup for testing by a group of people (often called a _staging_ environment) and, finally, setup for _production_ that looks identical to the staging environment. The process of taking code to production as soon as something valuable is ready is called _continuous deployment_. It's an important part of continuous delivery. This notable means that deployment can happen at any time, so you must write code in a way that doesn't break existing features and try to add small value as often as possible, as opposed to a lot of value at once. Continuous deployment trives to reduce the amount of changes going to production at once, therefore minimizing risk.

## Testing and Quality

The cost of fixing bugs grows exponentially as broken software goes to production. Continuous delivery has an emphasis on catching issues early, sometimes even before any code is written. This is called _Test Driven Development_, where tests are written first. There're _unit tests_, _integration tests_, etc. Good tests allow new developers to feel confident in a project or provide explanation about how something is supposed to work and sometimes even explain why.

## Working with Tests

Tests are a great way to write good working code. First, you create a unit test that fails. Then you write production code that makes the test pass. Then you run all the tests and cleanup the mess you just made (refactor) until you're satisfied with the quality of your code. This is called a _red, green, refactor_ cycle.

## Continuous Integration

Every time code leaves your personal computer you run all tests. Every time code is merged into a repository from which it goes to a staging environment the same tests (and possibly more) are run. The process of running more and more tests during these integration points is called _continuous integration_.

## Code Reviews

Code review is systematic examination of code. It is intended to find and fix mistakes overlooked in the initial development phase, often simply by adding a pair of eyes to look over the new code. Open-source workflow with Github pull requests is the most popular code review system today.

## Pair Programming

Pair programming is a technique where two programmers work as a pair together on one workstation. One is the _doer_ and types code and the other is the _thinker_ giving instructions. It's another form of code review. The two programmers switch roles frequently.

## Homework

See [this link](/course/01-developer-culture-and-workflow/git-walkthrough.md#homework) for homework and [your startup project](/projects/logistics.md) for deliverables for next week - a startup project pitch.
