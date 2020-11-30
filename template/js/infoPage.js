var paramPrenom = window.location.search.substring(5);

/* d3.json("../data/" + paramPrenom + ".json", function(error, data) {
    infoData(data); 
}); */

let url = "https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g4/omk"; 

d3.csv("../data/api.csv", function(data) {
    data.forEach(function(d) {
        if (d.titre.includes(paramPrenom)) {
            console.log(d); 
            d3.json(url + d.url, function(res) {
                infoData(res);
            });
        }
    }) 
})

function infoData(data) {
    var media = d3.select('#media')
        media.append('img').attr('class', 'align-self-center mr-3').style('height', '15rem')
        .style('max-height', '100%').style('max-width', '100%').attr('src', function() {
            return data["thumbnail_display_urls"]["square"];
        })
  
    var mediaBody = media.append('div').attr('class', 'media-body').attr('id', 'media-body')
        mediaBody.append('h5').text(data["foaf:family_name"][0]["@value"] + " " + data["foaf:firstName"][0]["@value"])
        mediaBody.append('br')
        mediaBody.append('span').attr('class', 'fa fa-birthday-cake').text(" " + data["foaf:birthday"][0]["@value"])
        mediaBody.append('br')
        mediaBody.append('span').attr('class', 'fa fa-thumbs-up').text(" " + data["foaf:interest"][0]["@value"])
        mediaBody.append('br')
        mediaBody.append('a').style('color', 'red').attr('href', data["chaine:voc.ttlhasChannel"][1]["@id"])
                .append('span').attr('class', 'fa fa-youtube-play').text(" " + data["chaine:voc.ttlhasChannel"][0]["@value"])
}