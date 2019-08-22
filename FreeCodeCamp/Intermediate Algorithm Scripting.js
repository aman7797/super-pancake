// 1. Sum All Numbers in a Range
/**
 * We'll pass you an array of two numbers. Return the sum of those two numbers plus the sum of all the numbers between them.

The lowest number will not always come first.
 */

function sumAll(arr) {
    // return arr.reduce((total, elem) => total + elem,0);
    let sum=0;
    let minNo=Math.min(...arr);
    let maxNo=Math.max(...arr);
    for(let i=minNo;i<=maxNo;i++){
        sum+=i;
    }
    return sum;
}
  
console.log(sumAll([1, 4]));

// Output
// 10

// 2. Diff Two Arrays
/**
 * Compare two arrays and return a new array with any items only found in one of the two given arrays, but not both. In other words, return the symmetric difference of the two arrays.
 * Note
You can return the array with its elements in any order.
 */

function diffArray(arr1, arr2) {
    var newArr = [];
    for(let i=0;i<arr1.length;i++){
        if(arr2.includes(arr1[i])){
            console.log(arr1[i]);
        }else{
            newArr.push(arr1[i])
        }
    }
    for(let i=0;i<arr2.length;i++){
        if(arr1.includes(arr2[i])){
            console.log(arr2[i]);
        }else{
            newArr.push(arr2[i])
        }
    }
    return newArr;
  }
  
console.log(diffArray(["andesite", "grass", "dirt", "pink wool", "dead shrub"], ["diorite", "andesite", "grass", "dirt", "dead shrub"]));

// Output
// [ 'pink wool', 'diorite' ]

// 3.  Seek and Destroy
/**
 * You will be provided with an initial array (the first argument in the destroyer function), followed by one or more arguments. Remove all elements from the initial array that are of the same value as these arguments.

Note
You have to use the arguments object.
 */
function destroyer(arr) {;
    var args = Array.prototype.slice.call(arguments);
    for (var i = 0; i < arr.length; i++) {
      for (var j = 0; j < args.length; j++) {
        console.log("arr["+i+"] -"+ arr[i] + " arr["+j+"] - "+arr[j])
        if (arr[i] === args[j]) {
          delete arr[i];
        }
        console.log(arr+"\n")
      }
    }
    return arr.filter(Boolean);
  }
  
console.log(destroyer(["possum", "trollo", 12, "safari", "hotdog", 92, 65, "grandma", "bugati", "trojan", "yacht"], "yacht", "possum", "trollo", "safari", "hotdog", "grandma", "bugati", "trojan"));

// Output
// [ 12, 92, 65 ]

// 4. Wherefore art thou
/**
 * Make a function that looks through an array of objects (first argument) and returns an array of all objects that have matching name and value pairs (second argument). Each name and value pair of the source object has to be present in the object from the collection if it is to be included in the returned array.

For example, if the first argument is [{ first: "Romeo", last: "Montague" }, { first: "Mercutio", last: null }, { first: "Tybalt", last: "Capulet" }], and the second argument is { last: "Capulet" }, then you must return the third object from the array (the first argument), because it contains the name and its value, that was passed on as the second argument.
 */
function whatIsInAName(collection, source) {
    // What's in a name?
    var key = Object.keys(source);
    console.log(key);

    return collection.filter(function (obj) {
        for(var i = 0; i < key.length; i++) {
        if(!obj.hasOwnProperty(key[i]) || obj[key[i]] !== source[key[i]]) {
            return false;
        }
        }
        return true;
    });
  }
  
console.log(whatIsInAName([{ "apple": 1, "bat": 2 }, { "bat": 2 }, { "apple": 1, "bat": 2, "cookie": 2 }], { "apple": 1, "bat": 2 }));

// Output
// [ { apple: 1, bat: 2 }, { apple: 1, bat: 2, cookie: 2 } ]

// 5. Spinal Tap Case
/**
 * Convert a string to spinal case. Spinal case is all-lowercase-words-joined-by-dashes.
 */
function spinalCase(str) {
    
    var separators = ['(?=[A-Z])', '_+'," "];
    return str.split(new RegExp(separators.join('|'), 'g')).join("-").toLowerCase();
  }
  
console.log(spinalCase('This Is Spinal Tap'));
console.log(spinalCase("Teletubbies say Eh-oh"));

// Output
// this-is-spinal-tap
// teletubbies-say-eh-oh

// 6. Pig Latin
/**
 * Translate the provided string to pig latin.

Pig Latin takes the first consonant (or consonant cluster) of an English word, moves it to the end of the word and suffixes an "ay".

If a word begins with a vowel you just add "way" to the end.

Input strings are guaranteed to be English words in all lowercase.
 */
