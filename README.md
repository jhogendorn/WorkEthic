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

### Customisation

I use [Planscope](https://planscope.io) to manage my work, and you might find it useful
too. If you don't, open up index.html and change the url you redirect to. Might I
suggest [Trello](http://trello.com)?

This might become some sort of config in future, if someone wants to give me a nice way to handle the deployment variables in this without utilising a full deployment tool. I'm using `sed` to manage apache.conf currently but that has a huge code smell.

### But how do I use these sites otherwise?

Well, you could write a cron job to activate/deactivate these host lines at various
times, that would be neat. Or even just a big red button to push for 'procrastination mode!'.

I personally try to only utilise these things via a separate device, like an iPad. I find
the physical separation helps clearly point out when you're *not working*.

### [License](LICENSE.md)

Creative Commons Attribution NonCommercial ShareAlike (CC-NC-SA)
