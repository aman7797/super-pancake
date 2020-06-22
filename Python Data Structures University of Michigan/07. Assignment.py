#  Write a program to read through the mbox-short.txt and figure out who has sent the greatest number of mail messages. The program looks for 'From ' lines and takes the second word of those lines as the person who sent the mail. The program creates a Python dictionary that maps the sender's mail address to a count of the number of times they appear in the file. After the dictionary is produced, the program reads through the dictionary using a maximum loop to find the most prolific committer.

name = input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)

count = 0
mail_dict =dict()
for line in handle:
    if not line.startswith('From:'): continue

    mail_string = line.split()[1]
    mail_dict[mail_string] = mail_dict.get(mail_string,0) + 1


# print(f"Counted Mails :: {mail_dict}")

max_mail_sent = max(mail_dict.values())

for key, value in mail_dict.items(): 
         if max_mail_sent == value: 
             print(key, value)
