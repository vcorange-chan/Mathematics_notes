# 1. What is differential equation and solution?

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
\tag{IVP-1.1.1}
\frac{d\bar{x}}{dt} = f(t, \bar{x}(t))  \\

\bar{x}(t_0) = \bar{x}_0 
$$

Actually, equation (1.1.1)  has infinitely many solution. Like both a typhon near Taiwan and a Hurricane on Atlantic Ocean have same velocity $f(t, \bar x )$ , but different positions. This is the motivation for specifying the initial value $\bar x(t_0)=\bar x_0$. 



$t_0$ denote the initial time, $\bar x_0$ is the initial position.  (Note: displacement $\bar x $ is a vector)



![IVPCh1_1](file:///C:/Users/1/Documents/Documents/Mathematics_notes/ODE/JuliaCode/Ch1_IVP.svg)



# 3. Definition of Solution

**Definition 1.1.2:** A function $\bar x(t)$ is said to be a solution of the *IVP-1.1.1* if $\exist J \sub I$, containing $t_0$ such that $\bar x(t)$ is differentiable on $J$ with $\bar x(t) \in \Omega$ for all $t \in J$ and $\bar x(t)$ satisfies Eq. (1.1.1)



- If $\bar x(t)$ is not differentiable on $J$, the equation $\frac{d\bar x}{dt}$ doesn't make sense. 

- Why restrict the interval to $J$ instead of the entire $I$ ? Because the initial value $t_0$ can only guarantee a local solution. 

## Counterexample 1.

Consider the differential equation 

$$
\frac{dx}{dt}=x^2
$$

with $x(0)=1$. The solution is $x(t)=\frac{1}{1-t}$, which is only valid for $t<1$.  For $t >1$, $x(t)$ can not be negative. 

## Recall: Fundamental Theorem of Caculus

### Proposition 1.1.1

Assume that $f: I \times \Omega \rightarrow R^n$ is continuous. 

$\bar x(t)$ is a solution of the IVP-1.1.1 if and only if 

$$
\tag{1.1.2}
\bar x(t) = \bar x_0 + \int_{t_0}^tf(s, \bar x(s))ds, t\in J
$$






# 4. The Existence of Solution

From the previous counterexample 1. , we found that sometimes a solution does not exist. How large should $J$ be chosen? When does a solution exist and when does it not? These are the questions we need to address next. 



## Theorem 3.1.1 Existence and Uniqueness Theorems

Let $E = I \times \Omega \subseteq R \times R^n$ be an <u>open set</u> containing $(t_0, \bar x_0)$ 

and let $f: E \mapsto R^n$ be continuous. 

Further assume that $\bar x \mapsto f(t, \bar x)$ is Lipschitz continuous. 

Then the IVP given by IVP-1.1.1 has a unique solution. 



**Recall:**

We need to recall `open set` induced by metric space, vector space, etc. , `continuous`,`Lipschitz continuous`. 





**standard uniqueness theorem** in the context of differential equations is often referred to as the **Picard-Lindelöf Theorem**



We need to recall some knowledge. 



### Vector Space, Inner product, Norm space, Metric space, Open ball/Closed ball, Open set/Closed set

In the note, we dont discuss the motivation of vector space, that what we did in linear algebra. 

**Definition 2.1.1:**

- Vector Space: 
  
  Vector space $X$ is a nonempty set,  which is closed with respect to binary operation $\bar x + \bar y(\bar x, \bar y \in X)$ and scalar multiplication $\alpha \bar x(\alpha \in F, \bar x \in X)$. 
  
  such that the following properties hold:
  
  - additive commutativity
    
    $\bar x + \bar y = \bar y+ \bar x$ for all $\bar x, \bar y \in X$; 
  
  - additive associativity
    
    $(\bar x + \bar y) + \bar z = \bar x + (\bar y + \bar z)$ for all $\bar x, \bar y, \bar z \in X$;
  
  - additive identity
    
    $\exist 0 \in X$, such that $\bar x + 0 = \bar x$ for all $\bar x \in X$; 
  
  - additive inverse
    
    for every $\bar x \in X$, $\exist (- \bar x) \in X$ such that $\bar x+(-\bar x)=0$;
  
  - multiplicative associativity
    
    $\alpha(\beta \bar x)=(\alpha \beta)\bar x$ for all $\alpha, \beta \in F$ and $\bar x \in X$;
  
  - muliplicative identity
    
    $1 \bar x = \bar x$ for all $\bar x \in R$;
  
  - distributive properties
    
    $a(\bar x + \bar y)= a\bar x + a \bar y$ and $(a + b)\bar x = a \bar x+b \bar y$ for all $a, b \in F$ and $\bar x, \bar y \in X$

**Definition 2.1.2:**

The motivation for studying inner products is to describe the magnitude and angle in vector spaces.

For the magnitude, it is always positive, like the length, weight. Thus inner product has the property: **positivity, definiteness**; 

In physics, dot product describes the magnitude of the influence one vector has on another, like the work $W$, force $F$, and distance $d$, $W = F\cdot d = \|F\| \|d\| \cos<F, d>$.  Obviously, according to the rules of composition and decomposition of forces, we can naturally know dot product operation is linearity, thus we can conclude **additivity in first slot, homogeneity in first slot**. (Total work is equatl to sum of each decomposed work)

Consider complex number, conclude **conjugate symmetry**. 



- Inner product :
  
  An inner product on $V$ is a function that takes each ordered pair $(u, v)$ of elements of $V$ to a number $<u, v> \in F$ and has the following properties:
  
  - positivity
    
    $\langle v,v\rangle \ge 0$ for all $v \in V$;
  
  - definiteness
    
    $\langle v, v \rangle = 0$ if and only if $v = 0$;
  
  - additivity in first slot
    
    $\langle u+v, w\rangle = \langle u, w \rangle + \langle v, w \rangle$ for all $u, v, w \in V$; 
  
  - homogeneity in first slot
    
    $\langle \lambda u, v \rangle = \lambda \langle u,v\rangle $ for all $\lambda \in F$ and all $u, v \in V$;
  
  - conjugate symmetry
    
    $\langle u, v \rangle = \overline {\langle v, u \rangle}$ for all $u, v \in V$. 

- Inner product space:
  
  An inner product space is a vector space $V$ along with an inner product on $V$

**Definition 2.1.3:**

In mathematics, a **norm** is a function that assigns a non-negative real number to a vector in a vector space, which intuitively represents the "size" or "length" of the vector. Norms generalize the concept of length from Euclidean spaces to more abstract vector spaces, including infinite-dimensional spaces such as function spaces.

For some other spaces like [**non-Euclidean space**](https://encyclopediaofmath.org/wiki/Non-Euclidean_space), we have other definition to measure the "size", Some definitions related to curvature, which can be as counterexample of Triangle Inequality for norm. Hence we must notice that normed space is a vector space! 



- Normed space:
  
  A vector space $X$ is a normed space if there exists a function $\|\bar x\|: X \mapsto R$ such that the following properties hold
  
  -  positiveness and non-degenerate
    
    $\|x\| \ge 0$  for all $\bar x \in X$ and $\|\bar x\|=0$ if and only if $\bar x = 0$. 
  
  - [Absolute homogeneity](https://en.wikipedia.org/wiki/Homogeneous_function "Homogeneous function")
    
    $\|\alpha \bar x\| = |\alpha| \|\bar x\|$ for all $\bar x \in X$ and $\alpha \in R$. 
  
  - [Subadditivity](https://en.wikipedia.org/wiki/Subadditive_function)/[Triangle inequality](https://en.wikipedia.org/wiki/Triangle_inequality "Triangle inequality"):
    
    $\|\bar x + \bar y\|\le \|\bar x\| + \|\bar y\|$ for all $\bar x, \bar y \in X$. 

- Norm in an inner product space:
  
  $\|\bar x\| ^2 = \langle\bar x, \bar x \rangle$. 

Actually, we have a definition of seminorm, which can become degenerated norm. 

**Definition 2.1.4:**

Norm focus on the "size" or "length" for one point. Distance is the "size" between two points. 

- Metric Space:
  
  A metric space $X$ is a non-empty set with a metrix $d: X \times X \mapsto R$ ,  $d$ satisfies the properties:
  
  - Positivity:
    
    $d(\bar x, \bar y) \ge 0$ for all $\bar x, \bar y \in X$ and $d(\bar x, \bar y)=0$ if and only if $\bar x = \bar y$; 
  
  - Symmetry:
    
    $d(\bar x, \bar y) = d(\bar y, \bar x)$; for all $\bar x, \bar y \in X$
  
  - Triangle Inequality:
    
    $d(\bar x, \bar z) \le d(\bar x, \bar y) + d(\bar y, \bar z)$ for all $\bar x, \bar y, \bar z \in X$

Notice, a metric space is a non-empty set. 



**Definition 2.1.4.1:**

-  Open Ball:
  
  Let $(M, d)$ be a metric space, namely a set $M$ with a metric $d$, and let $r\gt 0 \in R$. The open ball of radius $r$ centered at a point $p \in M $, denoted by $B_r(p)$ is 
  
  $$
  B_r(p) = \{x \in M | d(x, p) \lt r \}  
  $$

- Closed Ball:
  
  $$
  B_r[p] = \{x \in M | d(x, p) \le r \}  
  $$
  
  







https://poe.com/s/ncdPuKuzYf9YfzvloTAr


