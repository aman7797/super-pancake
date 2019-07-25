
const moment = require('moment-timezone');

// try{
//     var date = moment("2019-05-1 00:02:12")
//     console.log(date)
// }
// catch(e){
//     console.log(e)
// }

// const moment = require('moment');


// var dateB = moment('2014-12-12 00:02:12').add(5, 'hours').add(30, 'minutes');
// console.log(dateB)


// var dateC = moment('2014-12-12 00:02:12').add(19800000, 'milliseconds')

var dateC = moment.tz('2014-12-12 00:02:12',"Asia/Kolkata").format();
console.log(dateC.toString())
// var zone = "America/Los_Angeles";
// var a = moment.tz('2013-06-01T18:34:00+05:30').format();
// console.log(a)

