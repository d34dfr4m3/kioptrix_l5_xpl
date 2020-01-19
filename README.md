## whatis
This is just a shit code I write while playing Kioptrix 2014 #5. The code here is just a automation in exploitation
using public exploits which I found in the exploit-db. 

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
