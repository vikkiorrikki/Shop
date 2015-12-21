function initialize() {
    var shopOne = new google.maps.LatLng(59.991217, 30.318919);
    var shopTwo = new google.maps.LatLng(59.972179, 30.323461);

    var myOptions = {
        zoom: 12,
        center: shopTwo,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var mapc = document.getElementById('map');
    var map = new google.maps.Map(mapc, myOptions);

    var contentStringShopOne = '<div id="content">Chernaya rechka</div>';
    var contentStringShopTwo = '<div id="content">Pionerskaya</div>';

    var infowindowShopOne = new google.maps.InfoWindow({
        content: contentStringShopOne
    });
    var infowindowShopTwo = new google.maps.InfoWindow({
        content: contentStringShopTwo
    });

    var markerShopOne = new google.maps.Marker({
        position: shopOne,
        map: map,
        title: 'Pionerskaya'
    });
    var markerShopTwo = new google.maps.Marker({
        position: shopTwo,
        map: map,
        title: 'Chernaya rechka'
    });

    google.maps.event.addListener(markerShopOne, 'click', function () {
        // infowindowShopOne.open(map, markerShopOne);

        document.getElementById("1").value = "Pionerskaya";
    });

    google.maps.event.addListener(markerShopTwo, 'click', function () {
        // infowindowShopTwo.open(map,markerShopTwo);

        document.getElementById("1").value = "Chernaya rechka";
    });
}

function checkAddress() {
    if (document.getElementById("1").value === "")
        document.getElementById("1").value = "Pionerskaya";

}

