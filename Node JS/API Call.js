const https = require('https')

var data =('{ code: "def priorities = [\"PAYTM\",\"PAYU\"] \n  \n if([\'CREDIT\'].contains(payment.cardType)&&[\'DINERS\'].contains(payment.cardBrand)&&[\'HDFC Bank\'].contains(payment.cardIssuer)){ \n 	priorities = [\"PAYU\"] \n }else if(currentTimeMillis % 10 < 4) { \n 	priorities = [\"PAYU\",\"PAYTM\"] \n }else { \n 	priorities = [\"PAYTM\",\"PAYU\"] \n } \n setGatewayPriority(priorities) \n" }')
// var data = JSON.parse(json);

const options = {
  method: "POST",
  hostname: "sandbox.juspay.in",
  path: "/merchants/$merchantId/prioritylogic/validate",
  headers: {
    "Content-Type": "application/x-www-form-urlencoded",
    "Authorization": "Basic SU5URVJOQUw0Qjc2NDM2RThBMkM2NjBBMDYwOTlGRUU6",
  }
}

const req = https.request(options, (res) => {
    console
    console.log(`statusCode: ${res.statusCode}`)

  res.on('data', (d) => {
    process.stdout.write(d)
  })
})

req.on('error', (error) => {
  console.error("its and error"+error)
})

req.write(data)
req.end()








