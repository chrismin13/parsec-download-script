# parsec-download-script
A script that downloads and runs the Parsec app and configuration on public machines

Open up a CMD and run:
```
curl doot.tk | cmd
```

# Why was doot.tk originally removed?
doot.tk was registered with Freenom and they no longer allow new domain registrations. Given that there was a risk of losing the domain, I had origianally switched the script over to my personal domain. While that was not as short of a link, it was a good temporary solution.

Freenom has been allowing domain renewals for the past 2 years, with occasional downtime. After the most recent downtime, I emailed freenom and they have since marked the domain as paid for the next years, until 2033-02-08. While I doubt the domain will last that long, it's still convenient so I'll keep it up and see if I can movie it to a paid registrar if it stops working again.

If for whatever reason the domain is down, you can still use my personal domain:
```
curl parsec.chrismin13.com | cmd
```

A benefit of the new setup is that I have set up the script to be the index.html file of the address, so you no longer need the -L as it is not a redirect.
