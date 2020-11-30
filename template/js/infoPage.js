var paramPrenom = window.location.search.substring(5);

/* d3.json("../data/" + paramPrenom + ".json", function(error, data) {
    infoData(data); 
}); */

let url = "https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g4/omk"; 
let youtubeChaine; 

d3.csv("../data/api.csv", function(data) {
    data.forEach(function(d) {
        if (d.titre.includes(decodeURI(paramPrenom))) {
            d3.json(url + d.url, function(resYoutubeur) {
                data.forEach(function(d) {
                    if (d.titre.includes(resYoutubeur['chaine:voc.ttlhasChannel'][0]['@value'])) {
                        d3.json(url + d.url, function(resChaine) {
                            infoData(resYoutubeur, resChaine); 
                        })
                    }
                })
            });
        }
    }) 
})

function infoData(dataYoutubeur, dataChaine) {
    var media = d3.select('#media')
        media.append('img').attr('class', 'align-self-center mr-3').style('height', '15rem')
        .style('max-height', '100%').style('max-width', '100%').attr('src', function() {
            return dataYoutubeur["thumbnail_display_urls"]["square"];
        })
  
    var mediaBody = media.append('div').attr('class', 'media-body').attr('id', 'media-body')
        mediaBody.append('h5').text(dataYoutubeur["foaf:family_name"][0]["@value"] + " " + dataYoutubeur["foaf:firstName"][0]["@value"])
        mediaBody.append('br')
        mediaBody.append('span').attr('class', 'fa fa-birthday-cake').text(" " + dataYoutubeur["foaf:birthday"][0]["@value"])
        mediaBody.append('br')
        mediaBody.append('span').attr('class', 'fa fa-thumbs-up').text(() => {
            if (dataYoutubeur["foaf:interest"]) {
                return " " + dataYoutubeur["foaf:interest"][0]["@value"]
            } else {
                return " "
            }
        }) 
        mediaBody.append('br')
        mediaBody.append('a').style('color', 'red').attr('href', dataYoutubeur["chaine:voc.ttlhasChannel"][1]["@id"])
                .append('span').attr('class', 'fa fa-youtube-play').text(" " + dataYoutubeur["chaine:voc.ttlhasChannel"][0]["@value"])
}