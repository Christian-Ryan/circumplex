#include <Rcpp.h>

using namespace Rcpp;

// [[Rcpp::export]]
double angle_mean(NumericVector x) {
  double n = x.size();
  double S = 0;
  double C = 0;
  double out;
  // Decompose angles into rectangular coordinates
  for(int i(0); i < n; i++) {
    S += sin(x[i]);
    C += cos(x[i]);
  }
  double R = (sqrt(pow(S, 2) + pow(C, 2)) / n);
  // A vector length of zero has no angular mean
  if (R > DBL_EPSILON) {
    out = std::atan2(S, C);
  } else {
    out = NA_REAL;
  }
  return out;
}

double angle_dev(NumericVector theta, double xv) {
  double n = theta.size();
  double values = 0;
  for(int j(0); j < n; j++) {
    values += fabs(PI - fabs(theta[j] - xv));
  }
  values = values / n;
  values = PI - values;
  return values;
}

// [[Rcpp::export]]
double angle_median(NumericVector x) {
  double n = x.size();
  double dev_val;
  double minimum = PI;
  NumericVector candidates(1);
  // Find candidates for the median (with the minimum average deviation)
  for(int i(0); i < n; i++) {
    dev_val = angle_dev(x, x[i]);
    if(((dev_val - minimum) / n) < -DBL_EPSILON) {
      minimum = dev_val;
      candidates[0] = x[i];
    } else if (fabs(dev_val - minimum) <= pow(10, -8)) {
      candidates.push_back(x[i]);
    }
  }
  // The median is the angular mean of these candidates
  return angle_mean(candidates);
}

// [[Rcpp::export]]
double angle_dist(double x, double y) {
  return std::min(x - y, 2 * PI - (x - y));
}

// [[Rcpp::export]]
NumericVector compare_pi(NumericVector x) {
  int n = x.size();
  NumericVector y = clone(x);
  for (int i(0); i < n; i++) {
    y[i] = (y[i] < -PI)?(y[i] + (2 * PI)):(y[i]);
    y[i] = (y[i] > PI)?(y[i] - (2 * PI)):(y[i]);
  }
  return y;
}