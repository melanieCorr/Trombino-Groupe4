let data; 
let csv = "../data/api.csv";
let urlStart = "http://localhost/omeka-s-3.0.1/omeka-s"; 

d3.csv(csv, function(data) {
    data.forEach(function(d) {
        d3.json(urlStart + d.url, function(res) {
            displayBody(res);
        });
    })
})

function displayBody(data) {
    var card = d3.select('#youtube-cards').append('div')
            .attr('class', 'justify-content-center d-inline-block')
            .style('margin', '30px').append('div')
            .attr('class', 'card border-dark mb-3 text-center')
            .style('width', '21rem')

    if (data["dcterms:title"][0]["@value"] === "Utilisateur") {

        card.append('div').attr('class', 'card-header').append('h5')
            .text(data["foaf:familyName"][0]["@value"] + " " + data["foaf:firstName"][0]["@value"])

        var cardBody = card.append('div').attr('class', 'card-body')
            cardBody.append('p').text("Fonction : " + data["dcterms:title"][0]["@value"])
            cardBody.append('p').text("Nom d'utilisateur: " + data["foaf:nick"][0]["@value"])

            card.append('div').attr('class', 'card-footer')
                .text(data["foaf:mbox"][0]["@value"])
    }

    else if (data["dcterms:title"][0]["@value"] === "Youtubeur") {
        card.append('div').attr('class', 'card-header').append('h5')
            .text(data["foaf:family_name"][0]["@value"] + " " + data["foaf:firstName"][0]["@value"])

        var cardBody = card.append('div').attr('class', 'card-body')
            cardBody.append('p').text("Fonction : " + data["dcterms:title"][0]["@value"])
            cardBody.append('p').text("Date d'anniversaire: " + data["foaf:birthday"][0]["@value"])
            cardBody.append('p').text("Activités : " + data["foaf:interest"][0]["@value"])

            card.append('div').attr('class', 'card-footer')
                .text(data["Channel:voc.ttlhasChannel"][0]["@value"])
    }

    else {
        card.append('div').attr('class', 'card-header').append('h5')
            .text(data["Channel:voc.ttlnomChaine"][0]["@value"])

        var cardBody = card.append('div').attr('class', 'card-body')
            cardBody.append('p').text("Type de chaîne: " + data["dcterms:type"][0]["@value"])
            cardBody.append('p').text("Date de création : " + data["dcterms:created"][0]["@value"])

            card.append('div').attr('class', 'card-footer')
                .text(data["Channel:voc.ttlhasYoutubeur"][0]["@value"])
    }
}
