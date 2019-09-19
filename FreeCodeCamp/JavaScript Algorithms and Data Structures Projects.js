// 1. Palindrome Checker
/**
 * Return trueif the given string is a palindrome. Otherwise, return false.

A palindrome is a word or sentence that's spelled the same way both forward and backward, ignoring punctuation, case, and spacing.

Note
You'll need to remove all non-alphanumeric characters (punctuation, spaces and symbols) and turn everything into the same case (lower or upper case) in order to check for palindromes.

We'll pass strings with varying formats, such as "racecar", "RaceCar", and "race CAR"among others.

We'll also pass strings with special symbols, such as "2A3*3a2", "2A3 3a2", and "2_A3*3#A2".
 */

function palindrome(str) {
    // Other than alphabet and number it will remove it and as well as remove space. After that it will convert it to lowercase
    var lowerCaseStr = str.replace(/[^a-zA-Z0-9 ]/g, "").replace(/ /g,'').toLowerCase();
    // Split the lowerCaseStr into array than it will reverse the splitted array and join it again
    var reverseString = lowerCaseStr.split('').reverse().join(''); 
    if (lowerCaseStr===reverseString){
      return true;
    }else {
      return false;
    }
  }
  
console.log(palindrome("A man, a plan, a canal. Panama"));

// Output
// true

// 2.Roman Numeral Converter
/**
 * Convert the given number into a roman numeral.

All roman numerals answers should be provided in upper-case.
 */
  
function convertToRoman(num) {
    var str='';
    var countOfThousand=Math.trunc(num/1000);
    console.log("countOfThousand ::- "+countOfThousand);
    while(countOfThousand!=0) 
    {
       str = str+'M';
       console.log("countOfThousand after ::- "+str);
       countOfThousand--;
     }
   
    var hundredPlace = num%1000;
    console.log("hundredPlace ::- "+hundredPlace);
   
    if(hundredPlace>=900){
      // To Check if hundred place contain 900 can replace by 'CM'
      str = str+'CM';
      hundredPlace = hundredPlace - 900
    }
   
    if(hundredPlace>=500){
      // To Check if hundred place contain 500 can replace by 'D'
      str = str+'D';
      hundredPlace = hundredPlace - 500
    }
   
    if(hundredPlace>=400){
      // To Check if hundred place contain 400 can replace by 'CD'
      str = str+'CD';
      hundredPlace = hundredPlace - 400
    }
   
    var countOfHundred=Math.trunc(hundredPlace/100);
    console.log("countOfHundred ::-"+countOfHundred);
    while(countOfHundred!=0) 
    {
       str = str+'C';
       console.log("countOfHundred after ::- "+str);
       countOfHundred--;
     }
      
    var tenPlace = hundredPlace%100;
    console.log("tenPlace ::- "+tenPlace);
   
    if(tenPlace>=90){
      // To Check if ten place contain 90 can replace by 'XC'
      str = str+'XC';
      tenPlace = tenPlace - 90
    }
   
    if(tenPlace>=50){
      // To Check if ten place contain 50 can replace by 'L'
      str = str+'L';
      tenPlace = tenPlace - 50
    }
   
    if(tenPlace>=40){
      // To Check if ten place contain 40 can replace by 'XL'
      str = str+'XL';
      tenPlace = tenPlace - 40
    }
    
    var countOfTen=Math.trunc(tenPlace/10);
    console.log("countOfTen ::-"+countOfTen);
    while(countOfTen!=0) 
    {
       str = str+'X';
       console.log("countOfTen after ::- "+str);
       countOfTen--;
     }
   
    var onePlace = hundredPlace%10;
    console.log("onePlace ::- "+onePlace);
   
    if(onePlace==9){
      // To Check if ten place contain 9 can replace by 'IX'
      str = str+'IX';
      onePlace = onePlace - 9
    }
   
     if(onePlace>=5){
      // To Check if ten place contain 5 can replace by 'V'
      str = str+'V';
      onePlace = onePlace - 5
    }
   
    if(onePlace==4){
      // To Check if ten place contain 4 can replace by 'IV'
      str = str+'IV';
      onePlace = onePlace - 4
    }
   
    var countOfOne=Math.trunc(onePlace/1);
    console.log("countOfOne ::-"+countOfOne);
    while(countOfOne!=0) 
    {
       str = str+'I';
       console.log("countOfOne after ::- "+str);
       countOfOne--;
     }
   
    return str;
   }
   
console.log(convertToRoman(4059));

// Output
// MMMMLIX

// 3. Caesars Cipher
/**
 * One of the simplest and most widely known ciphers is a Caesar cipher, also known as a shift cipher. In a shift cipherthe meanings of the letters are shifted by some set amount.

A common modern use is the ROT13 cipher, where the values of the letters are shifted by 13 places. Thus 'A' ↔ 'N', 'B' ↔ 'O' and so on.

Write a function which takes a ROT13 encoded string as input and returns a decoded string.

All letters will be uppercase. Do not transform any non-alphabetic character (i.e. spaces, punctuation), but do pass them on.
 */

