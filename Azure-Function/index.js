const axios = require('axios');


module.exports = async function (context, myTimer) {



    let res = await axios.post('https://prod-115.westeurope.logic.azure.com:443/workflows/9df05d5404714e2a993d8cc8da7c7d8f/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=b09PmbWKMNj59GOtId8cNa6ycfLfpGFbhF08n4GM9zI');

    context.log(res.data)

  context.done();
}