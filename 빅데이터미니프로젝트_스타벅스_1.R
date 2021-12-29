## 빅데이터미니프로젝트 ##
## 1조 : 김홍석, 이종현 ##

library("data.table") #fread 대용량 데이터 읽기 사용
library(dplyr)

#서울시 열린데이터 광장 사업체 현황
business <- fread("data/project/business.csv",stringsAsFactors = FALSE,data.table = F)
View(business)
자치구 <- business$자치구[business$동 == "소계"]
사업체수 <- business$사업체수[business$동 == "소계"]
종사자수 <- business$계[business$동 == "소계"]
사업체수 <- gsub(",","",사업체수)
종사자수 <- gsub(",","",종사자수)

#구별인구수
population <- fread("data/project/population.txt",stringsAsFactors = FALSE,data.table = F,encoding = "UTF-8")
View(population)
구별인구수 <- gsub(",","",population$합계[2:26])

#대중교통1일평균이용객수
transport <- fread("data/project/동별_수단OD_20191201.csv",stringsAsFactors = FALSE,data.table = F)
View(transport)
종로구 <- sum(transport$총_승객수[transport$도착_구 == "종로구"])
중구 <- sum(transport$총_승객수[transport$도착_구 == "중구"])
용산구 <- sum(transport$총_승객수[transport$도착_구 == "용산구"])
성동구 <- sum(transport$총_승객수[transport$도착_구 == "성동구"])
광진구 <- sum(transport$총_승객수[transport$도착_구 == "광진구"])
동대문구 <- sum(transport$총_승객수[transport$도착_구 == "동대문구"])
중랑구 <- sum(transport$총_승객수[transport$도착_구 == "중랑구"])
성북구 <- sum(transport$총_승객수[transport$도착_구 == "성북구"])
강북구 <- sum(transport$총_승객수[transport$도착_구 == "강북구"])
도봉구 <- sum(transport$총_승객수[transport$도착_구 == "도봉구"])
노원구 <- sum(transport$총_승객수[transport$도착_구 == "노원구"])
은평구 <- sum(transport$총_승객수[transport$도착_구 == "은평구"])
서대문구 <- sum(transport$총_승객수[transport$도착_구 == "서대문구"])
마포구 <- sum(transport$총_승객수[transport$도착_구 == "마포구"])
양천구 <- sum(transport$총_승객수[transport$도착_구 == "양천구"])
강서구 <- sum(transport$총_승객수[transport$도착_구 == "강서구"])
구로구 <- sum(transport$총_승객수[transport$도착_구 == "구로구"])
금천구 <- sum(transport$총_승객수[transport$도착_구 == "금천구"])
영등포구 <- sum(transport$총_승객수[transport$도착_구 == "영등포구"])
동작구 <- sum(transport$총_승객수[transport$도착_구 == "동작구"])
관악구 <- sum(transport$총_승객수[transport$도착_구 == "관악구"])
서초구 <- sum(transport$총_승객수[transport$도착_구 == "서초구"])
강남구 <- sum(transport$총_승객수[transport$도착_구 == "강남구"])
송파구 <- sum(transport$총_승객수[transport$도착_구 == "송파구"])
강동구 <- sum(transport$총_승객수[transport$도착_구 == "강동구"])
대중교통 <- data.frame("대중교통1일이용객수" = c(종로구,중구,
                                       용산구,성동구,광진구,동대문구,
                                       중랑구,성북구,강북구,도봉구,노원구,
                                       은평구,서대문구,마포구,양천구,
                                       강서구,구로구,금천구,영등포구,
                                       동작구,관악구,서초구,강남구,
                                       송파구,강동구))

#스타벅스 지점별 개 수

