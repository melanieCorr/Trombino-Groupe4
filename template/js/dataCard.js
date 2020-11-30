/* d3.json("../data/items.json", function(error, data) {
    console.log(data); 
    displayItems(data); 
}); */

let url = "https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g4/omk"; 
let dataYoutubeurs; 
let dataChaines; 

d3.queue().defer(d3.csv, '../data/api.csv')
    .awaitAll(function(error, results) {
        if (error) throw error;
        results.forEach(function(res) {
            res.forEach(api => {
                if (api.titre === 'Liste des youtubeurs') {
                    console.log(api)
                    d3.json(url + api.url, function(res) {
                        console.log(res)
                        displayItems(res); 
                        dataYoutubeurs = res; 
                    });
                }
                else if (api.titre === 'Liste des chaines') {
                    d3.json(url + api.url, function(res) {
                        dataChaines = res; 
                    })
                }
            }) 
        }) 
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

function genreFilter(genre) {
    let cards = document.getElementById('youtube-cards-items'); 
    cards.innerHTML = ''; 
    if (genre === 'Tous') {
        setTimeout(() => {
            displayItems(dataYoutubeurs); 
        }, 1000);
    } 
    else {
        setTimeout(() => {
            let youtubeurs = [];
            dataChaines.forEach(chaine => {
                if (chaine['dcterms:type'][0]['@value'].includes(genre)) {
                    dataYoutubeurs.forEach(d => {  
                        if (chaine['chaine:voc.ttlnomChaine'][0]['@value'] === d['chaine:voc.ttlhasChannel'][0]['@value']) {
                             youtubeurs.push(d); 
                        }
                    })
                }
            })
            displayItems(youtubeurs)
        }, 1000); 
    }
}

function dateFilter(date1, date2) {
    let cards = document.getElementById('youtube-cards-items'); 
    cards.innerHTML = ''; 
    if (date1 === 'Tous') {
        setTimeout(() => {
            displayItems(dataYoutubeurs); 
        }, 1000);
    } 
    else {
        setTimeout(() => {
            let youtubeurs = [];
            dataChaines.forEach(chaine => {
                if (
                    chaine['dcterms:created'][0]['@value'].substring(0, 4) >= date1 && 
                    chaine['dcterms:created'][0]['@value'].substring(0, 4) <= date2
                ) {
                    dataYoutubeurs.forEach(d => {  
                        if (chaine['chaine:voc.ttlnomChaine'][0]['@value'] === d['chaine:voc.ttlhasChannel'][0]['@value']) {
                             youtubeurs.push(d); 
                        }
                    })
                }
            })
            displayItems(youtubeurs)
        }, 1000); 
    }
}