function translatePigLatin(str) {
    
    var reg = /[aeiou]/gi;
    if(str[0].match(reg)!=null){
        return str+"way";
    }else if(str.match(reg)===null){
        return str.slice(1)+"ay";
    }else {
        // console.log(str.indexof(reg))
        let startfrom=str.search(reg);
        return str.slice(startfrom)+str.slice(0,startfrom)+"ay";
    }
  }
  
console.log(translatePigLatin("pppddpd"))

// Output
// ppddpday

// 7. Search and Replace
/**
 * Perform a search and replace on the sentence using the arguments provided and return the new sentence.

First argument is the sentence to perform the search and replace on.

Second argument is the word that you will be replacing (before).

Third argument is what you will be replacing the second argument with (after).

Note
Preserve the case of the first character in the original word when you are replacing it. For example if you mean to replace the word "Book" with the word "dog", it should be replaced as "Dog"
 */

function myReplace(str, before, after) {
    var index = str.indexOf(before);
    if (str[index] === str[index].toUpperCase()) { 
      after = after.charAt(0).toUpperCase() + after.slice(1);
    }
    return str.replace(before, after);
}
 
console.log(myReplace("Let us go to the Store", "Store", "mall"));

// Output 
// Let us go to the Mall

// 8. DNA Pairing
/**
 * The DNA strand is missing the pairing element. Take each character, get its pair, and return the results as a 2d array.

Base pairs are a pair of AT and CG. Match the missing element to the provided character.

Return the provided character as the first element in each array.

For example, for the input GCG, return [["G", "C"], ["C","G"],["G", "C"]]

The character and its pair are paired up in an array, and all the arrays are grouped into one encapsulating array.
 */

function pairElement(str) {
  var dna = [];
  for (var i = 0; i < str.length; i++) {
       switch (str[i]) {
         case 'A':
           dna.push(['A', 'T']);
           break;
         case 'T':
           dna.push(['T', 'A']);
           break;
         case 'C':
           dna.push(['C', 'G']);
           break;
         case 'G':
           dna.push(['G', 'C']);
           break;
       }
 }
 return dna;
}

console.log(pairElement("GCG"));

// Output
// [ [ 'G', 'C' ], [ 'C', 'G' ], [ 'G', 'C' ] ]

// 9. Missing letters
/**
 * Find the missing letter in the passed letter range and return it.

If all letters are present in the range, return undefined.
 */

function fearNotLetter(str) {
  var startASCI = str.charCodeAt(0);
  console.log("start at" + startASCI)
  for(var i=0;i<str.length;i++){
    console.log("in for loop char :-" + str[i] + "  ASCI  " + startASCI)
    if(str.charCodeAt(i) != startASCI){
      return String.fromCharCode(startASCI)
    }
    startASCI++;
  }
  return undefined;
}
console.log(fearNotLetter("abde"));

// Output
// c

// 10. Sorted Union
/*
 *Write a function that takes two or more arrays and returns a new array of unique values in the order of the original provided arrays.

In other words, all values present from all arrays should be included in their original order, but with no duplicates in the final array.

The unique numbers should be sorted by their original order, but the final array should not be sorted in numerical order.

Check the assertion tests for examples. 
 */

function uniteUnique(arr) {
  var args = [...arguments];
  var finalArray = [];
  for(var i=0;i<args.length;i++){
    var arr = args[i];
    console.log("array " +i+ "::-" + arr);
    for(var j=0;j<arr.length;j++){
      console.log(arr[j]);
      if(!finalArray.includes(arr[j])){
        finalArray.push(arr[j]);
      }
      console.log("final array ::-" + finalArray)
    }
  }
  return finalArray;
}

console.log(uniteUnique([1, 3, 2], [5, 2, 1, 4], [2, 1]));

// Output
// [ 1, 3, 2, 5, 4 ]

// 11. Convert HTML Entities
/*
 *Convert the characters &, <, >, " (double quote), and ' (apostrophe), in a string to their corresponding HTML entities. 
 */

function convertHTML(str) {
  var output = str.split('');
  for (var i = 0; i < output.length; i++) {
    switch (output[i]) {
      case '<':
        output[i] = '&lt;';
        break;
      case '&':
        output[i] = '&amp;';
        break;
      case '>':
        output[i] = '&gt;';
        break;
      case '"':
        output[i] = '&quot;';
        break;
      case "'":
        output[i] = "&apos;";
        break;
    }
  }
  output = output.join('');
  return output;
}

console.log(convertHTML("Dolce & Gabbana"));

// Output
// Dolce &amp; Gabbana

