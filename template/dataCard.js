let data; 
var dataList = d3.queue()
    .defer(d3.csv, '../data/api.csv')
    .awaitAll(function(error, results) {
        if (error) throw error;
        cardData(results); 
        data = results; 
    }); 

function cardData(data) {
    let dataStudents = data[0];

    dataStudents.forEach(function(data) {  
        displayBody(data); 
    });
}


function displayBody(data) {
    var card = d3.select('#youtube-cards').append('div')
            .attr('class', 'justify-content-center d-inline-block')
            .style('margin', '30px').append('div')
            .attr('class', 'card border-dark mb-3 text-center')
            .style('width', '21rem')
}
