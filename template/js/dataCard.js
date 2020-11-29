d3.json("../data/items.json", function(error, data) {
    console.log(data); 
    displayItems(data); 
});

function displayItems(data) {

    var card = d3.select('#youtube-cards-items').selectAll('div').data(data).enter().append('div')
        .attr('class', 'justify-content-center d-inline-block')
        .style('margin', '30px').append('div')
        .attr('class', 'card border-dark mb-3 text-center')
        .style('width', '21rem')
    
        card.append('div').attr('class', 'card-header').append('h5')
            .html(d => {
                var a = d["foaf:family_name"][0]["@value"] + " " + d["foaf:firstName"][0]["@value"] + 
                    '<a class="fa fa-info-circle float-right" href="infoPage.html?nom=' + 
                    encodeURI(d["foaf:family_name"][0]["@value"]) + '" />'
                return a; 
            })

    var cardBody = card.append('div').attr('class', 'card-body')
        .html(d => {
            var img = '<img class="card-img-top" style="max-height: \'100%\'; max-width: \'100%\';" ' +
                'src="' + d["thumbnail_display_urls"]["square"] + '" alt="' + d["chaine:voc.ttlhasChannel"][0]["@value"] + '" />'; 
            return img
        })
}