// 12. Sum All Odd Fibonacci Numbers
/**
 * Given a positive integer num, return the sum of all odd Fibonacci numbers that are less than or equal to num.

The first two numbers in the Fibonacci sequence are 1 and 1. Every additional number in the sequence is the sum of the two previous numbers. The first six numbers of the Fibonacci sequence are 1, 1, 2, 3, 5 and 8.

For example, sumFibs(10) should return 10 because all odd Fibonacci numbers less than or equal to 10 are 1, 1, 3, and 5.
 */

function sumFibs(num) {
  var fibArr=[0,1];
  var firstNumber=0,secondNumber=1,sum = 0,output=0;
  do{
    sum = firstNumber + secondNumber;
    fibArr.push(sum);
    firstNumber = secondNumber;
    secondNumber = sum;
  }while(sum < num)
  console.log(fibArr);

  for(var i=0;i<fibArr.length;i++){
    if(fibArr[i]%2!=0 && fibArr[i]<=num){
      output+=fibArr[i];
    }
  }
  return output;
}

console.log(sumFibs(75025));

// Output
// [ 0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025 ]
// 135721

// 13.  Sum All Primes
/**
 * Sum all the prime numbers up to and including the provided number.

A prime number is defined as a number greater than one and having only two divisors, one and itself. For example, 2 is a prime number because it's only divisible by one and two.

The provided number may not be a prime.
 */
function sumPrimes(num) {
  var primeNumbers=[]
  for(var i = 0; i <= num ; i++){
    if(ifPrime(i)==true){
      primeNumbers.push(i)
    }
  }
  return primeNumbers.reduce((a, b) => a + b, 0);
}

function ifPrime(n)
{
  if (n===1)
  {
    return false;
  }
  else if(n === 2)
  {
    return true;
  }else{
    for(var x = 2; x < n; x++)
    {
      if(n % x === 0)
      {
        return false;
      }
    }
    return true;  
  }
}

console.log(sumPrimes(977));

// Output 
// 73156

// 14.  Smallest Common Multiple
/**
 * Find the smallest common multiple of the provided parameters that can be evenly divided by both, as well as by all sequential numbers in the range between these parameters.

The range will be an array of two numbers that will not necessarily be in numerical order.

For example, if given 1 and 3, find the smallest common multiple of both 1 and 3 that is also evenly divisible by all numbers between 1 and 3. The answer here would be 6.
 */
function smallestCommons(arr) {
  return arr;
}

console.log(smallestCommons([1,5]));

//Output
// Remaining

// 15. Drop It
/**
 * Given the array arr, iterate through and remove each element starting from the first element (the 0 index) until the function func returns true when the iterated element is passed through it.

Then return the rest of the array once the condition is satisfied, otherwise, arr should be returned as an empty array.
 */

 function dropElements(arr, func) {

  var loop = arr.length;
  for (var i = 0; i < loop; i++) {
    if (func(arr[0])) {
      break;
    } else {
       //shift() method removes the first element from an array and returns that removed element.
      arr.shift();
    }
  }
  return arr;
}

console.log(dropElements([1, 2, 3, 4], function(n) {return n >= 3;}))

// Output
// [ 3, 4 ]

// 16. Steamroller
/**
 * Flatten a nested array. You must account for varying levels of nesting
 */

function steamrollArray(arr) {
  var output = [].concat(...arr);
  console.log(output)
  //Array.isArray() method determines whether the passed value is an Array.
  //Array.isArray([1, 2, 3]);  // true
  //Array.isArray({foo: 123}); // false
  //output.some check is the test is passed or not 
  return output.some(Array.isArray) ? steamrollArray(output) : output;
}

console.log(steamrollArray([1, [2], [3, [[4]]]]));

//Output
// [ 1, 2, 3, 4 ]

// 17. Binary Agents
/**
 * Return an English translated sentence of the passed binary string.

The binary string will be space separated.
 */

function binaryAgent(str) {
  // Splitted words [ '01000001','01110010','01100101','01101110','00100111','01110100','00100000','01100010','01101111','01101110','01100110','01101001','01110010','01100101','01110011','00100000','01100110','01110101','01101110','00100001','00111111' ]
  var splitWords = str.split(' ');
  var finalString = [];
  for(var i=0;i < splitWords.length;i++){
    //parseInt to convert from String to int
    //fromCharCode() method returns a string created from the specified sequence of UTF-16 code units 
    finalString.push(String.fromCharCode(parseInt(splitWords[i], 2)));
    console.log(finalString);
  }
  return finalString.join('');


  //Method 2
  // String.fromCharCode(...str.split(" ").map(function(char){ return parseInt(char, 2); }));
}

console.log(binaryAgent("01000001 01110010 01100101 01101110 00100111 01110100 00100000 01100010 01101111 01101110 01100110 01101001 01110010 01100101 01110011 00100000 01100110 01110101 01101110 00100001 00111111"));

