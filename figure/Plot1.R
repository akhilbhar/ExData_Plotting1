###################
####Extracting Data
###################
dir="C:/Users/akhil/Desktop/R/coursera/Exploratory Analysis/Assignment1"
dirData=paste0(dir,"/","Data")
if(!dir.exists(dirData)){dir.create(dirData)}       


url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName="data.zip"
file=paste0(dir,"/",fileName)
download.file(url,file)
unzip(zipfile=file,exdir=dirData)

dataFile=paste0(dirData,"/",list.files(dirData)[1])
data=read.table(dataFile,header=TRUE,sep=";",na.string="?")

#basic summary tests
dim(data)
head(data,2)
str(data)
#dev.set(1)

#Data Cleaning
data$Date=as.Date(data$Date,format="%d/%m/%Y")

#Subsetting with Dates 
dataSubS=subset(data,Date %in% as.Date(c("2007-02-01","2007-02-02")))


#plot 2
file=paste0(dir,"/","plot2.png")
png(filename = file,width = 480, height = 480)
with(dataSubS,plot(strptime(paste(Date,Time,sep=" "),"%Y-%m-%d %H:%M:%S"),Global_active_power,type='l',ylab="Global Active Power(kilowatts)",xlab=""))
dev.off()

