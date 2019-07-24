// 1. Create a Basic JavaScript Object
/*
Create a dog object with name and numLegs properties, and set them to a string and a number, respectively. */

var dog = {
    name:"Tommy",
    numLegs:4
  };

console.log(dog);

// Output
// { name: 'Tommy', numLegs: 4 }

// 2.  Use Dot Notation to Access the Properties of an Object
/*
Print both properties of the dog object below to your console. */
var dog = {
    name: "Spot",
    numLegs: 4
  };

console.log(dog.name);
console.log(dog.numLegs);

// Output
// Spot
// 4
  
// 3. Create a Method on an Object
/*
Using the dog object, give it a method called sayLegs. The method should return the sentence "This dog has 4 legs." */
var dog = {
    name: "Spot",
    numLegs: 4,
    sayLegs:function() {return "This dog has 4 legs.";}
  };
  
console.log(dog.sayLegs());

// Output
// This dog has 4 legs.

// 4. Make Code More Reusable with the this Keyword
/**
 * Modify the dog.sayLegs method to remove any references to dog. Use the duck example for guidance.
 */
var dog = {
    name: "Spot",
    numLegs: 4,
    sayLegs: function() {return "This dog has " + this.numLegs + " legs.";}
  };
  
console.log(dog.sayLegs());

// Output
// This dog has 4 legs.

// 5. Define a Constructor Function
/**
 * Create a constructor, Dog, with properties name, color, and numLegs that are set to a string, a string, and a number, respectively.
 */
function Dog() {
    this.name = "Albert";
    this.color = "blue";
    this.numLegs = 2;
  }

console.log(Dog);

// Output
// [Function: Dog]

// 6. Use a Constructor to Create Objects
/**
 * Use the Dog constructor from the last lesson to create a new instance of Dog, assigning it to a variable hound.
 */
function Dog() {
    this.name = "Rupert";
    this.color = "brown";
    this.numLegs = 4;
  }

var hound = new Dog();
console.log(hound);

// Output
// Dog { name: 'Rupert', color: 'brown', numLegs: 4 }

// 7. Extend Constructors to Receive Arguments
/**
 * Create another Dog constructor. This time, set it up to take the parameters name and color, and have the property numLegs fixed at 4. Then create a new Dog saved in a variable terrier. Pass it two strings as arguments for the name and color properties.
 */
function Dog(name, color) {
    this.name=name,
    this.color=color,
    this.numLegs=4
  }
  var terrier=new Dog("karam","arjun");  
  console.log(terrier.name)

// Output
// karam

// 8. Verify an Object's Constructor with instanceof
/**
 * Create a new instance of the House constructor, calling it myHouse and passing a number of bedrooms. Then, use instanceof to verify that it is an instance of House.
 */

function House(numBedrooms) {
    this.numBedrooms = numBedrooms;
  }
var myHouse = new House(3);
console.log(myHouse instanceof House);

// Output
// true

// 9. Understand Own Properties
/**
 * Add the own properties of canary to the array ownProps.
 */
function Bird(name) {
    this.name = name;
    this.numLegs = 2;
  }
  
  var canary = new Bird("Tweety");
  var ownProps = [];
  for(var property in canary){
    if(canary.hasOwnProperty(property)){
      ownProps.push(property)
    }
  }
console.log(ownProps)

// Output
// [ 'name', 'numLegs' ]

// 10. Use Prototype Properties to Reduce Duplicate Code
/**
 * Add a numLegs property to the prototype of Dog
 */
function Dog(name) {
    this.name = name;
  }
Dog.prototype.numLegs = 2;
var beagle = new Dog("Snoopy");
console.log(beagle);

// Output
// Dog { name: 'Snoopy' }

// 11. Iterate Over All Properties
/**
 * Add all of the own properties of beagle to the array ownProps. Add all of the prototype properties of Dog to the array prototypeProps.
 */
function Dog(name) {
    this.name = name;
  }
  
  Dog.prototype.numLegs = 4;
  
  var beagle = new Dog("Snoopy");
  
  var ownProps = [];
  var prototypeProps = [];
  
  // Add your code below this line 
  
  for(var property in beagle){
    if(Dog.hasOwnProperty(property)){
      ownProps.push(property)
    }else {
      prototypeProps.push(property)
    }
  }  
console.log(prototypeProps)
  
// Output
// [ 'numLegs' ]

// 12. Understand the Constructor Property
/**
 * Write a joinDogFraternity function that takes a candidate parameter and, using the constructor property, return true if the candidate is a Dog, otherwise return false.
 */
function Dog(name) {
    this.name = name;
  }
  
function joinDogFraternity(candidate) {
    if (candidate.constructor === Dog) {
        return true;
    } else {
        return false;
    }
}
// Output
// true

// 13. Change the Prototype to a New Object
/**
 * Add the property numLegs and the two methods eat() and describe() to the prototype of Dog by setting the prototype to a new objec
 */
function Dog(name) {
    this.name = name; 
  }
  
Dog.prototype = {
    numLegs:2,
    eat: function() {
        console.log("bow bow bow");
    },
    describe: function() {
        console.log("My name is " + this.name);
    }
};
  
// 14. Remember to Set the Constructor Property when Changing the Prototype
/**
 * Define the constructor property on the Dog prototype.
 */
function Dog(name) {
    this.name = name; 
  }

Dog.prototype = {
    constructor:Dog,
    numLegs: 2, 
    eat: function() {
        console.log("nom nom nom"); 
    }, 
    describe: function() {
        console.log("My name is " + this.name); 
    }
};

