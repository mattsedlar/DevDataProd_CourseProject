library(dplyr)

# unzip data
if(!file.exists("data/ACS_14_1YR_S0804.csv")) {
unzip("data/ACS_14_1YR_S0804.zip",exdir="data")
}

# read in data
if(!exists("data")){
  data <- read.csv("data/ACS_14_1YR_S0804.csv",skip=1)
}

tidydata <- data

# selecting only columns necessary for calculations
tidydata <- tidydata %>% select(Geography,
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
colnames(tidydata) <- gsub("Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","drovealone",colnames(tidydata))
# carpool
colnames(tidydata) <- gsub("Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","carpooled",colnames(tidydata))
# public transportation
colnames(tidydata) <- gsub("Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","publictrans",colnames(tidydata))

colnames(tidydata) <- gsub("\\.","",colnames(tidydata))


# convert percentages to numeric, percentage by decimal
tidydata[3:10] <- sapply(tidydata[3:10],function(x) as.numeric(x)/100)
tidydata[12:19] <- sapply(tidydata[12:19],function(x) as.numeric(x)/100)
tidydata[21:28] <- sapply(tidydata[21:28],function(x) as.numeric(x)/100)