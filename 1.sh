#!/bin/bash
#smth new
#remote commit
while [  $domain= ]
do
    echo "Введи домен"
    read domain 
    domain=`echo $domain | sed 's/http:\/\///' | sed 's/\///'`

echo "Что сделать?
0. Выход
1. A-запись
2. Цепочка работы домена (в буфер)
3. Цепочка работы почты (в буфер)
4. Кто регистратор (в буфер)" 
read vibor
     case $vibor in
 0)	break;; 
 1)
        echo "dig +short $domain" 
        dig +short $domain;;
 2)
	 echo "dig +short $domain" > $HOME/bash/tmp/1.txt
         dig +short $domain >> $HOME/bash/tmp/1.txt
 
	 echo "whois $domain | grep nserver" >> $HOME/bash/tmp/1.txt 
	 whois $domain | grep nserver >> $HOME/bash/tmp/1.txt 			#ru
 
#org	 echo "whois $domain | grep 'Name Server'" >> $HOME/bash/tmp/1.txt
#org	 whois $domain | grep 'Name Server' >> $HOME/bash/tmp/1.txt

         echo "whois $domain | grep registrar" >> $HOME/bash/tmp/1.txt 
         whois $domain | grep registrar >> $HOME/bash/tmp/1.txt 		#ru
	 
	 cat "$HOME/bash/tmp/1.txt" | xclip ;;
 3)
	 echo "dig +short mx $domain" > $HOME/bash/tmp/1.txt
	 dig +short mx $domain >> $HOME/bash/tmp/1.txt

	 echo "whois $domain | grep nserver" >> $HOME/bash/tmp/1.txt
         whois $domain | grep nserver >> $HOME/bash/tmp/1.txt 			#ru

	 cat $HOME/bash/tmp/1.txt | xclip ;;
 4)
	echo "whois $domain | grep registrar"  > $HOME/bash/tmp/1.txt
        whois $domain | grep registrar  >> $HOME/bash/tmp/1.txt ;;
     esac

done
# echo "whois `dig +short $domain`"
# whois `dig +short $domain`
