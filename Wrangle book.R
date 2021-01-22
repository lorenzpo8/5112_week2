library(tidyverse)

vignette("tibble")

#5 x 3 tibble format

tibble(
  x = 1:5, 
  y = 1, 
  z = x ^ 2 + y
)



# non-syntactic names for tibble variables    //    should be surrounded by
#     backticks  `   //    tibbles are a Tidyverse package, but backticks needed
#        in other packages (ex. ggplot2, dplyr, tidyr)
tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)
tb



# tribble (transposed tibble) ex:      //      output format is coded within
#     data input lines  //   consistent spacing format as follows: --|--|----

tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)




# tibbles automatically only print 10 rows and all columns but it can be 
#     overridden w/ substituted print lines:      
#
#     print(n = 10, width = Inf)
# or
#     options(tibble.print_max = n, tibble.print_min = m)   "if more than n rows 
#        then print m rows"
# or
#     options(tibble.print_min = Inf)     to always show all rows
# or
#     options(tibble.width = Inf)      to always print all columns regardless of
#         screen width
# 
#
#
#
#   Subsetting:    [[]] extracts by name or position        $ extracts by name

df <- tibble(
  x = runif(5),
  y = rnorm(5)
)
df
# to extract by name
df$x
# or
df[["x"]]
# extract by position
df[[1]]
#
#
#
# Use special character placeholder   '.' to run in  pipe
df %>% .$x
# or
df %>% .[["x"]]
#
#
#
#
#
# convert tibble back to data.frame use function: as.data.frame()
#
as.data.frame(tb)
class(as.data.frame(tb))
class(tb)
#
#
#
#
# Tibble vs. Data.Frame exercises
#
df <- data.frame(abc = 1, xyz = "a")
df
df$x 
df[, "xyz"]
df[, c("abc", "xyz")]
#
#
annoying <- tibble(
`1` = 1:10,
`2` = `1` * 2 + rnorm(length(`1`))
)
annoying
#
#
#
# You can use col_names = FALSE to tell read_csv() not to treat the first row as 
#   headings
read_csv("1,2,3\n4,5,6", col_names = FALSE)


# specify col_names w/ function
read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))

read_csv("a:b\n1:3")


parse_date("01/21/2021", "%m/%d/%Y")

guess_parser(c("3", "6", "8"))
challenge <- read_csv(readr_example("challenge.csv"))


View(who)
who %>% 
    gather("codes", "n", 5:60) %>%
    select(-iso2, -iso3) %>%
    separate(codes, into = c('new', 'type', 'sexage'), sep = c(4,7) )%>%
    select (-new) %>%
    separate(sexage, into = c("sex", "age"), sep = 1 )%>%
    unite('sexage2', sex, age, sep = "=")
