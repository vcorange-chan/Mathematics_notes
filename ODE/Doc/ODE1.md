# 1. What is differential equation?

Our study is the following differential equation 

$$
\tag{1.1.1} 

\frac{d\bar x}{dt} = f(t, \bar x)
$$

where $f: I \times \Omega \rightarrow R^n$, $I$ a subinterval of $R$. $x \in \Omega$, $t \in I$. 

## Explaination:

Let’s imagine a physical scenario; the form of the equation for this problem will become very easy to understand.

$\bar x$ denotes the `displacement`, $t$ is `time`, $\frac{d\bar x}{dt}$ is `velocity` as $v$ in physics. Because `velocity` is determined by `time` and `displacement`, we can also write $v$ as $f(t, \bar x)$. 



Our goal is solving the equation when we already know the  `velocity` but dont know the `displacement`.  For example, to predict the path of a typhoon, the typhoon's movement speed has already been detected, and we need to solve for its position tomorrow. 



# 2. What is Initial Value Problem?

**Definition 1.1.1** The Initial Value Problem (IVP) corresponding to Eq. (1.1.1) is given by 

$$
\frac{d\bar{x}}{dt} = f(t, \bar{x}(t))  \\

\bar{x}(t_0) = \bar{x}_0 
$$

Actually, equation (1.1.1)  has infinitely many solution. Like both a typhon near Taiwan and a Hurricane on Atlantic Ocean have same velocity $f(t, \bar x )$ , but different positions. This is the motivation for specifying the initial value $\bar x(t_0)=\bar x_0$. 



$t_0$ denote the initial time, $\bar x_0$ is the initial position.  (Note: displacement $\bar x $ is a vector)



![IVPCh1_1](file:///C:/Users/1/Documents/Documents/Mathematics_notes/ODE/JuliaCode/Ch1_IVP.svg)










