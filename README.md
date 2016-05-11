projectR
========

## Install

```r
# install.packages("devtools")
devtools::install_github("mdlincoln/projectoR")
```

## Usage

```r
bipartite_list <- data.frame(
  club = c("Karate", "Karate", "Book", "Chess", "Book", "Chess"),
  student = c(1, 2, 1, 3, 2, 4),
  stringsAsFactors = FALSE)

project_table(bipartite_list, joining_col = "club")
#>   from to weight
#> 1    1  2      2
#> 2    3  4      1
```

---
[Matthew Lincoln](http://matthewlincoln.net)

