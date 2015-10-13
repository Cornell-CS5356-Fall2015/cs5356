Blockchain-based Lottery or Gambling
------------------------------------

### Background

Use the blockchain for a gambling and/or lottery system.

### Challenge

There are many sites that allow Bitcoin gambling, like Satoshibet, and making one (say for a different game of luck/skill) wouldn't be hard. But maybe we can use the public nature of the blockchain to determine winners (eg, pick winning lottery #s) in a transparently ungameable way?

### Team

[Harrison Gregg](/people/harrison-gregg.md), [Haiwei Su](/people/haiwei-su.md)

### Project Management

We are using [Trello](https://trello.com/b/Daie0wKH/blockchain-gambling) for our project management tool.

### First Story

Our first story is [here](https://trello.com/c/FjEsJj5m/13-first-story-users-can-create-accounts-start-lotteries-and-join-lotteries-the-creator-of-a-lottery-can-run-the-lottery-and-a-user) on Trello.

### Version Control

Our code is hosted on [GitHub](https://github.com/HarrisonGregg/BlockchainGambling).

### Automated Testing and Continuous Integration [![Build Status](https://travis-ci.org/HarrisonGregg/BlockchainGambling.svg)](https://travis-ci.org/HarrisonGregg/BlockchainGambling)

On upload to GitHub, [Travis CI](https://travis-ci.org/HarrisonGregg/BlockchainGambling) automatically runs our Django unit tests and pushes all changes to Heroku if all tests pass.

### Deployment

Our webapp is hosted on [Heroku](https://mighty-journey-2253.herokuapp.com/bet/).