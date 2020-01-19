## whatis
This is just a shit code I write while playing Kioptrix 2014 #5. The code here is just a automation in exploitation
using public exploits which I found in the exploit-db. 

The freak.you will automate the RCE and use the Directory Traversal to read the output, just like a regular shell but very very worst. And the freakyou can read a encoded payload and send in stages to the target using the RCE vulnerability, decode and execute the payload, yes, let you netcat waiting for it, baby.

The writeup is in my blog, link here


And nope, probably I will never touch this code again, but here is some to do's:
- Pass the payload in clear text and the tool will encode and upload, then decode and execute.
- Put suport for another interpreters, not just perl hardcoded.
- Don't stop hacking.


#### Usage? why not, right?
So, you will load the freakyou.sh to your environment just like this:
```sh
$ . freakyou.sh
```
Yes, put the dot in the line. 

Then you will just run the functions inside freakyou.sh. 
```
$ rce "ls -l"   # Will execute ls -l in the remote target 
$ write         # Will upload a payload, read the source to understant, pls
```

##### Exploits
- phptax 0.8 - Remote Code Execution: https://www.exploit-db.com/exploits/21665
- pChart 2.1.3 - Multiple Vulnerabilities: https://www.exploit-db.com/exploits/31173
- Kioptrix2014 #5 - https://www.vulnhub.com/entry/kioptrix-2014-5,62/
