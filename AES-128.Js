
var sampleStr = "PRN=78945612396325871&ITC=1023888&AMT=1&CRN=INR&Pmt_Date=2019-02-07";
var crypto = require('crypto');

console.log("==================Encrypt===================")
var sampleOut = encrypt(sampleStr)
console.log(sampleOut)

console.log("\n==================Decrypt===================")
var decryptedStr = (decrypt("40jz aQDggxQNVeg6I3d9ljb5HtDuuhvEc6fvGQ/sQcS6JV1bKqT6NAskfVfPFwvxyf/89GtVUS6Gi7wPbIYLoUR0PGDOoSsxb7MB9fbFk5GG 5mUBybXB9WOivJjKok"));
console.log(decryptedStr);
console.log(decryptedStr.ITC);

function encrypt(message, messageEncoding = 'utf8', cipherEncoding = 'base64') {
    const cipher = crypto.createCipheriv('AES-128-ECB',"sf*r0,+cd#&0 06-",'');
    cipher.setAutoPadding(true);

    let encrypted = cipher.update(message, messageEncoding, cipherEncoding);
    encrypted += cipher.final(cipherEncoding);

    return encrypted;
  }

  function decrypt(encrypted, cipherEncoding = 'base64', messageEncoding = 'utf8') {
    const decipher = crypto.createDecipheriv('aes-128-ecb', "k7SfhnZVwJ5R5icV", '');
    decipher.setAutoPadding(true);
    var encrypted = encrypted.replace(/ /g, '+');
    let decrypted = decipher.update(encrypted, cipherEncoding, messageEncoding);      //Decryption
    decrypted += decipher.final(messageEncoding);
    decrypted = decrypted.replace(/&/g, '","');         //Converting response to JSON
    decrypted = decrypted.replace(/=/g, '":"');
    decrypted= '{"' + decrypted + '"}' ;
    decrypted = JSON.parse(decrypted);
    return decrypted;
  }


