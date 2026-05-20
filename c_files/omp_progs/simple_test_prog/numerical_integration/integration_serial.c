#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


void numerical_integration(double lower_bound, double upper_bound, int num_increments) {

    double diff = upper_bound - lower_bound;
    double individual_incr = diff/((double) num_increments);
    printf("diff is %f, num_incr is %d, individual incr is: %f\n", diff, num_increments, individual_incr);

    // function is 4.0/(1+x^2) from 0 to 1

    double sum = 0;
    for (int i = 0; i < num_increments; i++) {
        double denom_sq = (lower_bound + (i * individual_incr));
        double f_val_at_x = (4.0)/((double)(1 + (denom_sq * denom_sq)));
        sum = sum + ((f_val_at_x) * individual_incr);
    }
    printf("sum is %f\n", sum);
}
int main() {
    numerical_integration(0, 1, 10000000);
}