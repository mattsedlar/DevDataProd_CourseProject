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
tidydata <- tidydata %>% select(Geography, #1
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings, #2
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss, #3
                                Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss, #4
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999, #5
                                Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999, #6
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999, #7
                                Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999, #8
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999, #9
                                Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999, #10
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999, #11
                                Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999, #12
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999, #13
                                Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999, #14
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999, #15
                                Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999, #16
                                Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more, #17
                                Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more, #18
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings, #19
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss, #20
                                Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss, #21
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999, #22
                                Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999, #23
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999, #24
                                Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999, #25
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999, #26
                                Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999, #27
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999, #28
                                Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999, #29
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999, #30
                                Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999, #31
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999, #32
                                Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999, #33
                                Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more, #34
                                Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more, #35
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings, #36
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss, #37
                                Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....1.to..9.999.or.loss, #38
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999, #39
                                Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....10.000.to..14.999, #40
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999, #41
                                Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....15.000.to..24.999, #42
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999, #43
                                Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....25.000.to..34.999, #44
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999, #45
                                Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....35.000.to..49.999, #46
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999, #47
                                Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....50.000.to..64.999, #48
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999, #49
                                Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....65.000.to..74.999, #50
                                Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more, #51
                                Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.16.years.and.over.with.earnings....75.000.or.more) #52

# rename columns
# state
colnames(tidydata) <- gsub("Geography","state",colnames(tidydata))
# drove alone
colnames(tidydata) <- gsub("Car..truck..or.van....drove.alone..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","drovealone",colnames(tidydata))
colnames(tidydata) <- gsub("Car..truck..or.van....drove.alone..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","drovealonemargin",colnames(tidydata))

# carpool
colnames(tidydata) <- gsub("Car..truck..or.van....carpooled..Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","carpooled",colnames(tidydata))
colnames(tidydata) <- gsub("Car..truck..or.van....carpooled..Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","carpooledmargin",colnames(tidydata))

# public transportation
colnames(tidydata) <- gsub("Public.transportation..excluding.taxicab...Estimate..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","publictrans",colnames(tidydata))
colnames(tidydata) <- gsub("Public.transportation..excluding.taxicab...Margin.of.Error..EARNINGS.IN.THE.PAST.12.MONTHS..IN.2014.INFLATION.ADJUSTED.DOLLARS..FOR.WORKERS...Workers.","publictransmargin",colnames(tidydata))

colnames(tidydata) <- gsub("\\.","",colnames(tidydata))


# convert percentages to numeric, percentage by decimal
tidydata[3:18] <- sapply(tidydata[3:18],function(x) as.numeric(x)/100)
tidydata[20:35] <- sapply(tidydata[20:35],function(x) as.numeric(x)/100)
tidydata[37:52] <- sapply(tidydata[37:52],function(x) as.numeric(x)/100)