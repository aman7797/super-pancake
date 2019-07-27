// Priority logic syntax check

const fs = require('fs');
const https = require('https')

char = "\\";

var priorityPayload = function (contents) {
    str = contents.replace(/(\r\n|\n|\r)/gm,' \\n ');
    str = str.replace(/"/g, char+"\"");
    str = str.replace(/'/g, char+"\'");
    return str
    
}

var LogicApproval = function(){
    return fs.readFile('DATA.txt', 'utf8', function(err, contents) {
        var payload = priorityPayload(contents)
        var content =({"code": payload})
        return content;
    });
}

var data = LogicApproval()
console.log(JSON.stringify(data))


// const options = {
//     method: "POST",
//     hostname: "sandbox.juspay.in",
//     path: "/merchants/$merchantId/prioritylogic/validate",
//     headers: {
//       "Content-Type": "application/x-www-form-urlencoded",
//       "Authorization": "Basic SU5URVJOQUw0Qjc2NDM2RThBMkM2NjBBMDYwOTlGRUU6",
//     }
//   }
  
//   const req = https.request(options, (res) => {
//       console
//       console.log(`statusCode: ${res.statusCode}`)
  
//     res.on('data', (d) => {
//       process.stdout.write(d)
//     })
//   })
  
//   req.on('error', (error) => {
//     console.error("its and error"+error)
//   })
  
//   req.write(data)
//   req.end()




// def priorities = [\"PAYTM\",\"PAYU\"] \n  \n if([\'CREDIT\'].contains(payment.cardType)&&[\'DINERS\'].contains(payment.cardBrand)&&[\'HDFC Bank\'].contains(payment.cardIssuer)){ \n 	priorities = [\"PAYU\"] \n }else if(currentTimeMillis % 10 < 4) { \n 	priorities = [\"PAYU\",\"PAYTM\"] \n }else { \n 	priorities = [\"PAYTM\",\"PAYU\"] \n } \n setGatewayPriority(priorities) \n
