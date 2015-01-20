$ ->
  $("#nav-toggle").sideNav(edge: 'left')

  $("#slide-out").click ()->
    $('#sidenav-overlay').trigger('click')
#<iframe  width="100%" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.1149054108955!2d30.290150134908632!3d60.00583186830716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46963414e5ca5c99%3A0xc51f8acc0ee5d8e1!2z0LDQuy4g0J_QvtC70LjQutCw0YDQv9C-0LLQsCwgNtC6Miwg0KHQsNC90LrRgi3Qn9C10YLQtdGA0LHRg9GA0LMsIDE5NzM0MQ!5e0!3m2!1sru!2sru!4v1421663380209&scrollwheel=false"></iframe>


#<script src="https://maps.googleapis.com/maps/api/js?signed_in=true&v=3.exp"></script>

# Maps
if $("#map-canvas").length
  (->
    initializeGoogleMap = ->
      positionCenter = new google.maps.LatLng(60.005923, 30.290429)
      positionMarker = new google.maps.LatLng(60.005923, 30.290429)
      myOptions =
        zoom: 15
        center: positionCenter
        disableDefaultUI: true
        scrollwheel: false
        zoomControl: true
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(document.getElementById("map-canvas"), myOptions)

      myInfoWindow = new google.maps.InfoWindow()
      marker = new google.maps.Marker(
        position: positionMarker
        map: map
      )
      myWindowOptions = content: "
      <p>ст. метро «Пионерская»,<br />
        аллея Поликарпова,<br />
        дом 6 корп. 2,<br />
        второй этаж  <br/>
        Запись по тел.: +7 (953) 345 57 43
      </p>
      "
      google.maps.event.addListener marker, "click", ->
        myInfoWindow = new google.maps.InfoWindow(myWindowOptions)
        myInfoWindow.open map, marker

    loadGoogleMapScript = ->
      script = document.createElement("script")
      script.type = "text/javascript"
      script.src = "https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&signed_in=true&callback=initializeGoogleMap"
      document.body.appendChild script
    window.initializeGoogleMap = initializeGoogleMap
    loadGoogleMapScript()
  )()
