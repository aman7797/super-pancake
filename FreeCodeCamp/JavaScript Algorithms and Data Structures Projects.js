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
