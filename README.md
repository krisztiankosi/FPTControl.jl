# FPTControl

[![Build Status](https://travis-ci.org/krisztiankosi/FPTControl.svg?branch=master)](https://travis-ci.org/krisztiankosi/FPTControl)

Fixed Point Transformation Based Control

Some examples can be found on my Control github repo.
https://github.com/krisztiankosi/Control

The Original article for this method is in [Acta Polytechnica Hungarica](http://uni-obuda.hu/journal) published by [Óbuda University](https://www.uni-obuda.hu)
It is an Open Access Journal, IF for 2014: 0.649
[Robust Fixed Point Transformations in Adaptive Control Using Local Basin of Attraction](http://uni-obuda.hu/journal/Tar_Bito_Nadai_Machado_17.pdf)


##Usage examples

If we see a 2nd order system,

```KB(n,lambda,errors,nominal)```
compute the
$$ (\frac{d}{dt}+\Lambda)^{n+1}error_integral$$