function rot13(str) { // LBH QVQ VG!
    var codeA = "A".charCodeAt(0);
    var codeN = "N".charCodeAt(0);
    var codeZ = "Z".charCodeAt(0);
    var newArr = [];

    //Here we will start reading the string 
    for(var i =0; i<str.length; i++){
        var code = str.charCodeAt(i);
        if(code>=codeA && code<=codeZ){
            if(code>=codeN)
            {
                newArr.push(String.fromCharCode(code-13));
            //   console.log("newArr - 13 ::-  "+newArr);
            }
            else
            {
                newArr.push(String.fromCharCode(code+13));
            //   console.log("newArr + 13 ::-  "+newArr);
            }
        }else{
            newArr.push(str[i]);}
    }
    return newArr.join("");
}

console.log(rot13("SERR PBQR PNZC"));

// Output
// FREE CODE CAMP

// 4.Telephone Number Validator
/**
 * Return trueif the passed string looks like a valid US phone number.

The user may fill out the form field any way they choose as long as it has the format of a valid US number. The following are examples of valid formats for US numbers (refer to the tests below for other variants):

555-555-5555
(555)555-5555
(555) 555-5555
555 555 5555
5555555555
1 555 555 5555
For this challenge you will be presented with a string such as 800-692-7753or 8oo-six427676;laskdjf. Your job is to validate or reject the US phone number based on any combination of the formats provided above. The area code is required. If the country code is provided, you must confirm that the country code is 1. Return trueif the string is a valid US phone number; otherwise return false.
 */

function telephoneCheck(str) {
    
    // (1\s?) this means it can be 1 or 0
    // (\d{3}\) matches a single character that is a digit for 3 next places
    // [\s\-] check for - after this \d{3}(checking 3 digit)
    // $ is end of the string
    var regex = /^(1\s?)?(\(\d{3}\)|\d{3})[\s\-]?\d{3}[\s\-]?\d{4}$/;
    // .test will return boolean after checking the regex in the string 
    return regex.test(str);
}
  
console.log(telephoneCheck("1(555)555-5555"));

// Output
// true

// 5. Cash Register
/**
 * Design a cash register drawer function checkCashRegister()that accepts purchase price as the first argument (price), payment as the second argument (cash), and cash-in-drawer (cid) as the third argument.

cidis a 2D array listing available currency.

The checkCashRegister()function should always return an object with a statuskey and a changekey.

Return {status: "INSUFFICIENT_FUNDS", change: []}if cash-in-drawer is less than the change due, or if you cannot return the exact change.

Return {status: "CLOSED", change: [...]}with cash-in-drawer as the value for the key changeif it is equal to the change due.

Otherwise, return {status: "OPEN", change: [...]}, with the change due in coins and bills, sorted in highest to lowest order, as the value of the changekey.
 */

 // Create an array of objects which hold the denominations and their values
var denom = [
    { name: 'ONE HUNDRED', val: 100.00},
    { name: 'TWENTY', val: 20.00},
    { name: 'TEN', val: 10.00},
    { name: 'FIVE', val: 5.00},
    { name: 'ONE', val: 1.00},
    { name: 'QUARTER', val: 0.25},
    { name: 'DIME', val: 0.10},
    { name: 'NICKEL', val: 0.05},
    { name: 'PENNY', val: 0.01}
  ];
  
  function checkCashRegister(price, cash, cid) {
    var output = { status: null, change: [] };
    var change = cash - price;
  
    // Transform CID array into drawer object
    var register = cid.reduce(function(acc, curr) {
      acc.total += curr[1];
      acc[curr[0]] = curr[1];
      return acc;
    }, { total: 0 });
  
    // Output if no Exact change
    if (register.total === change) {
      output.status = 'CLOSED';
      output.change = cid;
      return output;
    }
  
    // Output if Insufficient funds
    if (register.total < change) {
      output.status = 'INSUFFICIENT_FUNDS';
      return output;
    }
  
    // Loop through the denomination array
    var change_arr = denom.reduce(function(acc, curr) {
      var value = 0;
      // While there is still money of this type in the drawer
      // And while the denomination is larger than the change remaining
      while (register[curr.name] > 0 && change >= curr.val) {
        change -= curr.val;
        register[curr.name] -= curr.val;
        value += curr.val;
  
        // Round change to the nearest hundreth deals with precision errors
        change = Math.round(change * 100) / 100;
      }
      // Add this denomination to the output only if any was used.
      if (value > 0) {
          acc.push([ curr.name, value ]);
      }
      return acc; // Return the current change_arr
    }, []); // Initial value of empty array for reduce
  
    // If there are no elements in change_arr or we have leftover change, return
    // the string "Insufficient Funds"
    if (change_arr.length < 1 || change > 0) {
      output.status = 'INSUFFICIENT_FUNDS';
      return output;
    }
  
    // Here is your change, ma'am.
    output.status = 'OPEN';
    output.change = change_arr;
    return output;
  }
  
console.log(checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]));

// output
// { status: 'OPEN', change: [ [ 'QUARTER', 0.5 ] ] }