# CE130_finite_element_method
Final project

# FEM Calculation of Warping (Saint-Venant Torsion)



[**https://en.wikiversity.org/wiki/Warping\_functions**](https://en.wikiversity.org/wiki/Warping_functions)

[**http://www-personal.umich.edu/~jbarber/Campos.pdf**](http://www-personal.umich.edu/~jbarber/Campos.pdf)

[**http://www.sciencedirect.com/science/article/pii/S0020722510000443**](http://www.sciencedirect.com/science/article/pii/S0020722510000443)

![](RackMultipart20201101-4-1gvs660_html_3cbf2f57f672b836.png)

![](RackMultipart20201101-4-1gvs660_html_f6cd8d70f8fc339f.png)

![](RackMultipart20201101-4-1gvs660_html_647dbbbb3936b1c8.png)

**RELEVANT QUESTIONS:**

**How to derive the weak form if you know the total potential energy?**

Take the directional (variational) derivative of the total potential energy to find the weak form

**What is warping?**

Extensional Deformation in the direction of the axis about which the torque is applied

Reference:

[https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-20-structural-mechanics-fall-2002/lecture-notes/unit10.pdf](https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-20-structural-mechanics-fall-2002/lecture-notes/unit10.pdf)

**How to take variational derivative?**

Consider the kinematically admissible displacement _ũ_(_x_)=_u_(_x_)+αδ_u_(_x_) where the variation from the exact solution _u(x__)_ is given by the function δ_u_(_x_) times the parameter α. Since _ũ_(_x_) must satisfy the same kinematical boundary conditions as _u(x__)_, it follows that δ_u_(_x_ = 0) = 0.

[**Reference Link #1**](http://www.mecheng.iisc.ernet.in/~suresh/me237/feaNotes/Chapter3.pdf)

**Understand and derive the boundary conditions for both the Saint- Venant Torsion?**

[**http://onlinelibrary.wiley.com/doi/10.1002/9781119274063.ch5/pdf**](http://onlinelibrary.wiley.com/doi/10.1002/9781119274063.ch5/pdf)

**How to construct kinematically admissible trial functions?**

**As a special Ritz method, what are the special advantages FEM has?**

The Rayleigh-Ritz setting results in finite element methods having the following desirable features

1. general regions and boundary conditions are relatively easy to handle and higher-order accuracy is relatively easy to achieve

2. the conformity of the finite element spaces is sufficient to guarantee stability and optimal accuracy

3. for systems of PDEs, all variables can be approximated using a single type of finite element space

4. the resulting linear systems are a) sparse; b) symmetric; c) positive definite

https://people.sc.fsu.edu/~mgunzburger/files\_talks/gunzburger-ls-talk.pdf

**What is the main difference between the Prandtl stress function method and the Saint Venant Torsion solution?**

For 3D problems, a warping function for torsion is often applied to solve for the displacements. When dealing with plane problems, an alternative approach can be used to solve for stresses rather than displacements. Thus, the Prandtl stress function is developed to simplify the boundary conditions of the problem and provide a cleaner representation of the stress fields as compared to the warping function.

**What are the main differences between the method of conservation energy and the minimum potential energy principle?**

Principle of minimum potential energy can only be used to solve problems involving kinematically admissible systems while the method of conservation energy can be applied in a wider range of problems.

[Reference](https://engineering.purdue.edu/~aprakas/CE474/CE474-Ch2-WorkEnergyMethods.pdf)

**What is the conservative force?**

Force (or force systems) where the work done by the force is path independent. Can be tested by taking the partial derivatives of a force field and seeing if they are equal.

**Given the weak formulation, derive the strong form and the natural boundary conditions**

**Given a weak form, derive the FEM discrete algebraic equations**

**(****This stuff is the derivation in progress)**

**(1/(5x+1))(-2x^3+xy^2-2xy+x)dxdy**

**Integrating from -sqrt(2)/2 to sqrt(2)/2 (with respect to x)**

**Without bounds**

**y\*x\*(2\*x^2+3\*y^2-6\*y+3)/(3\*(y-2))**

**With bounds**

**y\*(255821727047184\*y^2-511643454094369\*y+341095636062912)/(180893277969918\*(y-2))**

**Integrating this from 0 to 1 (with respect to y)**

**Without bounds**

**(170547818031456\*y^3-y^2+682191272125820\*y+1364382544251640\*ln(abs(y-2)))/361786555939836**

**With bounds**

− **0.2569991119609657 \*2**

**Need to mutiply by G and theta still to find T**

**Using T we can find Psi the Warping Function**

![](RackMultipart20201101-4-1gvs660_html_cbba567023a8dfc8.png)**= G(****θ****)\*(2xy-2x)/(5x+1)**

![](RackMultipart20201101-4-1gvs660_html_589344062e2064d3.png) **=** **G(****θ****)\*(20x****3 ****+6x**** 2 ****-y**** 2****+2y-1)/(5x+1)****2**

**Therefore**
