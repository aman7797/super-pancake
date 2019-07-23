// 1. Convert Celsius to Fahrenheit
/*
The algorithm to convert from Celsius to Fahrenheit is the temperature in Celsius times 9/5, plus 32.

You are given a variable celsius representing a temperature in Celsius. Use the variable fahrenheit already defined and assign it the Fahrenheit temperature equivalent to the given Celsius temperature. Use the algorithm mentioned above to help convert the Celsius temperature to Fahrenheit.

Don't worry too much about the function and return statements as they will be covered in future challenges. For now, only use operators that you have already learned.
 */

function convertToF(celsius) {
    let fahrenheit=celsius*(9/5)+32;
    // let fahrenheit=(celsius*1.8)+32;                 //can also use
    return fahrenheit;
}

console.log(convertToF(20));

// Output
// 58

// 2. Convert Fahrenheit to Celsius

function convertToC(fahrenheit) {
    let celsius=(fahrenheit-32)*5/9;
    return celsius;
}

console.log(convertToC(68));

// Output
// 20

// 3. String Reverse
/*
Reverse the provided string.

You may need to turn the string into an array before you can reverse it.

Your result must be a string.

Remember to use Read-Search-Ask if you get stuck. Write your own code.
 */
function reverseString(str) {
    return str.split("").reverse().join("");
}

console.log(reverseString("hello"));

// Output
// olleh

// 4. Factorialize a Number
/*
Return the factorial of the provided integer.

If the integer is represented with the letter n, a factorial is the product of all positive integers less than or equal to n.

Factorials are often represented with the shorthand notation n!

For example: 5! = 1 * 2 * 3 * 4 * 5 = 120

Only integers greater than or equal to zero will be supplied to the function.

Remember to use Read-Search-Ask if you get stuck. Write your own code.
 */

function factorialize(num) {
    return (num >= 1) ? num * factorialize(num - 1) : 1;
  }
  
console.log(factorialize(5));

// Output
// 120

// 5. Find the Longest Word in a String

function findLongestWordLength(str) {
    var str1=str.split(" ");
    var len=Math.max(...(str1.map(el => el.length)));
    return len;
  }
  
console.log(findLongestWordLength("The quick brown fox jumped over the lazy dog"));

// Output
// 6

// 6. Return Largest Numbers in Arrays
/* Return an array consisting of the largest number from each provided sub-array. For simplicity, the provided array will contain exactly 4 sub-arrays.

Remember, you can iterate through an array with a simple for loop, and access each member with array syntax arr[i].

Remember to use Read-Search-Ask if you get stuck. Write your own code   */

function largestOfFour(arr) {
    var max=0,maxArr=[];
    for(let i=0;i<arr.length;i++){
            max=Math.max.apply(null, arr[i])
            maxArr.push(max)
    }
    console.log(maxArr)
    return arr;
}
  
largestOfFour([[13, 27, 18, 26], [4, 5, 1, 3], [32, 35, 37, 39], [1000, 1001, 857, 1]]);

// Output
// [ 27, 5, 39, 1001 ]

// 7. Confirm the Ending

/*
Check if a string (first argument, str) ends with the given target string (second argument, target).

This challenge can be solved with the .endsWith() method, which was introduced in ES2015. But for the purpose of this challenge, we would like you to use one of the JavaScript substring methods instead.

Remember to use Read-Search-Ask if you get stuck. Write your own code.
 */
function confirmEnding(str, target) {

    // return str.endsWith(target);                     //can use direct function endsWith()
    var length=target.length;
    return str.slice(-length)==target;
  }
  
console.log(confirmEnding("Bastian", "n"));

// Output
// true

// 8.Repeat a String Repeat a String
/*
Repeat a given string str (first argument) for num times (second argument). Return an empty string if num is not a positive number.
 */
function repeatStringNumTimes(str, num) {
    return (num>=1)?Array(num+1).join(str):"";
  }
  
console.log(repeatStringNumTimes("abc", 3));

// Output
// abcabcabcabc

// 9.Truncate a String
/*
Truncate a string (first argument) if it is longer than the given maximum string length (second argument). Return the truncated string with a ... ending.
 */
function truncateString(str, num) {
    // Clear out that junk in your trunk
    return (str.length>num)?str.substring(0,num)+"...":str.substring(0,num);
  }
  
console.log(truncateString("A-tisket a-tasket A green and yellow basket", 8));

// Output
// A-tisket...

// 10. Finders Keepers
/*
Create a function that looks through an array (first argument) and returns the first element in the array that passes a truth test (second argument). If no element passes the test, return undefined.
 */