starbucks <- fread("data/project/starbucks.csv",stringsAsFactors = FALSE,data.table = F)
View(starbucks)
staraddr <- substr(starbucks$addr,6,9)
staraddr <- table(staraddr)
staraddr <- data.frame("star" = staraddr[1:25])
write.csv(staraddr,file = "스타벅스매장수.csv")
종로구 <- staraddr$star.Freq[staraddr$star.staraddr == " 종로구"]
중구 <- staraddr$star.Freq[staraddr$star.staraddr == " 중구 "]
용산구 <-staraddr$star.Freq[staraddr$star.staraddr == " 용산구"]
성동구 <- staraddr$star.Freq[staraddr$star.staraddr == " 성동구"]
광진구 <- staraddr$star.Freq[staraddr$star.staraddr == " 광진구"]
동대문구 <- staraddr$star.Freq[staraddr$star.staraddr == " 동대문"]
중랑구 <-staraddr$star.Freq[staraddr$star.staraddr ==" 중랑구"]
성북구 <- staraddr$star.Freq[staraddr$star.staraddr == " 성북구"]
강북구 <- staraddr$star.Freq[staraddr$star.staraddr == " 강북구"]
도봉구 <- staraddr$star.Freq[staraddr$star.staraddr == " 도봉구"]
노원구 <- staraddr$star.Freq[staraddr$star.staraddr == " 노원구"]
은평구 <- staraddr$star.Freq[staraddr$star.staraddr == " 은평구"]
서대문구 <- staraddr$star.Freq[staraddr$star.staraddr == " 서대문"]
마포구 <-staraddr$star.Freq[staraddr$star.staraddr == " 마포구"]
양천구 <- staraddr$star.Freq[staraddr$star.staraddr == " 양천구"]
강서구 <- staraddr$star.Freq[staraddr$star.staraddr == " 강서구"]
구로구 <- staraddr$star.Freq[staraddr$star.staraddr == " 구로구"]
금천구 <- staraddr$star.Freq[staraddr$star.staraddr == " 금천구"]
영등포구 <- staraddr$star.Freq[staraddr$star.staraddr == " 영등포"]
동작구 <- staraddr$star.Freq[staraddr$star.staraddr == " 동작구"]
관악구 <- staraddr$star.Freq[staraddr$star.staraddr == " 관악구"]
서초구 <- staraddr$star.Freq[staraddr$star.staraddr == " 서초구"]
강남구 <- staraddr$star.Freq[staraddr$star.staraddr == " 강남구"]
송파구 <- staraddr$star.Freq[staraddr$star.staraddr == " 송파구"]
강동구 <- staraddr$star.Freq[staraddr$star.staraddr == " 강동구"]
스타벅스매장수 <- data.frame("스타벅스매장수" = c(종로구,중구,
                                       용산구,성동구,광진구,동대문구,
                                       중랑구,성북구,강북구,도봉구,노원구,
                                       은평구,서대문구,마포구,양천구,
                                       강서구,구로구,금천구,영등포구,
                                       동작구,관악구,서초구,강남구,
                                       송파구,강동구))
View(스타벅스매장수)
write.csv(staraddr,file = "data/project/스타벅스매장수.csv")

유동인구 <- data.frame(자치구,스타벅스매장수,사업체수,종사자수,대중교통,구별인구수)
View(유동인구)
write.csv(유동인구,file = "data/project/스타벅스_유동인구(상관분석).csv")
staraddrs <- data.frame(자치구,스타벅스매장수)
write.csv(staraddr,file = "data/project/스타벅스매장수.csv")

#유동인구 상관관계
library(corrplot)
유동인구 <- read.csv("data/project/스타벅스_유동인구(상관분석).csv")
View(유동인구)
View(유동인구[3,3:7])
w_유동인구 <- 유동인구[3:7]
w_유동인구 <- data.frame("starbucks" = w_유동인구$스타벅스매장수,"work"  = w_유동인구$사업체수,
                     "worker" = w_유동인구$종사자수,"transport" = w_유동인구$대중교통1일이용객수,
                     "population" = w_유동인구$구별인구수)
w_유동인구 <- cor(w_유동인구)
corrplot(w_유동인구, method='shade', shade.col=NA, tl.col='black', tl.srt=45)

v<-c(10,20,30,40); v[-1]
10:15
c(10,11,12,13,14,15)
rep(10:15,1)
seq(15,10)

library(dplyr)
library("data.table")
install.packages("ggplot2")
install.packages("ggmap")

#스타벅스 지도 표시
starbucks<-fread("data/project/starbucks.csv",stringsAsFactors = FALSE,data.table = F,encoding = "UTF-8")
View(starbucks)
library(ggmap)
register_google(key='AIzaSyDKA8i2ULsDmVoXS1w12iBkd2PKagFRU0Y')
library(ggplot2)
df<-head(starbucks,562)
cen<- c(mean(df$lng),mean(df$lat))
gc<- data.frame(lng=df$lng , lat = df$lat)
gc
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=11) # 지도 정보 담기 
gmap <- ggmap(map) # 데이터 입력
gmap+geom_point(data=df, # 산점도 표현
                aes(x=lng,y=lat), # 원의 크기를 mag로 표시
                alpha=0.5)+ggtitle("서울시 스타벅스 산점도")


ggsave("starbucksmap1.png")
png(filename="output/starbucksmap.png", height=1000, width=1000, bg="white")
dev.copy(png, 'output/starbucksmap.png')
dev.off()


