#5개 이상 마커 & 범례 과제
library(ggmap)
library(ggplot2)
ggmap::register_google(key = "AIzaSyBmVt7m46GGcANIZkXOfKEJ5nDXpQ3mabw") ## api키 가져오기
has_google_key()

na<-c("그린피스 천문대",
      "Hollywood Walk of Fame",
      "Universal Studios Hollywood",
      "그린피스 공원",
      "로스앤젤레스 동물원")
ad<-c("2800 E Observatory Rd, Los Angeles",
      "Hollywood Boulevard, Vine St, Los Angeles",
      "100 Universal City Plaza, Universal City",
      "4730 Crystal Springs Dr, Los Angeles",
      "5333 Zoo Dr, Los Angeles")
gc<-geocode(enc2utf8(ad))
gc
df<-data.frame(name=na,lon=gc$lon,lat=gc$lat)
ce<-c(mean(df$lon),mean(df$lat))
map<-get_googlemap(center = ce, maptype = "roadmap",zoom = 13,markers = gc)
gg<-ggmap(map)
gg+geom_text(data=df,aes(x=lon,y=lat),size=5,label=df$name, fontface = "bold")

map<-get_googlemap(center = ce, maptype = "roadmap",zoom = 13)
gm<-ggmap(map,extent="device",legend="topright")
gm+geom_text(data=df,aes(lon,lat,colour=factor(name)),size=10,label=seq_along(df$name))
