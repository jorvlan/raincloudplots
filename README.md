# raincloudplots <img src="https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/rainclouds_highres.png" width="150" height="160" align="right"/>

<!---[![R-CMD-check](https://github.com/jorvlan/raincloudplots/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jorvlan/raincloudplots/actions/workflows/R-CMD-check.yaml)--->
![development version](https://img.shields.io/badge/version-0.2.0-blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/jorvlan/raincloudplots/blob/main/LICENSE)
[![CRAN status](https://www.r-pkg.org/badges/version/raincloudplots)](https://CRAN.R-project.org/package=raincloudplots)



If you use this package for your research, please cite it, thank you.

**Paper**
<pre>
- Allen, M., Poggiali, D., Whitaker, K., Marshall, T. R., van Langen, J., & Kievit, R. A.
    Raincloud plots: a multi-platform tool for robust data visualization [version 2; peer review: 2 approved] 
    <b>Wellcome Open Research</b> 2021, 4:63. <a href="https://doi.org/10.12688/wellcomeopenres.15191.2">https://doi.org/10.12688/wellcomeopenres.15191.2</a>
</pre>

### Background

It all started with the [pre-print of raincloudplots](https://wellcomeopenresearch.org/articles/4-63) in 2019 and accompanying [GitHub repository RainCloudPlots](https://github.com/RainCloudPlots/RainCloudPlots). In the beginning of 2020, a tutorial called [‘open-visualizations’](https://github.com/jorvlan/open-visualizations) was released and turned out to be a valuable addition to the previously published pre-print. This tutorial provides detailed and extensive R code to create robust and transparent repeated measures visualizations, by showing the slope change for each individual data point over time. To date (13-01-2021), this tutorial has been cited in 20 scientific papers. However, using this tutorial requires sufficient R programming knowledge and might therefore not be suitable for non-R experts. Therefore, we have created this dedicated [raincloudplots](https://github.com/jorvlan/raincloudplots) package. This package is tailored towards easy visualization of grouped and repeated measures data. Moreover, it also provides individually linked repeated measures visualizations, which add detail and richness to a multitude of between/within-subject designs. 

### Package demonstration

- Tested on macOS with R version >= 4.0.3
- Tested on Windows with R version >= 4.0.3
- Researchers that would like to visualize more complex repeated measures designs, for instance with more groups and more time-points, please see our extensive tutorials:
    - <a href="https://github.com/jorvlan/open-visualizations">https://github.com/jorvlan/open-visualizations</a> 
    - <a href="https://github.com/RainCloudPlots/RainCloudPlots">https://github.com/RainCloudPlots/RainCloudPlots</a>

### Updates 

<pre>
- <b> January 2024</b>
    We have written a ggplot2-extension R-package [ggrain](https://github.com/njudd/ggrain) which allows users to create Raincloud plots - following the 'Grammar of Graphics'. Please visit our [`ggrain`](https://github.com/njudd/ggrain) package.
- <b>February 2021 (version 0.2.0)</b>
It is now possible to make raincloudplots with unequal 'between-group' comparisons (e.g., group1: 50 data-points, group2: 40 data-points)
This is not possible for 'repeated-measures' between-timepoints (e.g., pre-post) connected by intra-individual lines `raincloudplots`.
</pre>

### Installation

```r
if (!require(remotes)) {
    install.packages("remotes")
}
remotes::install_github('jorvlan/raincloudplots')

library(raincloudplots)

```
### Raincloud 1 x 1

Step 1: Initialize the data-format
  - `data_1x1` creates the long-format data.frame that is needed for 1-by-1 rainclouds.
  - `array_1` the first array of datapoints to be plotted
  - `array_2` the second array of datapoints to be plotted
  - `jit_distance` the amount of distance between jittered datapoints (0.9 by default)
  - `jit_seed` the amount used in set.seed() (321 by default)

```r
df_1x1 <- data_1x1(
  array_1 = iris$Sepal.Length[1:50],
  array_2 = iris$Sepal.Length[51:100],
  jit_distance = .09,
  jit_seed = 321)
```  
```r
> head(df_1x1)
  y_axis x_axis id       jit
1    5.1      1  1 1.0820609
2    4.9      1  2 1.0787114
3    4.7      1  3 0.9528797
4    4.6      1  4 0.9559133
5    5.0      1  5 0.9802922
6    5.4      1  6 0.9714124
> tail(df_1x1)
    y_axis x_axis id      jit
95     5.6      2 45 2.059387
96     5.7      2 46 2.004848
97     5.7      2 47 2.066980
98     6.2      2 48 2.074479
99     5.1      2 49 1.939248
100    5.7      2 50 1.999004
```

Step 2: Create a vertical or horizontal 1 x 1 raincloudplot

  - `raincloud_1x1` creates the 1-by-1 comparison for grouped data.
  - `data` the data.frame created with `data_1x1`
  - `colors` concatenated string for both colors
  - `fills` concatenated string for both both fills
  - `size` size of the data 
  - `alpha` alpha of the data
  - `ort` vertical or horizontal display of rainclouds
```r
raincloud_1_h <- raincloud_1x1(
  data = df_1x1, 
  colors = (c('dodgerblue','darkorange')), 
  fills = (c('dodgerblue','darkorange')), 
  size = 1, 
  alpha = .6, 
  ort = 'h') +

scale_x_continuous(breaks=c(1,2), labels=c("Group1", "Group2"), limits=c(0, 3)) +
  xlab("Groups") + 
  ylab("Score") +
  theme_classic()

raincloud_1_h
```
![Raincloud example](https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/fig_1.png)

```r
raincloud_1_v <- raincloud_1x1(
  data = df_1x1, 
  colors = (c('dodgerblue','darkorange')), 
  fills = (c('dodgerblue','darkorange')), 
  size = 1, 
  alpha = .6, 
  ort = 'v') +

scale_x_continuous(breaks=c(1,2), labels=c("Group1", "Group2"), limits=c(0, 3)) +
  xlab("Groups") + 
  ylab("Score") +
  theme_classic()

raincloud_1_v
```
![Raincloud example](https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/fig_2.png)

### Raincloud 1 x 1 repeated measures

  - `raincloud_1x1_repmes` creates a 1-by-1 repeated measures raincloud.
  - `data` the data.frame created with `data_1x1`
  - `colors` concatenated string for both colors
  - `fills`  concatenated string for both fills
  - `line_color` color of the lines
  - `line_alpha` alpha of the lines
  - `size` size of the data
  - `alpha` alpha of the data
  - `align_clouds` FALSE if spreaded on different x-axis ticks, TRUE if aligned on same x-axis tick

```r
raincloud_2 <- raincloud_1x1_repmes(
  data = df_1x1,
  colors = (c('dodgerblue', 'darkorange')),
  fills = (c('dodgerblue', 'darkorange')),
  line_color = 'gray',
  line_alpha = .3,
  size = 1,
  alpha = .6,
  align_clouds = FALSE) +
 
scale_x_continuous(breaks=c(1,2), labels=c("Pre", "Post"), limits=c(0, 3)) +
  xlab("Time") + 
  ylab("Score") +
  theme_classic()

raincloud_2
```
![Raincloud example](https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/fig_3.png)

```r
raincloud_2_aligned <- raincloud_1x1_repmes(
  data = df_1x1,
  colors = (c('dodgerblue', 'darkorange')),
  fills = (c('dodgerblue', 'darkorange')),
  line_color = 'gray',
  line_alpha = .3,
  size = 1,
  alpha = .6,
  align_clouds = TRUE) +
 
scale_x_continuous(breaks=c(1,2), labels=c("Pre", "Post"), limits=c(0, 3)) +
  xlab("Time") + 
  ylab("Score") +
  theme_classic()

raincloud_2_aligned
```
![Raincloud example](https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/fig_4.png)

### Raincloud 2 x 2 repeated measures

Step 1: Initialize the data-format

  - `data_2x2` creates the long-format data.frame needed for 2 x 2 repeated measures rainclouds.
  - `array_1` the first array of datapoints to be plotted
  - `array_2` the second array of datapoints to be plotted
  - `array_3` the array of datapoints to be plotted
  - `array_4` the array of datapoints to be plotted
  - `array_5` the array of datapoints to be plotted (OPTIONAL: only needed for 2x3 repeated measures, see below)
  - `array_6` the array of datapoints to be plotted (OPTIONAL: only needed for 2x3 repeated measures, see below)
  - `labels` concatenated string of both group labels
  - `spread_x_ticks` FALSE if 2 x-ticks, TRUE if 4 x-ticks
  - `jit_distance` the amount of distance between jittered datapoints (0 by default)
  - `jit_seed` the amount used in set.seed() (321 by default)

```r
df_2x2 <- data_2x2(
  array_1 = iris$Sepal.Length[1:50],
  array_2 = iris$Sepal.Length[51:100],
  array_3 = iris$Sepal.Length[101:150],
  array_4 = iris$Sepal.Length[81:130],
  labels = (c('congruent','incongruent')),
  jit_distance = .09,
  jit_seed = 321,
  spread_x_ticks = FALSE) 
```
```r
> head(df_2x2)
  y_axis x_axis id     group       jit
1    5.1      1  1 congruent 1.0820609
2    4.9      1  2 congruent 1.0787114
3    4.7      1  3 congruent 0.9528797
4    4.6      1  4 congruent 0.9559133
5    5.0      1  5 congruent 0.9802922
6    5.4      1  6 congruent 0.9714124
> tail(df_2x2)
    y_axis x_axis id       group      jit
195    6.7   2.01 45 incongruent 2.056353
196    7.2   2.01 46 incongruent 1.975210
197    6.2   2.01 47 incongruent 2.011292
198    6.1   2.01 48 incongruent 2.013551
199    6.4   2.01 49 incongruent 1.961014
200    7.2   2.01 50 incongruent 2.086574
```

```r
df_2x2_spread <- data_2x2(
  array_1 = iris$Sepal.Length[1:50],
  array_2 = iris$Sepal.Length[51:100],
  array_3 = iris$Sepal.Length[101:150],
  array_4 = iris$Sepal.Length[81:130],
  labels = (c('congruent','incongruent')),
  jit_distance = .09,
  jit_seed = 321,
  spread_x_ticks = TRUE) 
```
```r
> head(df_2x2_spread)
  y_axis x_axis id     group       jit
1    5.1      1  1 congruent 1.0820609
2    4.9      1  2 congruent 1.0787114
3    4.7      1  3 congruent 0.9528797
4    4.6      1  4 congruent 0.9559133
5    5.0      1  5 congruent 0.9802922
6    5.4      1  6 congruent 0.9714124
> tail(df_2x2_spread)
    y_axis x_axis id       group      jit
195    6.7      4 45 incongruent 4.046353
196    7.2      4 46 incongruent 3.965210
197    6.2      4 47 incongruent 4.001292
198    6.1      4 48 incongruent 4.003551
199    6.4      4 49 incongruent 3.951014
200    7.2      4 50 incongruent 4.076574
```


Step 2: Create a raincloud plot with 4 x-ticks or with 2 x-ticks

```r
raincloud_2x2 <- raincloud_2x2_repmes(
  data = df_2x2,
  colors = (c('dodgerblue', 'darkorange', 'dodgerblue', 'darkorange')),
  fills = (c('dodgerblue', 'darkorange', 'dodgerblue', 'darkorange')),
  size = 1,
  alpha = .6,
  spread_x_ticks = FALSE) +

scale_x_continuous(breaks=c(1,2), labels=c("Pre", "Post"), limits=c(0, 3)) +
  xlab("Time") + 
  ylab("Score") +
  theme_classic()

raincloud_2x2
```
![Raincloud example](https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/fig_5.png)

```r
raincloud_2x2_spread <- raincloud_2x2_repmes(
  data = df_2x2_spread,
  colors = (c('dodgerblue', 'darkorange', 'dodgerblue', 'darkorange')),
  fills = (c('dodgerblue', 'darkorange', 'dodgerblue', 'darkorange')),
  line_color = 'gray',
  line_alpha = .3,
  size = 1,
  alpha = .6,
  spread_x_ticks = TRUE) +

scale_x_continuous(breaks=c(1,2,3,4), labels=c("Pre", "Post", "Pre", "Post"), limits=c(0, 5)) +
  xlab("Time") + 
  ylab("Score") +
  theme_classic()

raincloud_2x2_spread
```
![Raincloud example](https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/fig_6.png)

### Raincloud 2 x 3 (repeated measures)

Step 1: Initialize the data-format

```r
df_2x3 <- data_2x2(
  array_1 = iris$Sepal.Length[1:50],
  array_2 = iris$Sepal.Length[51:100],
  array_3 = iris$Sepal.Length[101:150],
  array_4 = iris$Sepal.Length[81:130],
  array_5 = iris$Sepal.Length[21:70],
  array_6 = iris$Sepal.Length[41:90],
  labels = (c('congruent','incongruent')),
  jit_distance = .05,
  jit_seed = 321) 
```
```r
> head(df_2x3)
  y_axis x_axis id     group       jit
1    5.1      1  1 congruent 1.0455894
2    4.9      1  2 congruent 1.0437286
3    4.7      1  3 congruent 0.9738220
4    4.6      1  4 congruent 0.9755074
5    5.0      1  5 congruent 0.9890512
6    5.4      1  6 congruent 0.9841180
> tail(df_2x3)
    y_axis x_axis id       group      jit
295    5.4   3.01 45 incongruent 3.055610
296    6.0   3.01 46 incongruent 3.047695
297    6.7   3.01 47 incongruent 3.058535
298    6.3   3.01 48 incongruent 3.005049
299    5.6   3.01 49 incongruent 2.978512
300    5.5   3.01 50 incongruent 2.967493
```
Step 2: Create a vertical or horizontal 2 x 3 Raincloud 

```r
raincloud_2x3_vertical <- raincloud_2x3_repmes(
  data = df_2x3,
  colors = (c('dodgerblue', 'darkorange', 'dodgerblue',
              'darkorange', 'dodgerblue', 'darkorange')),
  fills = (c('dodgerblue', 'darkorange', 'dodgerblue',
             'darkorange', 'dodgerblue', 'darkorange')),
  size = 1,
  alpha = .6,
  ort = 'v') +

scale_x_continuous(breaks=c(1,2,3), labels=c("T-1", "T-2", "T-3"), limits=c(0, 4)) +
  xlab("Time") + 
  ylab("Score") +
  theme_classic()

raincloud_2x3_vertical
```
![Raincloud example](https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/fig_7.png)

```r
raincloud_2x3_horizontal <- raincloud_2x3_repmes(
  data = df_2x3,
  colors = (c('dodgerblue', 'darkorange', 'dodgerblue',
              'darkorange', 'dodgerblue', 'darkorange')),
  fills = (c('dodgerblue', 'darkorange', 'dodgerblue',
             'darkorange', 'dodgerblue', 'darkorange')),
  size = 1,
  alpha = .6,
  ort = 'h') +

scale_x_continuous(breaks=c(1,2,3), labels=c("T-1", "T-2", "T-3"), limits=c(0, 4)) +
  xlab("Time") + 
  ylab("Score") +
  theme_classic()

raincloud_2x3_horizontal
```
![Raincloud example](https://github.com/jorvlan/open-visualizations/blob/master/R/package_figures/fig_8.png)

