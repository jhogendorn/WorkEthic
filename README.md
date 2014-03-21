# Work Ethic

This is a short and sweet little gimmick that I use to stop myself wasting time online
when in a procrastination loop. It reminds me about what I'm doing, then points me to my
todo list.

You might find it useful also.

### Installation

1. `git clone https://github.com/jhogendorn/WorkEthic.git workethic && popd`
2. `./install.sh`
3. Edit your `/etc/hosts` file, eg:
   * `172.0.0.2 reddit.com`
   * `172.0.0.2 i.imgur.com`
   * `172.0.0.2 facebook.com`

#### Scripts

`install.sh` and bretherin are meant to be idempotent, and create a build directory.
`build.sh` is the *'build script'* (I use the term loosely), `config.sh` is generated
from `config-dist.sh` and ignored by git, use it for customisations.

#### Customisation

I use [Planscope](https://planscope.io) to manage my work, if you'd rather use something
else, edit `config.sh`. Might I suggest [Trello](http://trello.com)?


### But how do I use these sites otherwise?

I've elected to do no hosts management in this project, as its out of scope and I'm sure
everyone has their own tooling in this regard.

Well, you could write a cron job to activate/deactivate these host lines at various
times, that would be neat. Or even just a big red button to push for 'procrastination mode!'.

I personally try to only utilise these things via a separate device, like an iPad. I find
the physical separation helps clearly point out when you're *not working*.

### [License](LICENSE.md)

Creative Commons Attribution NonCommercial ShareAlike (CC-NC-SA)
