/* let csv = "../data/api.csv";
let urlStart = "http://localhost/omeka-s-3.0.1/omeka-s"; 

d3.csv(csv, function(data) {
    data.forEach(function(d) {
        if (d.titre.startsWith("Liste")) {
            d3.json(urlStart + d.url, function(res) {
                displayBody(res);
            });
        }
    })
}) */

var itemsJson = d3.queue()
    .defer(d3.json, '../data/items.json')
    .awaitAll(function(error, results) {
        if (error) throw error;
        displayItems(results); 
    }); 

var itemJson = d3.queue()
    .defer(d3.json, '../data/item.json')
    .awaitAll(function(error, results) {
        if (error) throw error; 
        displayItem(results); 
    }); 

function displayItems(d) {

    let itemsYoutube = d[0];

    itemsYoutube.forEach(function(data) {  

        var card = d3.select('#youtube-cards-items').append('div')
            .attr('class', 'justify-content-center d-inline-block')
            .style('margin', '30px').append('div')
            .attr('class', 'card border-dark mb-3 text-center')
            .style('width', '21rem')

        if (data["@type"][1] === "foaf:Person") {

            card.append('div').attr('class', 'card-header').append('h5')
                .text(data["foaf:familyName"][0]["@value"] + " " + data["foaf:firstName"][0]["@value"])

            var cardBody = card.append('div').attr('class', 'card-body')
                cardBody.append('p').text("Fonction : " + data["dcterms:title"][0]["@value"])
                cardBody.append('p').text("Nom d'utilisateur: " + data["foaf:nick"][0]["@value"])

                card.append('div').attr('class', 'card-footer')
                    .text(data["foaf:mbox"][0]["@value"])
        }

        else if (data["@type"][1] === "chaine:voc.ttlYoutubeur") {
            card.append('div').attr('class', 'card-header').append('h5')
                .text(data["foaf:family_name"][0]["@value"] + " " + data["foaf:firstName"][0]["@value"])

            var cardBody = card.append('div').attr('class', 'card-body')
                cardBody.append('p').text("Fonction : " + data["dcterms:title"][0]["@value"])
                cardBody.append('p').text("Date d'anniversaire: " + data["foaf:birthday"][0]["@value"])
                cardBody.append('p').text("Activités : " + data["foaf:interest"][0]["@value"])

                card.append('div').attr('class', 'card-footer')
                    .text(data["chaine:voc.ttlhasChannel"][0]["@value"])
        }

        else {
            card.append('div').attr('class', 'card-header').append('h5')
                .text(data["chaine:voc.ttlnomChaine"][0]["@value"])

            var cardBody = card.append('div').attr('class', 'card-body')
                cardBody.append('p').text("Type de chaîne: " + data["dcterms:type"][0]["@value"])
                cardBody.append('p').text("Date de création : " + data["dcterms:created"][0]["@value"])

                card.append('div').attr('class', 'card-footer')
                    .text(data["chaine:voc.ttlhasYoutubeur"][0]["@value"])
        } 
    });

}


function displayItem(d) {

    d.forEach(function(data) {  

        var card = d3.select('#youtube-cards-item').append('div')
            .attr('class', 'justify-content-center d-inline-block')
            .style('margin', '30px').append('div')
            .attr('class', 'card border-dark mb-3 text-center')
            .style('width', '21rem')

        if (data["@type"][1] === "foaf:Person") {

            card.append('div').attr('class', 'card-header').append('h5')
                .text(data["foaf:familyName"][0]["@value"] + " " + data["foaf:firstName"][0]["@value"])

            var cardBody = card.append('div').attr('class', 'card-body')
                cardBody.append('p').text("Fonction : " + data["dcterms:title"][0]["@value"])
                cardBody.append('p').text("Nom d'utilisateur: " + data["foaf:nick"][0]["@value"])

                card.append('div').attr('class', 'card-footer')
                    .text(data["foaf:mbox"][0]["@value"])
        }

        else if (data["@type"][1] === "chaine:voc.ttlYoutubeur") {
            card.append('div').attr('class', 'card-header').append('h5')
                .text(data["foaf:family_name"][0]["@value"] + " " + data["foaf:firstName"][0]["@value"])

            var cardBody = card.append('div').attr('class', 'card-body')
                cardBody.append('p').text("Fonction : " + data["dcterms:title"][0]["@value"])
                cardBody.append('p').text("Date d'anniversaire: " + data["foaf:birthday"][0]["@value"])
                cardBody.append('p').text("Activités : " + data["foaf:interest"][0]["@value"])

                card.append('div').attr('class', 'card-footer')
                    .text(data["chaine:voc.ttlhasChannel"][0]["@value"])
        }

        else {
            card.append('div').attr('class', 'card-header').append('h5')
                .text(data["chaine:voc.ttlnomChaine"][0]["@value"])

            var cardBody = card.append('div').attr('class', 'card-body')
                cardBody.append('p').text("Type de chaîne: " + data["dcterms:type"][0]["@value"])
                cardBody.append('p').text("Date de création : " + data["dcterms:created"][0]["@value"])

                card.append('div').attr('class', 'card-footer')
                    .text(data["chaine:voc.ttlhasYoutubeur"][0]["@value"])
        } 
    });

}
