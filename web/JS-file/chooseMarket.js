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

    var contentStringShopOne = '<div id="content">Chernaya</div>';
    var contentStringShopTwo = '<div id="content">Pionera</div>';

    var infowindowShopOne = new google.maps.InfoWindow({
        content: contentStringShopOne
    });
    var infowindowShopTwo = new google.maps.InfoWindow({
        content: contentStringShopTwo
    });

    var markerShopOne = new google.maps.Marker({
        position: shopOne,
        map: map,
        title: 'Pionera'
    });
    var markerShopTwo = new google.maps.Marker({
        position: shopTwo,
        map: map,
        title: 'Chernaya'
    });

    google.maps.event.addListener(markerShopOne, 'click', function () {
        // infowindowShopOne.open(map, markerShopOne);

        document.getElementById("1").value = "Pionera";
    });

    google.maps.event.addListener(markerShopTwo, 'click', function () {
        // infowindowShopTwo.open(map,markerShopTwo);

        document.getElementById("1").value = "Chernaya";
    });
}

function checkAddress() {
    if (document.getElementById("1").value === "")
        document.getElementById("1").value = "Pionera";

}

