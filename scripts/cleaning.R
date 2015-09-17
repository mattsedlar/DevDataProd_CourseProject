library(dplyr)

# unzip data
if(!file.exists("data/ACS_14_1YR_S0804.csv")) {
unzip("data/ACS_14_1YR_S0804.zip",exdir="data")
}

# read in data
data <- read.csv("data/ACS_14_1YR_S0804.csv")
labels <- read.csv("data/ACS_14_1YR_S0804_ann.csv",skip=1,nrows = 1)

# swap colnames for accurate descriptions
colnames(data) <- colnames(labels)

tidydata <- data

# selecting only columns necessary for calculations
tidydata <- tidydata %>% select(Geography,
                                Car..truck..or.van....drove.alone..Estimate..Workers.16.years.and.over,
                                Car..truck..or.van....drove.alone..Estimate..AGE...16.to.19.years,
                                Car..truck..or.van....drove.alone..Estimate..AGE...20.to.24.years,
                                Car..truck..or.van....drove.alone..Estimate..AGE...25.to.44.years,
                                Car..truck..or.van....drove.alone..Estimate..AGE...45.to.54.years,
                                Car..truck..or.van....drove.alone..Estimate..AGE...55.to.59.years,
                                Car..truck..or.van....drove.alone..Estimate..AGE...60.years.and.over,
                                Car..truck..or.van....carpooled..Estimate..Workers.16.years.and.over,
                                Car..truck..or.van....carpooled..Estimate..AGE...16.to.19.years,
                                Car..truck..or.van....carpooled..Estimate..AGE...20.to.24.years,
                                Car..truck..or.van....carpooled..Estimate..AGE...25.to.44.years,
                                Car..truck..or.van....carpooled..Estimate..AGE...45.to.54.years,
                                Car..truck..or.van....carpooled..Estimate..AGE...55.to.59.years,
                                Car..truck..or.van....carpooled..Estimate..AGE...60.years.and.over,
                                Public.transportation..excluding.taxicab...Estimate..Workers.16.years.and.over,
                                Public.transportation..excluding.taxicab...Estimate..AGE...16.to.19.years,
                                Public.transportation..excluding.taxicab...Estimate..AGE...20.to.24.years,
                                Public.transportation..excluding.taxicab...Estimate..AGE...25.to.44.years,
                                Public.transportation..excluding.taxicab...Estimate..AGE...45.to.54.years,
                                Public.transportation..excluding.taxicab...Estimate..AGE...55.to.59.years,
                                Public.transportation..excluding.taxicab...Estimate..AGE...60.years.and.over,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999,
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999,
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999,
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more)

# rename columns
# state
colnames(tidydata) <- gsub("Geography","state",colnames(tidydata))
# drove alone
colnames(tidydata) <- gsub("Car..truck..or.van....drove.alone..Estimate..Workers.","drovealone",colnames(tidydata))
colnames(tidydata) <- gsub("Car..truck..or.van....drove.alone..Estimate..AGE...","drovealone",colnames(tidydata))
colnames(tidydata) <- gsub("Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","drovealone",colnames(tidydata))
# carpool
colnames(tidydata) <- gsub("Car..truck..or.van....carpooled..Estimate..Workers.","carpooled",colnames(tidydata))
colnames(tidydata) <- gsub("Car..truck..or.van....carpooled..Estimate..AGE...","carpooled",colnames(tidydata))
colnames(tidydata) <- gsub("Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","carpooled",colnames(tidydata))
# public transportation
colnames(tidydata) <- gsub("Public.transportation..excluding.taxicab...Estimate..Workers.","publictrans",colnames(tidydata))
colnames(tidydata) <- gsub("Public.transportation..excluding.taxicab...Estimate..AGE...","publictrans",colnames(tidydata))
colnames(tidydata) <- gsub("Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","publictrans",colnames(tidydata))

colnames(tidydata) <- gsub("\\.","",colnames(tidydata))


# convert percentages to numeric, percentage by decimal
tidydata[3:8] <- sapply(tidydata[3:8],function(x) as.numeric(x)/100)
tidydata[10:15] <- sapply(tidydata[10:15],function(x) as.numeric(x)/100)
tidydata[17:22] <- sapply(tidydata[17:22],function(x) as.numeric(x)/100)
tidydata[24:31] <- sapply(tidydata[24:31],function(x) as.numeric(x)/100)
tidydata[33:40] <- sapply(tidydata[33:40],function(x) as.numeric(x)/100)
tidydata[42:49] <- sapply(tidydata[42:49],function(x) as.numeric(x)/100)

