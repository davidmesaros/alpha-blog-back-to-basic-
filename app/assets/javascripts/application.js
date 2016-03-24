// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

 $(document).ready(function() {});

$.getScript('http://www.chartjs.org/assets/Chart.js',function(){
  
  var data = [{
        label: "Number of Clicks",
        value: 30,
        color: "#F7464A"
    }, {
        value: 50,
        color: "#E2EAE9"
    }, {
        value: 100,
        color: "#D4CCC5"
    }, {
        value: 40,
        color: "#949FB1"
    }, {
        value: 120,
        color: "#4D5360"
    }

    ]

    var options = {
        animation: false
    };

    //Get the context of the canvas element we want to select
    var c = $('#myChart');
    var ct = c.get(0).getContext('2d');
    var ctx = document.getElementById("myChart").getContext("2d");
    /*************************************************************************/
    myNewChart = new Chart(ct).Doughnut(data, options);

})
