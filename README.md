# Market_Basket_Analysis

This repository contains code that performs market basket analysis using the Apriori algorithm in R, along with visualization of the results using the `arulesViz` library.


## Introduction
Market basket analysis is a technique used to uncover associations and relationships among items in a dataset of transactions. It is commonly used in retail and e-commerce to understand customer purchasing patterns and make data-driven business decisions.

## Data
The analysis uses a market basket dataset (`Market_basket_dataset_B.csv`) that contains information about customer transactions. The dataset is read into R using the `read.csv` function from the `readxl` library.

## Market Basket Analysis
The code performs the following steps for market basket analysis:

1. The dataset is transformed into a transaction format suitable for market basket analysis using the `str_split_fixed` function from the `stringr` library.
2. Various exploratory analyses are performed, such as checking the number of products in the largest basket, the number of baskets, and the number of unique items.
3. Item frequency analysis is conducted to determine the relative and absolute frequency of items in the dataset.
4. Association rules are generated using the Apriori algorithm from the `arules` library, with specified support and confidence thresholds.
5. The generated rules are sorted and inspected based on their confidence values.
6. Further applications of the Apriori algorithm are demonstrated, including filtering rules based on specific itemsets and performing association rules with different default and right-hand side (rhs) items.
7. The resulting rules are sorted and inspected, and some of the top rules are displayed.

## Visualization
The `arulesViz` library is utilized for visualizing the association rules. The code includes examples of generating different types of plots, such as item frequency plots and a graph-based visualization of the rules.

Please note that this readme file only explains the purpose and steps involved in the code. For a detailed understanding of the code implementation, refer to the code file itself.