//Output
// Aren't bonfires fun!?

// 18. Everything Be True
/**
 * Check if the predicate (second argument) is truthy on all elements of a collection (first argument).

In other words, you are given an array collection of objects. The predicate pre will be an object property and you need to return true if its value is truthy. Otherwise, return false.

In JavaScript, truthy values are values that translate to true when evaluated in a Boolean context.

Remember, you can access object properties through either dot notation or [] notation.
 */

function truthCheck(collection, pre) {
  // every() method tests whether all elements in the array pass the test implemented by the provided function.
  return collection.every(function (objectInCollection) {
    //hasOwnProperty() method returns a boolean indicating whether the object has the specified property
    return objectInCollection.hasOwnProperty(pre) && Boolean(objectInCollection[pre]);
  });
}

console.log(truthCheck([{"user": "Tinky-Winky", "sex": "male"}, {"user": "Dipsy", "sex": "male"}, {"user": "Laa-Laa", "sex": "female"}, {"user": "Po", "sex": "female"}], "sex"));

// Output
// true

//  19. Arguments Optional
/**
 * Create a function that sums two arguments together. If only one argument is provided, then return a function that expects one argument and returns the sum.

For example, addTogether(2, 3) should return 5, and addTogether(2) should return a function.

Calling this returned function with a single argument will then return the sum:

var sumTwoAnd = addTogether(2);

sumTwoAnd(3) returns 5.

If either argument isn't a valid number, return undefined.
 */

function addTogether() {
  var output = Array.from(arguments);
  console.log(output);
  // condition will check if any of the argument is a number or not in the array
  // output.some(n => typeof n !== 'number');
  return output.some(n => typeof n !== 'number')?
    undefined:
    output.length > 1 ?
      output.reduce((sum, n) => sum += n, 0):
        (n) => typeof n === "number" ? 
          n + args[0]:
          undefined;
}

console.log(addTogether(2)([3]));

//Output
//undefined

// 20. Make a Person
/**
 * Fill in the object constructor with the following methods below:

getFirstName() getLastName() getFullName() setFirstName(first) setLastName(last) setFullName(firstAndLast)
Run the tests to see the expected output for each method.

The methods that take an argument must accept only one argument and it has to be a string.

These methods must be the only available means of interacting with the object.
 */

var Person = function(firstAndLast) {
  
  var firstAndLast = firstAndLast;

  this.getFullName = function() {
    return firstAndLast;
  };

  this.getFirstName = function(){
    return firstAndLast.split(" ")[0];
  }

  this.getLastName = function(){
    return firstAndLast.split(" ")[1];
  }

  this.setFirstName = function(first){
    // console.log(firstAndLast);    
    firstAndLast = firstAndLast.split(" ");
    // console.log(firstAndLast);
    firstAndLast[0] = first;
    // console.log(firstAndLast);
    return firstAndLast.join(" ");
  }

  this.setLastName = function(last){
    // console.log(firstAndLast);    
    firstAndLast = firstAndLast.split(" ");
    // console.log(firstAndLast);
    firstAndLast[1] = last;
    // console.log(firstAndLast);
    return firstAndLast.join(" ");
  }

  this.setFullName = function(name){
    console.log(firstAndLast);    ;
    firstAndLast = name;
  }

  return firstAndLast;
};

var bob = new Person('Bob Ross');
console.log(bob.setFullName("Aman Lalpuria"));
console.log(bob.getFullName());
console.log(bob.getFirstName());

// Output
// Aman Lalpuria
// Aman


// 21. Map the Debris
/**
 * Return a new array that transforms the elements' average altitude into their orbital periods (in seconds).

The array will contain objects in the format {name: 'name', avgAlt: avgAlt}.

You can read about orbital periods on Wikipedia.

The values should be rounded to the nearest whole number. The body being orbited is Earth.

The radius of the earth is 6367.4447 kilometers, and the GM value of earth is 398600.4418 km3s-2.
 */

function orbitalPeriod(arr) {
  var GM = 398600.4418;
  var earthRadius = 6367.4447;
  for(var dataAt in arr) {
    //Rounding off the orbital period value
    var orbitalPer = Math.round(2 * Math.PI * Math.sqrt(Math.pow(arr[dataAt].avgAlt + earthRadius, 3) / GM));
    //to delete the avgAlt
    delete arr[dataAt].avgAlt;
    //here we will add the key orbitalPeriod to arr
    arr[dataAt].orbitalPeriod = orbitalPer;
  }
  return arr;
}

console.log(orbitalPeriod([{name : "sputnik", avgAlt : 35873.5553}]));

// Output
// [ { name: 'sputnik', orbitalPeriod: 86400 } ]