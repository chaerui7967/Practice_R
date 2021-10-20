library(devtools)
library(base)
install_github('dkahle/ggmap',ref = "tidyup")
devtools::install_github("hadley/multidplyr")
install.packages("ggplot2",dependencies = TRUE)
if(!require(ggplot2)){
  install.packages("ggplot2"); require(ggplot2)
}
install.packages("pillar",dependencies = TRUE)
install.packages("ps")

devtools::session_info()

library(ggmap)

##구글 api key AIzaSyC982JUKZNJ7Z_NCiGudlKW-aC7Wd7WYk0
#후배 키 AIzaSyDZ4vcKmqew8KpcMDUXpOOFafW_p1C1ZeU // AIzaSyBmVt7m46GGcANIZkXOfKEJ5nDXpQ3mabw
ggmap::register_google(key = "AIzaSyBmVt7m46GGcANIZkXOfKEJ5nDXpQ3mabw") ## api키 가져오기
has_google_key()


#--------------------------------------------------------------------------------------




#부산지도

gc<-geocode(enc2utf8('부산')) #부산 경도 위도 가져오기
gc


ggmap(get_map(location=gc, source = "google", maptype = "roadmap", zoom = 5,scale="auto"),extent = "device", legend = "topright")



#서울 지도
ggmap(
  ggmap = get_map(
    "seoul",
    zoom = 13, scale="auto",
    maptype = "roadmap",
    source = "google"),
  extent = "device",
  legend = "topright"
)

#임의 주소지 중심의 지도 출력
gc<-geocode(enc2utf8('충청북도 단양군'))
cen<-as.numeric(gc)
map<-get_googlemap(center = cen,maptype = "terrain")
ggmap(map)

#전체 영역으로 지도 출력
map<-get_googlemap(center = cen,maptype = "roadmap")
ggmap(map,extent = "device")

#마커 출력
gc<-geocode(enc2utf8('충청북도 단양군군'))
cen<-as.numeric(gc)
map<-get_googlemap(center = cen,maptype = "roadmap",markers = gc)
ggmap(map,extent = "device")


#교재 p185
library(ggplot2)
names<-c("도담삼봉/석문","구담/옥순봉","사인암","하선암","중선암","상선암")
addr<-c("충청북도 단양군 매포읍 삼봉로 644-33",
        "충청북도 단양군 단성면 월악로 3827",
        "충청북도 단양군 대강면 사인암2길 42",
        "충청북도 단양군 단성면 선암계곡로 1337",
        "충청북도 단양군 단성면 선암계곡로 868-2",
        "충청북도 단양군 단성면 선암계곡로 790")

gc<-geocode(enc2utf8(addr))
gc
df<-data.frame(name=names,lon=gc$lon,lat=gc$lat)
cen<-c(mean(df$lon),mean(df$lat))
map<-get_googlemap(center = cen, maptype = "roadmap",zoom = 11,markers = gc)
ggmap(map)

#이름 출력 p187
gmap<-ggmap(map)
gmap+geom_text(data=df,aes(x=lon,y=lat),size=5,label=df$name)

#범례 출력 p188
map<-get_googlemap(center=cen,maptype = "roadmap",zoom = 11)
gmap<-ggmap(map,extent="device",legend="topright")
gmap+geom_text(data=df,aes(lon,lat,colour=factor(name)),size=10,label=seq_along(df$name))


#지진지역 마커 표시 p191

library(ggmap)
df<-head(quakes,100)
cen<-c(mean(df$long),mean(df$lat))
gc<-data.frame(lon=df$long,lat=df$lat)

gc$lon<-ifelse(gc$lon>18,-(360-gc$lon),gc$lon)
map<-get_googlemap(center = cen,scale = 1,maptype = "roadmap",zoom = 4,markers = gc)
ggmap(map,extent="device")

#지진 규모 표시 p193
map<-get_googlemap(center = cen,scale = 1,maptype = "roadmap",zoom=5)
ggmap(map,extent = "device")+
  geom_point(data = df,aes(x=long,y=lat,size=mag),alpha=0.5)
