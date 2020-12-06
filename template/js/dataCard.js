/* d3.json("../data/items.json", function(error, data) {
    console.log(data); 
    displayItems(data); 
}); */

let channelData = [
    { youtubeur: 'Squeezie', abos: 15.3, views: 7686814129, videos: 1364 }, 
    { youtubeur: 'Cyprien', abos: 13.9, views: 2664468413, videos: 176 }, 
    { youtubeur: 'Norman fait des vidéos', abos: 12.2, views: 2521173283, videos: 185 }, 
    { youtubeur: 'Natoo', abos: 5.17, views: 2521173283, videos: 112 }, 
    { youtubeur: 'Mister V', abos: 5.68, views: 407316090, videos: 32 }, 
    { youtubeur: 'Gotaga', abos: 3.66, views: 655617879, videos: 905 }, 
    { youtubeur: 'Dr Nozman', abos: 3.7, views: 655617879, videos: 425 }, 
    { youtubeur: 'EnjoyPhoenix', abos: 3.67, views: 598749542, videos: 782 }
];

let url = "https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g4/omk"; 
let dataYoutubeurs; 
let dataChaines; 

d3.queue().defer(d3.csv, '../data/api.csv')
    .awaitAll(function(error, results) {
        if (error) throw error;
        results.forEach(function(res) {
            res.forEach(api => {
                if (api.titre === 'Liste des youtubeurs') {
                    d3.json(url + api.url, function(res) {
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
function displaySpinners() {
    
      document.getElementById("chart").style.display = "block";
    }
    function hideSpinners() {
  
      document.getElementById("chart").style.display = "none";
    }
function RechercheByName() {
      displaySpinners();
      localStorage.clear();
      var name = document.getElementById('searchByName').value;
      console.log(name);
      if (name == "") {
        setData(csv_data, false);

        return;
      }
      dataForm = csv_data[0];
      console.log(csv_data);
      new_data = dataForm.filter(function (d) { return d["foaf:firstName"][0]["@value"].toLowerCase() + " " + d["foaf:family_name"][0]["@value"].toLowerCase() == name.toLowerCase(); });
      console.log(new_data);
      setData(new_data, true);

    }
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

    let abos = [], views = [], videos = []; 
    channelData.forEach((data, id) => {
        let youtubeur = data.youtubeur; 
        let nbAbos = data.abos; 
        let nbViews = data.views; 
        let nbVideos = data.videos; 

        abos.push({ youtubeur: youtubeur, importance: nbAbos, id: id }); 
        views.push({ youtubeur: youtubeur, importance: nbViews, id: id });
        videos.push({ youtubeur: youtubeur, importance: nbVideos, id: id });
    })

    drawChart(150, abos, 'Nombre d\'abonnés'); 
    drawChart(150, views, 'Nombre de vues'); 
    drawChart(150, videos, 'Nombre de vidéos'); 
}

function genreFilter(genre) {
    hideSpinners();
    displaySpinners();
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
    hideSpinners();
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

function abosFilter(num1, num2) {
    hideSpinners();
    let cards = document.getElementById('youtube-cards-items'); 
    cards.innerHTML = ''; 
    if (num1 === 'Tous') {
        setTimeout(() => {
            displayItems(dataYoutubeurs); 
        }, 1000);
    } 
    else {
        setTimeout(() => {
            let youtubeurs = [];
            channelData.forEach(data => {
                if (data.abos >= num1 && data.abos <= num2) {
                    dataYoutubeurs.forEach(youtube => {
                        if (youtube['chaine:voc.ttlhasChannel'][0]['@value'].includes(data.youtubeur)) {
                            youtubeurs.push(youtube); 
                        }
                    })
                }
            })
            displayItems(youtubeurs);
        }, 1000); 
    }
}

function viewsFilter(num1, num2) {
    hideSpinners();
    let cards = document.getElementById('youtube-cards-items'); 
    cards.innerHTML = ''; 
    if (num1 === 'Tous') {
        setTimeout(() => {
            displayItems(dataYoutubeurs); 
        }, 1000);
    } 
    else {
        setTimeout(() => {
            let youtubeurs = [];
            channelData.forEach(data => {
                if (data.views >= num1 && data.views <= num2) {
                    dataYoutubeurs.forEach(youtube => {
                        if (youtube['chaine:voc.ttlhasChannel'][0]['@value'].includes(data.youtubeur)) {
                            youtubeurs.push(youtube); 
                        }
                    })
                }
            })
            displayItems(youtubeurs);
        }, 1000); 
    }
}

function videosFilter(num1, num2) {
    hideSpinners();
    let cards = document.getElementById('youtube-cards-items'); 
    cards.innerHTML = ''; 
    if (num1 === 'Tous') {
        setTimeout(() => {
            displayItems(dataYoutubeurs); 
        }, 1000);
    } 
    else {
        setTimeout(() => {
            let youtubeurs = [];
            channelData.forEach(data => {
                if (data.videos >= num1 && data.videos <= num2) {
                    dataYoutubeurs.forEach(youtube => {
                        if (youtube['chaine:voc.ttlhasChannel'][0]['@value'].includes(data.youtubeur)) {
                            youtubeurs.push(youtube); 
                        }
                    })
                }
            })
            displayItems(youtubeurs);
        }, 1000); 
    }
}


function drawChart(size, data, title) {
    var w = size, h = size, radius = Math.min(w, h) / 2; 
    var floatFormat = d3.format('.4r'); 
    var color = d3.scaleOrdinal(d3.schemeCategory20b);

    var wSvg = w + 10 + 0, hSvg = h + 10 + 10; 
    var svg = d3.select('#chart').append('svg')
        .attr('width', wSvg).attr('height', hSvg)
        .append('g').attr('transform', 'translate(' + (wSvg / 2) + ',' + (hSvg / 2) + ')');
    
    var arc = d3.arc().innerRadius(radius * 0.5).outerRadius(radius * 0.8); 

    var pie = d3.pie().value(function(d) { return floatFormat(d['importance']) }).sort(null); 

    var tooltip = d3.select('#chart').append('div').attr('class', 'tooltip'); 
        tooltip.append('div').attr('class', 'label'); 

    svg.append('g').attr('class', 'slices');

    var path = svg.select('.slices').datum(data).selectAll('path').data(pie).enter()
        .append('path').attr('d', arc).attr('fill', function(d) {
            d.couleur = color(d.data['youtubeur']); 
            return d.couleur; 
        }); 
    
    svg.append('text').html(title).attr('text-anchor', 'middle').attr('y', hSvg / 2); 

    path.on('mouseenter', function(data) {
        tooltip.transition()
            .duration(200)
            .style("opacity", .9);
        tooltip.html(toolTipHTML(data))
            .style('background', data.couleur)
            .style("left", (d3.event.pageX) + "px")
            .style("top", (d3.event.pageY - 28) + "px");
    })

    path.on('mouseout', function () {
        d3.selectAll('.toolCircle').remove();           		                    
        tooltip.transition()
            .duration(500)
            .style("opacity", 0);
    });

    function toolTipHTML(data) {
        let str; 
        if (title === 'Nombre d\'abonnés') {
            str = 'M'; 
        }
        else if (title === 'Nombre de vues') {
            str = ' de vues'; 
        }
        else {
            str = ' de vidéos';
        }
        var tip = '<h6 class="card-title">' + data.data.youtubeur + '</h6>'
            tip += '<p class="card-text">' + data.data.importance + str + '</p>';
        
        return tip; 
    }
}
