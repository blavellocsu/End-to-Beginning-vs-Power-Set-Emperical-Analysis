# End-to-Beginning-vs-Power-Set-Emperical-Analysis
This experiment compares the End to Beginning Algorithm to the Power Set algorithm, implemented in C++.

The Hypotheses
This experiment will test the following hypotheses:
1. Exhaustive search algorithms are feasible to implement, and produce correct outputs.
2. Algorithms with exponential or factorial running times are extremely slow, probably too slow to be of practical use.
  
## Psuedocode:

### Algorithm #1 - End to Beginning
Input: Sequence A of n elements

Output: Sequence R of the longest decreasing subsequence

```
def sequence longest_decreasing_end_to_beginning(sequence A):
def n = A.size()
     def vector H(n, 0) //define vector of 0's size of A
     for i = n to 0
           for j = i+1 to n
                if ( A[j] < A[i] && H[j] >= H[i] )
                      H[i] = 1 + H[j]
     define max = max_element((H.begin(), H.end())+1)
     define vector R(max)
     def index = max - 1
     def j = 0
     for i to n
           if H[i] == index
                R[j] = A[i]
index--
                j++
     return sequence(R.begin(), R.begin() + max)
```

### Algorithm #2 - Powerset
Input: Sequence A of n elements

Output: Sequence R of the longest decreasing subsequence
```
def sequence longest_decreasing_powerset(sequence A):
     def n = A.size()
     def sequence best
     def vector stack(n+1,0)
     def k = 0;
     while (true)
           if stack[k] < n
                stack[k+1] = stack[k] + 1
++k else
                stack[k-1]++
                k—
if k == 0 break
           sequence candidate
           for i = 1 to k
                candidate.push_back(A[stack[i]-1)
           if (is_decreasing(candidate) && candidate.size() > best.size())
best = candidate return best
```

## Mathematical Analysis: 

### Algorithm #1 - End to Beginning
`T(n) = 4n2 + 7n + 9 Big O = O ( n2 )`

### Algorithm #2 - Powerset
`T(n) = 6 + n + (2n • 7) + (2n • 5n) Big O = O ( n • 2n )`


## Empirical Analysis:
Note: The following diagrams were created in R Studio based on the data gathered from testing.
Diagram 1: Algorithm #1 - End to Beginning
![Image of Algorithm #1 - End to Beginning](https://github.com/blavellocsu/End-to-Beginning-vs-Power-Set-Emperical-Analysis/blob/master/images/etb.png)

Diagram 2: Algorithm #2 - Powerset
![Image of Algorithm #2 - Powerset](https://github.com/blavellocsu/End-to-Beginning-vs-Power-Set-Emperical-Analysis/blob/master/images/ps.png)

## Notes on Processing Empirical Data:
In order to gather accurate empirical data, I altered the subsequence_timing.cpp file to test each value of n from 1 - 26. Furthermore, I created a nested loop to test each value of n 3 times to account for outliers in the data.
Thus, 78 independent data points were gathered for each algorithm.

I also altered the subsequence_timing.cpp to write the tested data out to two separate Comma Separated Value (CSV) files (dataEndToBeginning.csv, dataPowerSet.csv).

Finally, I created an R script that imports and analyzes the CSV data. It produces a scatterplot with the best fit curve to fit each data set.

## Further Analysis of the Algorithms and Data:
Both mathematical analysis and the empirical data both support the hypotheses that exhaustive search algorithms are feasible to implement, and that exponential and factorial algorithms are extremely slow and impractical.

Mathematical analysis show that the End_to_Beginning algorithm operates at O ( n2 ), making it perfect for practical use. The empirical data shown in Diagram 1 demonstrates that as the input size n increases reasonably. The largest instance size n tested, 26, operates in 6.568e-06 seconds.

Mathematical analysis of the Powerset algorithm, however, demonstrates that the Powerset method of searching is extremely slow. Thus, it is impractical to use with data sets larger than 20 — thus, this algorithm should not be used. Diagram 2 shows that when instance size n = 26, the algorithm operates in 97.068 seconds. Thus, as time increases exponentially, the algorithm is not useful for practical use as compared to the End_to_Beginning algorithm where the same instance operates in 6.568e-06 seconds.

Both of the diagrams above are consistent with the efficiency classes derived from the mathematical analysis of the algorithms. Thus, the evidence supports the hypotheses previously stated.
