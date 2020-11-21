---
aliases: [arm]
title: Outlier Detection
date: 2020-11-19T00:00:00
weight: 2
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: "Smart"
  preview_only: true
  
summary: Parallel Analysis tutorial and codes 

categories: []
tags:
- R
- Statistics

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

links:
- icon: images
  icon_pack: fas
  name: Technical Notes
  url: https://github.com/zhangou888/Outlier/tree/main/Notes
  
- icon: images
  icon_pack: fas
  name: R Code
  url: https://github.com/zhangou888/Outlier/tree/main/code
  
- icon: images
  icon_pack: fas
  name: Handout
  url: https://github.com/zhangou888/Outlier/tree/main/Handout

---


{{< figure src="featured.png" numbered="true" alt="Outlier detection" title="Outlier detection"
caption="" >}}

This repository contains all the useful resources (personal opinion) I have found during my outlier detection study and research.

I've spent a lot of words to discuss outlier detection philosophy and methods in my blogs. You can find these 4 blog posts below.

1. The philosophy of outliers ([part 1](/2020/11/02/outliers-part1/)) 
2. Outlier detection univariate methods ([part 2](/2020/11/03/outliers-part2/))
3. Outliers detection in regression ([part 3](/2020/11/09/outliers-part3/))
4. Outlier detection multivariate methods ([part 4](/2020/11/16/outliers-part4/))

Besides my blog articles, I put my [technical notes](https://github.com/zhangou888/Outlier/blob/main/Notes/remove_outlier.docx) in the 'Notes' folder for your information. In the meantime, all the relevant online sources and useful links are saved in the [EXCEL](https://github.com/zhangou888/Outlier/blob/main/Notes/Outliers.xlsx) file.
It includes multiple useful handouts and some valuable papers. You can find them in the 'Handout' folder.

Among all the materials, [William G. Jacoby's handout](https://github.com/zhangou888/Outlier/blob/main/Handout/regression/Outliers_William%20G.%20Jacoby.pdf) is worthy of special mention.

**A lot useful 'Outlier detection' R packages are available.** 

* [outliers](https://cran.r-project.org/web/packages/outliers/) is useful for the univariate outlier detection. it contains multiple statistical tests (i.e, 'grubbs', 'dixon').
* [EnvStats](https://cran.r-project.org/web/packages/EnvStats/index.html) has 'rosner test' (`rosnerTest`).
* [car](https://cran.r-project.org/web/packages/car/index.html) is super useful and it has a lot of wonderful functions for the outlier detection. 
The `outlierTest()` function from the {car} package gives the most extreme observation based on the given model and allows to test whether it is an outlier.
In addition, `car` package provides a series of graphing functions to plot outliers through `residualPlots`, `avPlots`, `qqPlot`, `influenceIndexPlot`. Among all these useful plot functions, the function-`influencePlot` deserves special mention. This function creates a bubble plot of Studentized residuals versus hat values, with the areas of the circles representing the observations proportional to the value Cook's distance.
Vertical reference lines are drawn at twice and three times the average hat value, horizontal reference lines at -2, 0, and 2 on the Studentized-residual scale. [x-axis: Hat-value (with cutoffs), Y-axis: studentized residual, size of bubble (Cook's D).]  
* [mvoutlier](https://cran.r-project.org/web/packages/mvoutlier/index.html) includes a variety of functions for the multivariate outlier detection.
* [DMwR](https://cran.r-project.org/web/packages/DMwR/index.html) has a useful function-`lofactor()` which obtains local outlier factors using the LOF algorithm. 
* [robustbase](https://cran.r-project.org/web/packages/robustbase/index.html) provides a higher level of multivariate outlider criteria calculation. For example, the function `covMcd` calculates Robust Location and Scatter Estimation via MCD.
* [performance](https://cran.r-project.org/web/packages/performance/index.html) offers one of the most multivariate outlier detection function-`check_outliers`. With different option keywords, this function is able to cover most of multivariate outlier detection criteria. You can find more details through the link below.
[check_outliers](https://www.rdocumentation.org/packages/performance/versions/0.5.1/topics/check_outliers)

In addition, I've listed all 9 useful R example scripts. These R scripts are great practice resources for you to understand the outlier detection process and some available methods. You can download them and practice on your local computer.       

* [General Outlier Detection](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis1.R)

* [Univariate Outliers Detection in R ](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis2.R)

* [Outlier Detection in Regression 1](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis3.R)

* [Outlier Detection in Regression 2](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis4.R)

* [Outlier Detection in Regression (Draw 95 CI)](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis5.R)

* [Outlier Detection in Regression 3](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis6.R)

* [Multivariate Outlier Detection 1](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis7.R)

* [Multivariate Outlier Detection 2](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis8.R)

* [Multivariate Outlier Detection 3-performance package](https://github.com/zhangou888/Outlier/blob/main/code/outlier_analysis9.R)