function findElement(arr, func) {
    for(let i=0;i<arr.length;i++){
        if(func(arr[i])==true){
            return arr[i];
        }
    }
  }
  
console.log(findElement([1, 3, 5, 8, 9, 10], function(num) { return num % 2 === 0; }));

// Output
// 8

// 11.Boo who
/*
Check if a value is classified as a boolean primitive. Return true or false.

Boolean primitives are true and false.
 */
function booWho(bool) {
    return (bool===true || bool===false)?true:false;
  }
console.log(booWho(1));

// Output
// false

// 12.Title Case a Sentence
/*
Return the provided string with the first letter of each word capitalized. Make sure the rest of the word is in lower case.

For the purpose of this exercise, you should also capitalize connecting words like "the" and "of".
 */

function titleCase(str) { 
    let arr=(str.toLowerCase().split(" "));
    for(let i=0;i<arr.length;i++){
        arr[i]=arr[i].charAt(0).toUpperCase()+arr[i].slice(1)
    }
    return arr.join(" ");
  }
console.log(titleCase("HERE IS MY HANDLE HERE IS MY SPOUT"));

// Output
// Here Is My Handle Here Is My Spout

// 13. Slice and Splice
/*
You are given two arrays and an index.

Use the array methods slice and splice to copy each element of the first array into the second array, in order.

Begin inserting elements at index n of the second array.

Return the resulting array. The input arrays should remain the same after the function runs.
 */

function frankenSplice(arr1, arr2, n) {
  let arr = arr2.slice();
  for (let i = 0; i < arr1.length; i++) {
    arr.splice(n, 0, arr1[i]);
    n++;
  }
  return arr;
}

console.log(frankenSplice([1, 2, 3], [4, 5, 6], 1));

// Output
// [ 4, 1, 2, 3, 5, 6 ]

// 14. Falsy Bouncer
/*
 Remove all falsy values from an array.

Falsy values in JavaScript are false, null, 0, "", undefined, and NaN.

Hint: Try converting each value to a Boolean.
 */
function bouncer(arr) {
    // Don't show a false ID to this bouncer.
   return arr.filter(Boolean);
  }
console.log(bouncer([7, "ate", "", false, 9]));

// Output
// [ 7, 'ate', 9 ]

// 15. Where do I Belong

/**
Return the lowest index at which a value (second argument) should be inserted into an array (first argument) once it has been sorted. The returned value should be a number.

For example, getIndexToIns([1,2,3,4], 1.5) should return 1 because it is greater than 1 (index 0), but less than 2 (index 1).

Likewise, getIndexToIns([20,3,5], 19) should return 2 because once the array has been sorted it will look like [3,5,20] and 19 is less than 20 (index 2) and greater than 5 (index 1).
 */
function getIndexToIns(arr, num) {
    // Find my place in this sorted array.
    let count=0;
    for(let i=0;i<arr.length;i++){
        if(num>arr[i]){
            count++
        }
    }
    return count;
  }
  
console.log(getIndexToIns([10, 20, 30, 40, 50], 35));

// Output
// 3

// 16.Mutations
/**
 Return true if the string in the first element of the array contains all of the letters of the string in the second element of the array.

For example, ["hello", "Hello"], should return true because all of the letters in the second string are present in the first, ignoring case.

The arguments ["hello", "hey"] should return false because the string "hello" does not contain a "y".

Lastly, ["Alien", "line"], should return true because all of the letters in "line" are present in "Alien". 
 */
function mutation(arr) { 
  let toCheckWith=arr[0].toLowerCase();
  let toCheck=arr[1].toLowerCase().split("");
  let flag=false;
  for(let j=0;j<toCheck.length;j++){
    if(toCheckWith.includes(toCheck[j])){
      flag=true;
    }else{
      flag=false;
      break;
    }
  }
  return flag;
}  
console.log(mutation(["floor", "for"]));

// Output
// true

// 17. Chunky Monkey
/*
Write a function that splits an array (first argument) into groups the length of size (second argument) and returns them as a two-dimensional array. */
function chunkArrayInGroups(arr, size) {
  let newArr=[],insideArr=[]
  let noOfArray=arr.length/size
  for(let j=0;j<noOfArray;j++){
    for(let i=0;i<size;i++){
      let elem=arr.shift()
      if(typeof elem !== 'undefined'){
        insideArr.push(elem)
      }
    }
    newArr.push(insideArr);
    insideArr=[];
  }
  return newArr;
}
console.log(chunkArrayInGroups([0, 1, 2, 3, 4, 5, 6], 3));

// Output
// [ [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6 ] ]