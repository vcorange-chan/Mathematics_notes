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



## Proof:

Let $B$ denote a closed ball with center at $(t_0, \bar x_0)$ and contained in $E$. 

Let $m = \underset {(t,\bar x)\in B}{sup} |f(t, \bar x)|$. 

$m$ is finite as $f$ is continuous on a compact set $B \subseteq I \times R ^n$. 

Choose two positive number $\delta$ and $\tau$ such that $M \tau \lt 1, m\tau \lt \delta$ and 

$$
\{(t, \bar x) \in I \times R^n:|t-t_0|\le \tau, \|\bar x - \bar x_0\|\leq \delta\} \subseteq B
$$

Denote by $J = [t_0-\tau, t_0+\tau]$ and $\Omega_0 = \{\bar x \in \Omega: \|\bar x- \bar x_0\|\le \delta\}$. 

Define $X\subset C(J)$ to be set of all continuous functions on $J$ with values in $\Omega_0 \subseteq \Omega$. Then $X$ is a closed subset of $C(J)$ and hence a complete metric space with metric induced by the sup-norm of $C(J)$. 

![759a6dbf-db6f-43b6-babb-a5ec8bcf9695](file:///C:/Users/1/Documents/Documents/Mathematics_notes/ODE/JuliaCode/Ch1_ExistenceAndUniquenessTheorem.png)

We define a nonlinear operator $F$ on $X$ as follows

$$
\tag{3.1.4}
[F\bar x](t) = \bar x_0 + \int_{t_0}^t f(s, \bar x(s))ds, t\in J
$$

It is clear that $F\bar x$ is a continuous function defined on $J$. Also, 

$$
\|[F\bar x](t)-\bar x_0\|_{R^n} = \|\int_{t_0}^{t}f(s, \bar x(s))ds\|_{R^n} \le \int_{t_0}^{t}\|f(s, \bar x(s))\|_{R^n}ds \le m \int_{t_0}^{t}ds \le m \tau \le \delta
$$

This implies that $[F \bar x] \in \Omega_0, \forall t \in J$ and hence $F$ maps $X$ into itself. 



Note: This step above proves the existence of the solutions near $(t_0, x_0)$, which means at the neighboorhood of $(t_0, x_0)$, there exists a curve $[F\bar x](t)$, we can  predict the behavour of the $F\bar x $ from the point $x_0$, like the geometrical meaning of continuous functions, predicting next step points from the current point. 

The initial condition $\bar x(t_0) = x_0$ only represents one point solution at $t_0$ as $(t_0, x_0)$, but if the equation satisfies conditions of Existence and Uniqueness theorem, we are able to "plot"  at least one "curve" as approxiamate "solution curves" near $(t, x_0)$

Review the (3.1.4), $t \in J$ and $J$ is an interval. Here we use the condition $E$ is an open set, and $f: E\rightarrow R^n$ is continuous, proving the existence of soluitons. 

Next, we want to make sure whether the solution is unique. 

















**Recall:**

We need to recall `open set` induced by metric space, vector space, etc. , `continuous`,`Lipschitz continuous`. 





**standard uniqueness theorem** in the context of differential equations is often referred to as the **Picard-Lindelöf Theorem**



We need to recall some knowledge. 



### Vector Space, Inner product, Norm space, Metric space, Open ball/Closed ball, Open set

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
  
  - positiveness and non-degenerate
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

In the definition of metric space, we don't mention that it must be a vector space, only notice that is non-empty set.

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

- Open Ball:
  Let $(M, d)$ be a metric space, namely a set $M$ with a metric $d$, and let $r\gt 0 \in R$. The open ball of radius $r$ centered at a point $p \in M $, denoted by $B_r(p)$ is 
  
  $$
  B_r(p) = \{x \in M | d(x, p) \lt r \}  
  $$

- Closed Ball:
  
  $$
  B_r[p] = \{x \in M | d(x, p) \le r \}  
  $$

- Open set: 
  A subset $U$ of a metric space $(M, d)$ is open if, for any $x \in U$, $\exist \varepsilon \gt 0, \varepsilon \in R$, such that any point $y \in M$ satisfying $d(x, y)\lt \varepsilon$ belongs to $U$. 
  Equivalently, $U$ is open if every point in $U$ has a neighborhood contained in $U$.

- Closed Set:
  A closed set is a set whose complement is an open set. 
  A closed set is defined as a set which contains all its limit points. 
  
  

Consider rational set $Q$, $Q$ is closed related to $Q$, since all limit points in $Q$  (A world is all $Q$, although $\sqrt{2}$ is irrational, it is not in $Q$ world). 

But $Q$ is not closed related to $R$. That because $\sqrt{2}$  is irrational as a limited point of sequence $1.4, 1.414, \dots$. However, in $R$, $\sqrt{2}$ is not in $Q$.  



### Completeness of Metric Space

**Definition 2.1.5:**

In a metric space, without the vector space structure, we can easily define the concepts of  convergence, Cauchy sequence, completeness etc. 

In other words, convergence is defined by metric, prerequisite has a metric space. 



- Convergent
  A sequence $\{x_k\}$ in a metrix space $(M, d)$ is said to be convergent to $x \in M$ 
  if $d(x_k, x_l) \rightarrow 0$ as $k \rightarrow \infin $ .

- Cauchy Sequence
  A sequence $\{x_k\}$ in a metrix space $(M, d)$ is said to be Cauchy
  if $d(x_k, x_l) \rightarrow 0$ as $k, l \rightarrow \infin$. 

Metric space must have sequence, a constant sequence is a Cauchy Sequence. 



**Definition 2.1.6:**

Intuitively, a space is complete if there are no "points missing" from it (inside or at the boundary). For instance, the set of [rational numbers](https://en.wikipedia.org/wiki/Rational_number "Rational number") is not complete, because e.g. $\sqrt{2}$ is "missing" from it, even though one can construct a Cauchy sequence of rational numbers that converges to it (see further examples below). It is always possible to "fill all the holes", leading to the _completion_ of a given space, as explained below.

- Completeness
  A metrix space $(M, d)$ is said to be complete if every Cauchy Sequence of points in $M$ has a limit that is also in $M$. Also, every cauchy sequence in $M $ converges in $M$. 
  
  

### Important Theorem from Functional Analysis

**Example 2.1.2:**

Prove the space of continuous functions on an closed interval $C([a, b])$ is a complete metric space. (Endow this space with the sup-norm space)

**Proof:**

The sup-norm metric $d(f, g)$ between two functions $f, g \in C([a, b])$ is defined as:

$$
d(f, g) = \underset{x \in [a, b]}{\text{sup}} |f-g|
$$

**First,** we find a Cauchy Sequence. In metric space, there must exist a Cauchy Sequence. 

Let $\{f_n\}$ be a Cauchy Sequence in $C([a, b])$. By the definition of Cauchy Sequence: for every $\varepsilon \gt 0$, there exists an integer $N$ such that for all $m, n \ge N$, (An integer)

$$
d(f_n, f_m) = \underset{x \in [a, b]}{\text{sup}} |f_n-f_m| \lt \varepsilon
$$

(This tell us that for large $n$ and $m$, the functions $f_n(x)$ and $f_m(x)$ are <u>uniformly</u> close to each other, meaning the difference $|f_n(x)-f_m(x)|$ is small<u> for all</u> $x \in [a, b]$)

**Second,** we need to prove there exists convergence of Cauchy Sequence

Since $\{f_n\}$ is a Cauchy Sequence in the sup-norm, it is also a pointwise Cauchy Sequence. 

$$
|f_n(x)-f_m(x)| \le \|f_n-f_m\|_{\infin} \lt \varepsilon
$$

Fix any $x \in [a, b]$, the sequence of real numbers $\{f_n(x)\}$ is a Cauchy Sequence in $\mathbb R$. 

Since $\mathbb R$ is complete, the convergence exists in $\mathbb R$ for $n \gt N_x$: 

$$
f(x) = \lim_{n\rightarrow \infin}{f_n(x)}
$$

belongs to $\mathbb R$ for every $x \in [a, b]$ 

**Third,** We have constructed Cauchy Sequence $\{f_n\}$, and proved there exists pointwise convergence $f(x)$ of $\{f_n\}$. Next, we need to prove the $f(x) \in C([a, b])$ which means $f(x)$ is continuous. 

We use **limit uniform theorem**. 

Since $\{f_n\}$ is Cauchy Sequence, $\forall \varepsilon \gt 0, \exist N \gt 0, s.t.  \forall n, m \gt N, |f_n(x)-f_m(x)| \lt \varepsilon $ (globally holds)

Taking for any fixed points $f_m(x) \rightarrow f(x)$ as $m \gt N, m \rightarrow \infin$. (pointwise)

$$
|f_n(x)-f(x)| \lt \varepsilon
$$

still holds as it is Cauchy Sequence. 



Thus, $\{f_n\}$ is Uniformly Convergent. 

**Uniform limit theorem:**

Let $x_0 \in E$  be an arbitrary point. $\varepsilon \gt 0$. By uniform convergence, there exists a natural number $N$ such that

$$
d(f_N(x), f(x)) \leq \frac{\varepsilon}{3}
$$

It follows from the continuity of $f_N$ at $x_0 \in E$ that there exists an open set $U$ containing $x_0$ denoted $U_{x_0}$ such that 

$$
\forall x \in U_{x_0}, d(f_N(x), f_N(x_0)) \le \frac{\varepsilon}{3}
$$

Using the triangle inequality of metric space property:

$$
\forall x \in U_{x_0}, d(f(x), f(x_0))\le d(f(x), f_N(x))+d(f_N(x), f_N(x_0))+d(f_N(x_0), f(x_0)) \le \varepsilon
$$

Thus $f$ is continuous at $U_{x_0}$



We have proved $f \in C([a, b])$, hence $C([a, b])$ is completed. 

**Counterexample:**











### Schwartz Inequality

**Theorem 2.1.2:**

- Schwartz inequality:
  
  
  
  
  
  
  
  

https://poe.com/s/ncdPuKuzYf9YfzvloTAr
