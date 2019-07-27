// // 1. Sum All Numbers in a Range
// /**
//  * We'll pass you an array of two numbers. Return the sum of those two numbers plus the sum of all the numbers between them.

// The lowest number will not always come first.
//  */

// function sumAll(arr) {
//     // return arr.reduce((total, elem) => total + elem,0);
//     let sum=0;
//     let minNo=Math.min(...arr);
//     let maxNo=Math.max(...arr);
//     for(let i=minNo;i<=maxNo;i++){
//         sum+=i;
//     }
//     return sum;
// }
  
// console.log(sumAll([1, 4]));

// // Output
// // 10

// // 2. Diff Two Arrays
// /**
//  * Compare two arrays and return a new array with any items only found in one of the two given arrays, but not both. In other words, return the symmetric difference of the two arrays.
//  * Note
// You can return the array with its elements in any order.
//  */

// function diffArray(arr1, arr2) {
//     var newArr = [];
//     for(let i=0;i<arr1.length;i++){
//         if(arr2.includes(arr1[i])){
//             console.log(arr1[i]);
//         }else{
//             newArr.push(arr1[i])
//         }
//     }
//     for(let i=0;i<arr2.length;i++){
//         if(arr1.includes(arr2[i])){
//             console.log(arr2[i]);
//         }else{
//             newArr.push(arr2[i])
//         }
//     }
//     return newArr;
//   }
  
// console.log(diffArray(["andesite", "grass", "dirt", "pink wool", "dead shrub"], ["diorite", "andesite", "grass", "dirt", "dead shrub"]));

// // Output
// // [ 'pink wool', 'diorite' ]

// // 3.  Seek and Destroy
// /**
//  * You will be provided with an initial array (the first argument in the destroyer function), followed by one or more arguments. Remove all elements from the initial array that are of the same value as these arguments.

// Note
// You have to use the arguments object.
//  */
// function destroyer(arr) {;
//     var args = Array.prototype.slice.call(arguments);
//     for (var i = 0; i < arr.length; i++) {
//       for (var j = 0; j < args.length; j++) {
//         console.log("arr["+i+"] -"+ arr[i] + " arr["+j+"] - "+arr[j])
//         if (arr[i] === args[j]) {
//           delete arr[i];
//         }
//         console.log(arr+"\n")
//       }
//     }
//     return arr.filter(Boolean);
//   }
  
// console.log(destroyer(["possum", "trollo", 12, "safari", "hotdog", 92, 65, "grandma", "bugati", "trojan", "yacht"], "yacht", "possum", "trollo", "safari", "hotdog", "grandma", "bugati", "trojan"));

// // Output
// // [ 12, 92, 65 ]

// // 4. Wherefore art thou
// /**
//  * Make a function that looks through an array of objects (first argument) and returns an array of all objects that have matching name and value pairs (second argument). Each name and value pair of the source object has to be present in the object from the collection if it is to be included in the returned array.

// For example, if the first argument is [{ first: "Romeo", last: "Montague" }, { first: "Mercutio", last: null }, { first: "Tybalt", last: "Capulet" }], and the second argument is { last: "Capulet" }, then you must return the third object from the array (the first argument), because it contains the name and its value, that was passed on as the second argument.
//  */
// function whatIsInAName(collection, source) {
//     // What's in a name?
//     var key = Object.keys(source);
//     console.log(key);

//     return collection.filter(function (obj) {
//         for(var i = 0; i < key.length; i++) {
//         if(!obj.hasOwnProperty(key[i]) || obj[key[i]] !== source[key[i]]) {
//             return false;
//         }
//         }
//         return true;
//     });
//   }
  
// console.log(whatIsInAName([{ "apple": 1, "bat": 2 }, { "bat": 2 }, { "apple": 1, "bat": 2, "cookie": 2 }], { "apple": 1, "bat": 2 }));

// // Output
// // [ { apple: 1, bat: 2 }, { apple: 1, bat: 2, cookie: 2 } ]

// // 5. Spinal Tap Case
// /**
//  * Convert a string to spinal case. Spinal case is all-lowercase-words-joined-by-dashes.
//  */
// function spinalCase(str) {
//     
//     var separators = ['(?=[A-Z])', '_+'," "];
//     return str.split(new RegExp(separators.join('|'), 'g')).join("-").toLowerCase();
//   }
  
// console.log(spinalCase('This Is Spinal Tap'));
// console.log(spinalCase("Teletubbies say Eh-oh"));

// // Output
// // this-is-spinal-tap
// // teletubbies-say-eh-oh

// // 6. Pig Latin
// /**
//  * Translate the provided string to pig latin.

// Pig Latin takes the first consonant (or consonant cluster) of an English word, moves it to the end of the word and suffixes an "ay".

// If a word begins with a vowel you just add "way" to the end.

// Input strings are guaranteed to be English words in all lowercase.
//  */
// function translatePigLatin(str) {
    
//     var reg = /[aeiou]/gi;
//     if(str[0].match(reg)!=null){
//         return str+"way";
//     }else if(str.match(reg)===null){
//         return str.slice(1)+"ay";
//     }else {
//         // console.log(str.indexof(reg))
//         let startfrom=str.search(reg);
//         return str.slice(startfrom)+str.slice(0,startfrom)+"ay";
//     }
//   }
  
// console.log(translatePigLatin("pppddpd"))

// // Output
// // ppddpday

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
 
console.log(myReplace("Let us go to the store", "Store", "mall"));