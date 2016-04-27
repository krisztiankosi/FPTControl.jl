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

Kinematic Block

```
KB(n,lambda,errors,nominal)
```
in code:
```
errors=[error_int,h,h_p]
qDes_pp[i]=KB(3,Λ,errors,qN_pp[i])
```
Deformation functions

SISO case:

```
G_SISO(past_input,past_response,desired,Kc,Bc,Ac)
```

MIMO case:

```
G_MIMO(past_input,past_response,desired,Kc,Bc,Ac)
```

using SISO in code:

```
qDef_pp[i]=G_SISO(past_input,past_response,qDes_pp[i],K,B,A)
```

Simple Euler Integral (rectangle method)

```
Integ(Integral,step,input)
```

```
error_int=Integ(error_int,δt,h)
```

Complete example using this toolbox can be found [here](https://github.com/krisztiankosi/Control/blob/master/examples/RFPT_SISO/Duffing%20Oscillator%20with%20FPTControl%20Toolbox/Duffing_RFPT_with_FPTControl_v2.jl)

The model is a simple Duffing Oscillator.

Manual: soon
