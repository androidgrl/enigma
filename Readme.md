Welcome to Enigma!

Enigma will encrypt your secret message.
Enter your message inside of message.txt file.
To encrypt the message and to save the encrypted message in a file named encrypted.txt, enter the following Input in your terminal, and you will receive the following output:

Input:
ruby ./lib/encrypt.rb message.txt encrypted.txt

Output:
1488nef8f7fhwif9wh
Created 'encrypted.txt' with the key 82648 and date 030815

Enigma will also decrypt your message.
To decrypt the message contained inside a file named encrypted.txt and to save the decrypted message inside a file named decrypted.txt, enter the following Input in your terminal.  You will receive the following output.

Input:  
ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 15823 030315

(The last two entered elements are the key and the date which you will need to specify in order to decrypt the message.)

Output:
Created 'decrypted.txt' with the key 82648 and date 030415
