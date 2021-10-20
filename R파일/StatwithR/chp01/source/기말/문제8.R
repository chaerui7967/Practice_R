library(ggmap)
ggmap::register_google(key = "AIzaSyBmVt7m46GGcANIZkXOfKEJ5nDXpQ3mabw")
has_google_key()
gc<-geocode(enc2utf8('불국사')) #부산 경도 위도 가져오기
gc
ggmap(get_map(location=gc, source = "google", maptype = "roadmap", zoom = 10,scale="auto"),extent = "device", legend = "topright")
cen<-as.numeric(gc)
map<-get_googlemap(center = cen,maptype = "roadmap",markers = gc)
ggmap(map,extent = "device")
gmap<-ggmap(map)
gmap+geom_text(data=gc,aes(x=lon,y=lat),size=5,label="20141209채길호")
