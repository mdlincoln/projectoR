projectR
========

## Install

```r
# install.packages("devtools")
devtools::install_github("mdlincoln/projectoR")
```

## Usage

This function takes a table with an edge list, where the first two columns
describe the source and target vertices/nodes of multiple edges. It will
return an edge list of a projected network with the `joining_col`
vertices removed.

```r
library(projectoR)

bipartite_list <- data.frame(
  club = c("Karate", "Karate", "Book", "Chess", "Book", "Chess"),
  student = c(1, 2, 1, 3, 2, 4),
  stringsAsFactors = FALSE)

project_table(bipartite_list, joining_col = "club")
#>   from to weight
#> 1    1  2      2
#> 2    3  4      1

project_table(bipartite_list, joining_col = "student")
#>     from   to weight
#> 1 Karate Book      2
```

---
[Matthew Lincoln](http://matthewlincoln.net)