#노마드 데이터 추출
nomad<-fread("data/project/노마드_소비데이터.csv",stringsAsFactors = FALSE,data.table = F,encoding = "UTF-8")
View(nomad)
nomad_data<-data.frame(nomad$`STORE_GU_NM(가맹점주소시군구)`, nomad$`STORE_DONG_NM(가맹점주소행정동)`)
View(nomad_data)
nomad_rank_gu<-table(nomad_data$nomad..STORE_GU_NM.가맹점주소시군구..)
View(nomad_rank_gu)

nomad_rank_dong<-table(nomad_data$nomad..STORE_DONG_NM.가맹점주소행정동..)
View(nomad_rank_dong)

View(sort(nomad_rank_gu))

install.packages("data.table")
library(data.table)

#상권매출

#2019커피 소비인구
library(dplyr)
coffee2019<-fread("data/project/행정동별_커피분야_소비인구_2019.csv",stringsAsFactors = FALSE,data.table = F,encoding = "UTF-8")

View(coffee2019)
coffee2019_seoul<-
  coffee2019 %>% 
  filter(coffee2019$de == "20190801" & coffee2019$brtc_nm =="서울특별시" )
#2019서울커피 소비인구
View(coffee2019_seoul)

##행정동별 커비 소비2019
coffee_total_people2019<-
  aggregate(coffee2019_seoul$cnsmr_popltn_co, by=list(coffee2019_seoul$adstrd_nm), FUN=sum)
View(coffee_total_people2019)
coffee_total_people2019_dong<-coffee_total_people2019 %>% 
  arrange(desc(x))
View(coffee_total_people2019_dong)
##지역구별 커피 소비 2019
coffee_total_people2019<-
  aggregate(coffee2019_seoul$cnsmr_popltn_co, by=list(coffee2019_seoul$signgu_nm), FUN=sum)
View(coffee_total_people2019)
coffee_total_people2019_gu<-coffee_total_people2019 %>% 
  arrange(desc(x))
View(coffee_total_people2019_gu)



##2020서울 커피
library(dplyr)
coffee2020<-fread("data/project/행정동별_커피분야_소비인구_2020.csv",stringsAsFactors = FALSE,data.table = F,encoding = "UTF-8")
View(coffee2020)
coffee2020_seoul<-
  coffee2020 %>% 
  filter(coffee2020$de == "20200801" & coffee2020$bntr_nm =="서울특별시" )
#행정동별 커피소비 2020
View(coffee2020_seoul)
coffee2020_seoul<-
  aggregate(coffee2020_seoul$cnsmr_popltn_co, by=list(coffee2020_seoul$adstrd_nm),FUN=sum)
coffee_total_people2020_dong<-coffee2020_seoul %>% 
  arrange(desc(x))
View(coffee_total_people2020_dong)
#지역구별 커피소비2020
coffee_total_people2020<-
  aggregate(coffee2020_seoul$cnsmr_popltn_co, by=list(coffee2020_seoul$signgu_nm), FUN=sum)
View(coffee_total_people2020)
coffee_total_people2020_gu<-coffee_total_people2020 %>% 
  arrange(desc(x))
View(coffee_total_people2020_gu)


##2020서울 유흥분야 소비인구
play2020<-fread("data/project/행정동별_유흥분야_소비인구_2020.csv",stringsAsFactors = FALSE,data.table = F,encoding = "UTF-8")
View(play2020)
play2020_seoul<-
  play2020 %>% 
  filter(play2020$de =="20200801" & play2020$bntr_nm =="서울특별시")
View(play2020_seoul)
#지역구별 유흥소비 2020
play2020_total_seoul<-
  aggregate(play2020_seoul$cnsmr_popltn_co, by=list(play2020_seoul$signgu_nm), FUN=sum)
View(play2020_total_seoul)
play2020_total_seoul_gu<-play2020_total_seoul %>% 
  arrange(desc(x))
View(play2020_total_seoul_gu)

##2020 서울 편의점 소비인구
library(dplyr)
convenience2020<-fread("data/project/행정동별_편의점분야_소비인구_2020.csv",stringsAsFactors = FALSE,data.table = F,encoding = "UTF-8")
View(convenience2020)
convenience2020_seoul<-
  convenience2020 %>% 
  filter(convenience2020$de == "20200801" & convenience2020$bntr_nm =="서울특별시" )
View(convenience2020_seoul)
#지역구별 편의점 소비 인구
convenience_total_seoul2020<-
  aggregate(convenience2020_seoul$cnsmr_popltn_co, by=list(convenience2020_seoul$signgu_nm), FUN=sum)
View(convenience_total_seoul2020)
convenience_total_seoul2020_gu<-convenience_total_seoul2020 %>% 
  arrange(desc(x))
View(convenience_total_seoul2020_gu)