// 15. Understand Where an Object’s Prototype Comes From
/**
 * Use isPrototypeOf to check the prototype of beagle.
 */
function Dog(name) {
    this.name = name;
  }
  
  var beagle = new Dog("Snoopy");
  
  console.log(Dog.prototype.isPrototypeOf(beagle));

// Output
// true

// 16. Understand the Prototype Chain
/**
 * Modify the code to show the correct prototype chain.
 */
function Dog(name) {
    this.name = name;
}

var beagle = new Dog("Snoopy");

Dog.prototype.isPrototypeOf(beagle);
console.log(Object.prototype.isPrototypeOf(Dog.prototype));

// Output
// true

// 17. Use Inheritance So You Don't Repeat Yourself
/**
 * The eat method is repeated in both Cat and Bear. Edit the code in the spirit of DRY by moving the eat method to the Animal supertype.
 */
function Cat(name) {
    this.name = name; 
  }
  
  Cat.prototype = {
    constructor: Cat, 
  };
  
  function Bear(name) {
    this.name = name; 
  }
  
  Bear.prototype = {
    constructor: Bear, 
  };
  
  function Animal() { }
  
  Animal.prototype = {
    constructor: Animal,
    eat: function() {
      console.log("nom nom nom");
    }
  };

// 18. Inherit Behaviors from a Supertype
/**
 * Use Object.create to make two instances of Animal named duck and beagle.
 */
function Animal() { }

Animal.prototype = {
  constructor: Animal, 
  eat: function() {
    console.log("nom nom nom");
  }
};

var duck=Object.create(Animal.prototype); 
var beagle=Object.create(Animal.prototype); 

duck.eat(); 
beagle.eat();  

// Output
// nom nom nom
// nom nom nom

// 19. Set the Child's Prototype to an Instance of the Parent
/**
 * Modify the code so that instances of Dog inherit from Animal.
 */
function Animal() { }

Animal.prototype = {
  constructor: Animal,
  eat: function() {
    console.log("nom nom nom");
  }
};

function Dog() { }

Dog.prototype = Object.create(Animal.prototype);

var beagle = new Dog("tom");
beagle.eat();

// Output
// nom nom nom

// 20. Reset an Inherited Constructor Property
/**
 * Fix the code so duck.constructor and beagle.constructor return their respective constructors.
 */
function Animal() { }
function Bird() { }
function Dog() { }

Bird.prototype = Object.create(Animal.prototype);
Dog.prototype = Object.create(Animal.prototype);

Bird.prototype.constructor = Bird;
Dog.prototype.constructor = Dog;


var duck = new Bird();
var beagle = new Dog();

console.log(duck)

// Output
// Bird {}

// 21. Add Methods After Inheritance
/*
 * Add all necessary code so the Dog object inherits from Animal and the Dog's prototype constructor is set to Dog. Then add a bark() method to the Dog object so that beagle can both eat() and bark(). The bark() method should print "Woof!" to the console.
 */
function Animal() { }
Animal.prototype.eat = function() { console.log("nom nom nom"); };

function Dog() { }

Dog.prototype = Object.create(Animal.prototype);
Dog.prototype.constructor =Dog;

Dog.prototype.eat = function() {
  console.log("nom nom nom");
};

Dog.prototype.bark = function() {
  console.log("Woof!");
};
var beagle = new Dog();

beagle.eat(); 
beagle.bark();

// Output
// nom nom nom
// Woof!

// 22. Override Inherited Methods
/**
 * Override the fly() method for Penguin so that it returns "Alas, this is a flightless bird."
 */
function Bird() { }

Bird.prototype.fly = function() { return "I am flying!"; };

function Penguin() { }
Penguin.prototype = Object.create(Bird.prototype);
Penguin.prototype.constructor = Penguin;

Penguin.prototype.fly = function() {
    return  "Alas, this is a flightless bird.";
};

var penguin = new Penguin();
console.log(penguin.fly());

// Output
// Alas, this is a flightless bird.

// 23. Use a Mixin to Add Common Behavior Between Unrelated Objects
// Create a mixin named glideMixin that defines a method named glide. Then use the glideMixin to give both bird and boat the ability to glide.
var bird = {
  name: "Donald",
  numLegs: 2
};

var boat = {
  name: "Warrior",
  type: "race-boat"
};

// Add your code below this line
var glideMixin = function(obj) {
    obj.glide = function() {
        console.log("Gliding!");
    }
};
glideMixin(bird);
glideMixin(boat);

// 24.Use Closure to Protect Properties Within an Object from Being Modified Externally
/**
 * Change how weight is declared in the Bird function so it is a private variable. Then, create a method getWeight that returns the value of weight.
 */
function Bird() {
  var weight = 15;
  this.getWeight = function() {
    return weight;
  };
}

// 25. Understand the Immediately Invoked Function Expression (IIFE)
/**
 * Rewrite the function makeNest and remove its call so instead it's an anonymous immediately invoked function expression (IIFE).
 */

 (function() {
  console.log("A cozy nest is ready");
})();

// Output
// A cozy nest is ready

// 26. Use an IIFE to Create a Module
/**
 * Create a module named funModule to wrap the two mixins isCuteMixin and singMixin. funModule should return an object.
 */
var funModule = (function () {
  return {
    isCuteMixin: function (obj) {
      obj.isCute = function() {
      return true;
      };
    },
    singMixin: function(obj) {
      obj.sing = function() {
      console.log("Singing to an awesome tune");
      };
    }
  }
}) ();

console.log(funModule);

// Output
// { isCuteMixin: [Function: isCuteMixin],
//   singMixin: [Function: singMixin] }

