---
title       : Finding the Discarded Digit
subtitle    : An Exposition
author      : Andrea Liang
job         : 
framework   : io2012        
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---

## The Game

1. Think of any four-digit number, call this $X$ (e.g. $X = 1234$)
2. Sum the digits of $X$ and call this $Y$ (e.g. $Y = 1 + 2 + 3 + 4 = 10$)
3. Discard a non-zero digit from $X$ to get a three-digit number $Z$ (e.g. if you discard the number $2$, we have $Z = 134$)

Enter the number $Z - Y$ into the app, and the app will tell you the digit you discarded in Step 3. It's magic! 

--- 

## How in the world does this app work!? 

This app relies on the properties of the number $9$. 

It's easy to observe that every power of $10$ -- $10$, $100$, $1,000$ etc. -- gives a remainder of $1$ when divided by $9$. The notation for this is 
$$10^n \equiv 1\mod{9}$$
(where $1\mod{9}$ means that the number leaves a remainder of $1$ when divided by $9$).

If we multiply both sides of this equation by $x$, we have 
$$x(10^n) \equiv x\mod{9}$$

The fact that this is a generalisable rule is not immediately apparent, but we can see that it works in this case. As an example, 
$$99 * 2 = (100-1) * 2 = 200 - 2$$ 
i.e. you will always get a remainder of $x$ when you divide $x(10^n)$ by $9$. 

---

## I still don't know how the app works

Say we have a four-digit number $abcd$. This is actually $a(10^3) + b(10^2) + c(10^1) + d(10^0)$. 

Consider 
$$a(10^4) + b (10^3) + c(10^2) + d(10) - (a + b + c + d)$$

From the last page, we see that this should be divisible by $9$ (since $a(10^4) - a \equiv a\mod{9} - a\mod{9} \equiv 0\mod{9}$ etc.). 

This is in fact more or less what the game asks you to do. However, the game first asks you to remove a digit from the four-digit number $X$, before asking you to subtract the sum of the digits ($Y$) from the remaining three-digit number ($Z$). 

This means that the number that you end up giving me ($Z - Y$) is the removed digit away from being divisible by $9$. If, however, the number $Z - Y$ is divisible by $9$, this means that you removed the digit $9$ (this is why the trick doesn't work if you remove the digit $0$, because I wouldn't be able to tell if you removed a $0$ or a $9$).

---

## An example

So suppose you thought of the number $1234$. The sum of the digits is $10$. You then decided to remove the digit $2$, leaving you with $134$. You then input the number $134 - 10 = 124$ into the app, which does this:  


```r
9 - 124%%9 ## the '%%' indicates x mod y
```

```
## [1] 2
```
