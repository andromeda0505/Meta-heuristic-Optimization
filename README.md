# Metaheuristic Optimization

In mathematical programming, a heuristic algorithm is a procedure that determines near-optimal solutions 
to an optimization problem. However, this is achieved by trading optimality, completeness, accuracy, or 
precision for speed. Nevertheless, heuristics is a widely used technique for a variety of reasons:

  * Problems that do not have an exact solution or for which the formulation is unknown
  * The computation of a problem is computationally intensive
  * Calculation of bounds on the optimal solution in branch and bound solution processes


## Simulated Annealing

Simulated annealing is a method for solving unconstrained and bound-constrained optimization problems. 
The method models the physical process of heating a material and then slowly lowering the temperature to 
decrease defects, thus minimizing the system energy.


## Ant Colony Optimization

Ant Colony Optimization technique is purely inspired from the foraging behaviour of ant colonies, first
 introduced by Marco Dorigo in the 1990s. Ants are eusocial insects that prefer community survival and 
sustaining rather than as individual species. They communicate with each other using sound, touch and pheromone.
 Pheromones are organic chemical compounds secreted by the ants that trigger a social response in members of same 
species. These are chemicals capable of acting like hormones outside the body of the secreting individual, to impact 
the behaviour of the receiving individuals. Since most ants live on the ground, they use the soil surface to leave pheromone 
trails that may be followed (smelled) by other ants. Ants live in community nests and the underlying principle of ACO is to 
observe the movement of the ants from their nests in order to search for food in the shortest possible path. Initially, ants 
start to move randomly in search of food around their nests. This randomized search opens up multiple routes from the nest to
 the food source. Now, based on the quality and quantity of the food, ants carry a portion of the food back with necessary pheromone
 concentration on its return path. Depending on these pheromone trials, the probability of selection of a specific path by the following 
ants would be a guiding factor to the food source. Evidently, this probability is based on the concentration as well as the rate of evaporation 
of pheromone. It can also be observed that since the evaporation rate of pheromone is also a deciding factor, the length of each path can easily
 be accounted for.


## Electromagnetic Optimization

Electromagnetic Optimization (EMO) is a physics-inspired metaheuristic optimization algorithm. The proposed algorithm is inspired
 by the behavior of electromagnets with different polarities and takes advantage of a nature-inspired ratio, known as the golden ratio. 
In EMO, a possible solution is an electromagnetic particle made of electromagnets, and the number of electromagnets is determined by the 
number of variables of the optimization problem. EMO is a population-based algorithm in which the population is divided into three fields 
(positive, negative, and neutral); attraction-repulsion forces among electromagnets of these three fields lead particles toward global minima.
 The golden ratio determines the ratio between attraction and repulsion forces to help particles converge quickly and effectively.


## Bacteria Foraging Optimization

Bacteria Foraging Optimization Algorithm (BFO), proposed by Passino, is a new comer to the
family of nature-inspired optimization algorithms. For over the last five decades, optimization
algorithms like Genetic Algorithms (GAs), Evolutionary Programming (EP), Evolutionary
Strategies (ES), which draw their inspiration from evolution and natural genetics, have been
dominating the realm of optimization algorithms. Recently natural swarm inspired algorithms like
Particle Swarm Optimization (PSO), Ant Colony Optimization  (ACO) have found their way
into this domain and proved their effectiveness. Following the same trend of swarm-based algorithms,
Passino proposed the BFO. Application of group foraging strategy of a swarm of E.coli
bacteria in multi-optimal function optimization is the key idea of the new algorithm. Bacteria search
for nutrients in a manner to maximize energy obtained per unit time. Individual bacterium also
communicates with others by sending signals. A bacterium takes foraging decisions after considering
two previous factors. The process, in which a bacterium moves by taking small steps while searching
for nutrients, is called chemotaxis and key idea of BFOA is mimicking chemotactic movement of
virtual bacteria in the problem search space. 


## Artificial Bee Colony

The Artificial Bee Colony (ABC) algorithm is a swarm based meta-heuristic algorithm that was introduced 
by Karaboga in 2005 for optimizing numerical problems. It was inspired by the intelligent
 foraging behavior of honey bees. The algorithm is specifically based on the model proposed by Tereshko and 
Loengarov for the foraging behaviour of honey bee colonies. The model consists of three essential components: 
employed and unemployed foraging bees, and food sources. The first two components, employed and unemployed foraging bees,
 search for rich food sources, which is the third component, close to their hive. The model also defines two leading modes
 of behaviour which are necessary for self-organizing and collective intelligence: recruitment of foragers to rich food sources
 resulting in positive feedback and abandonment of poor sources by foragers causing negative feedback.
In ABC, a colony of artificial forager bees (agents) search for rich artificial food sources (good solutions for
 a given problem). To apply ABC, the considered optimization problem is first converted to the problem of finding the best
 parameter vector which minimizes an objective function. Then, the artificial bees randomly discover a population of initial 
solution vectors and then iteratively improve them by employing the strategies: moving towards better solutions by means of a 
neighbour search mechanism while abandoning poor solutions.


## Genetic Algorithm

A genetic algorithm is a search heuristic that is inspired by Charles Darwin’s theory of natural evolution. This algorithm reflects
 the process of natural selection where the fittest individuals are selected for reproduction in order to produce offspring of the next
 generation. The process of natural selection starts with the selection of fittest individuals from a population. They produce offspring which
 inherit the characteristics of the parents and will be added to the next generation. If parents have better fitness, their offspring will be 
better than parents and have a better chance at surviving. This process keeps on iterating and at the end, a generation with the fittest individuals
 will be found. Five phases are considered in a genetic algorithm. (a) Initial population, (b) Fitness function, (c) Selection, (d) Crossover, (e)Mutation 


## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Data Exploration and Numerical Experimentation</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