#구별 소비량
gu2020<-cbind(coffee_total_people2020_gu,play2020_total_seoul_gu,convenience_total_seoul2020_gu)

#############각 소비별 상관관계 분석###############################################################################
coffee_total_people2020_gu<-coffee_total_people2020_gu[c(order(coffee_total_people2020_gu$Group.1)),]
play2020_total_seoul_gu<-play2020_total_seoul_gu[c(order(play2020_total_seoul_gu$Group.1)),]
convenience_total_seoul2020_gu<-convenience_total_seoul2020_gu[c(order(convenience_total_seoul2020_gu$Group.1)),]

sobi<-data.frame(c(coffee_total_people2020_gu,play2020_total_seoul_gu,convenience_total_seoul2020_gu))
View(sobi)
bunseok<- bunseok[,-c(3)]
sobi<- sobi[,-c(3,5)]
View(sobi)
names(sobi)<-c("자치구","커피소비인구","유흥소비인구","편의점소비인구")
#압도적으로 숫자가 높은 강남구,중구 제외
sobi1<-sobi[-c(1,24),]
View(sobi1)
View(유동인구)
유동인구<-유동인구[c(order(유동인구$자치구)),]
유동인구<-유동인구[-c(1,24),]
인구_각소비분석<-data.frame(c(sobi1,유동인구))
인구_각소비분석<-인구_각소비분석[,c(1,2,3,4,11)]
View(인구_각소비분석)


##################편의점,커피,유흥소비 합계#############################################################################
View(gu2020)
gu2020_total<-aggregate(gu2020$x, by=list(gu2020$Group.1),FUN=sum)
View(gu2020_total)
gu2020_top10 <- gu2020_total %>% 
  arrange(desc(x))
gu2020_top10<-head(gu2020_top10,10)
View(gu2020_top10)
barplot(gu2020_top10$x~gu2020_top10$Group.1)


ggplot(data=bar_df, aes(x = obs,
  y = value,
fill = as.factor(value)))
geom_bar(stat = 'identity')

library(ggplot2)
ggplot(gu2020_top10, aes(gu2020_top10$Group.1,gu2020_top10$x,fill=gu2020_top10$Group.1))+geom_bar(stat='identity')
ggplot(sleep, aes(ID, extra, fill=group))+geom_bar(stat='identity') 
#####################################################################################################
## --> 행정동 별로 커피, 편의점 등을 소비하는 사람들의 수가 이정도 있다
## --> 스타벅스 위치가 많은 자치구가 소비가 많이 일어나는 자치구인지 상관관계 분석

##스타벅스위치가 많은 지역구
library(dplyr)
library(data.table)
starbucks_gu<-fread("data/project/스타벅스매장수.csv",stringsAsFactors = FALSE,data.table = F)
names(gu2020_total)<-c("자치구","소비인구")
gu2020_total

order(starbucks_gu$자치구)
starbucks_gu<-starbucks_gu[c(order(starbucks_gu$자치구)),]

View(starbucks_gu)

bunseok<-data.frame(c(starbucks_gu,gu2020_total))
View(bunseok)
bunseok<- subset(bunseok,select=-V1)
bunseok<- bunseok[,-c(3)]
View(bunseok)
plot(bunseok$스타벅스매장수,bunseok$소비인구)
plot(bunseok$소비인구,bunseok$스타벅스매장수)
cor(bunseok$스타벅스매장수,bunseok$소비인구)

#압도적으로 숫자가 높은 강남구,중구 제외
dd<-bunseok[-c(1,24),]
View(dd)

plot(dd$소비인구,dd$스타벅스매장수)
plot(dd$스타벅스매장수,dd$소비인구,col="red")
lines(dd$스타벅스매장수,dd$소비인구, col="red")
res=lm(dd$스타벅스매장~dd$소비인구,data=dd)
abline(res)
cor(dd$소비인구,dd$스타벅스매장수)
###############################################################
library(ggplot2)
ggplot(dd,aes(x=dd$스타벅스매장수,y=dd$소비인구))+geom_point(color='gray75')+stat_smooth(method='lm',se=F,color='black')
ggplot(dd,aes(x=dd$스타벅스매장수,y=dd$소비인구))+geom_point(color='gray75')+geom_text(mapping = aes(label=자치구),
                                                                            size=3,
                                                                            vjust=-1,
                                                                            family='NaumGothic')+stat_smooth(method='lm',se=F,color='black')
ggsave("스타벅스매장 갯수와 일일소비 상관관계.png")
cor(dd$소비인구,dd$스타벅스매장수)
getwd()
png(filename = "스타벅스매장 갯수와 일일소비 상관관계.png",width=300,height=600,unit="px",bg="transparent")
dev.off()


#####################################################################################################################

