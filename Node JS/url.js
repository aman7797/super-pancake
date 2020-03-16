var harishita = function (str) {
    str = str.replace(/{/g, '');
    str = str.replace(/}/g, '","');
    str = str.substring(0, str.length-3);
    str = str.replace(/:/g, '":"');
    str= '{"' + str + '"}' ;
    jsonforyou = JSON.parse(str);
    return jsonforyou
    
}

console.log(harishita("{itc:paypal-order158-1}{email:paypal@gmail.com}{mob:9164326296}{custname:JuspayTechnologies}"));


// var result = "?";
    // Object.keys(obj).forEach(function (key) {
    //     result += key + "=" + obj[key] + "&";
    // });
    // return result.substring(0, result.length - 1);