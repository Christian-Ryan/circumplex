// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// angle_mean
double angle_mean(NumericVector x);
RcppExport SEXP _circumplex_angle_mean(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(angle_mean(x));
    return rcpp_result_gen;
END_RCPP
}
// angle_median
double angle_median(NumericVector x);
RcppExport SEXP _circumplex_angle_median(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(angle_median(x));
    return rcpp_result_gen;
END_RCPP
}
// compare_pi
NumericVector compare_pi(NumericVector x);
RcppExport SEXP _circumplex_compare_pi(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(compare_pi(x));
    return rcpp_result_gen;
END_RCPP
}
// remainder
double remainder(double numerator, double denominator);
RcppExport SEXP _circumplex_remainder(SEXP numeratorSEXP, SEXP denominatorSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type numerator(numeratorSEXP);
    Rcpp::traits::input_parameter< double >::type denominator(denominatorSEXP);
    rcpp_result_gen = Rcpp::wrap(remainder(numerator, denominator));
    return rcpp_result_gen;
END_RCPP
}
// ssm_parameters
arma::vec ssm_parameters(arma::vec scores, arma::vec angles);
RcppExport SEXP _circumplex_ssm_parameters(SEXP scoresSEXP, SEXP anglesSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type scores(scoresSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type angles(anglesSEXP);
    rcpp_result_gen = Rcpp::wrap(ssm_parameters(scores, angles));
    return rcpp_result_gen;
END_RCPP
}
// group_parameters
arma::vec group_parameters(arma::mat scores, arma::vec angles);
RcppExport SEXP _circumplex_group_parameters(SEXP scoresSEXP, SEXP anglesSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type scores(scoresSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type angles(anglesSEXP);
    rcpp_result_gen = Rcpp::wrap(group_parameters(scores, angles));
    return rcpp_result_gen;
END_RCPP
}
// mean_scores
arma::mat mean_scores(arma::mat cs, arma::vec grp, bool lwd);
RcppExport SEXP _circumplex_mean_scores(SEXP csSEXP, SEXP grpSEXP, SEXP lwdSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type cs(csSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type grp(grpSEXP);
    Rcpp::traits::input_parameter< bool >::type lwd(lwdSEXP);
    rcpp_result_gen = Rcpp::wrap(mean_scores(cs, grp, lwd));
    return rcpp_result_gen;
END_RCPP
}
// corr_scores
arma::mat corr_scores(arma::mat cs, arma::mat mv, arma::vec grp, bool lwd);
RcppExport SEXP _circumplex_corr_scores(SEXP csSEXP, SEXP mvSEXP, SEXP grpSEXP, SEXP lwdSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type cs(csSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type mv(mvSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type grp(grpSEXP);
    Rcpp::traits::input_parameter< bool >::type lwd(lwdSEXP);
    rcpp_result_gen = Rcpp::wrap(corr_scores(cs, mv, grp, lwd));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_circumplex_angle_mean", (DL_FUNC) &_circumplex_angle_mean, 1},
    {"_circumplex_angle_median", (DL_FUNC) &_circumplex_angle_median, 1},
    {"_circumplex_compare_pi", (DL_FUNC) &_circumplex_compare_pi, 1},
    {"_circumplex_remainder", (DL_FUNC) &_circumplex_remainder, 2},
    {"_circumplex_ssm_parameters", (DL_FUNC) &_circumplex_ssm_parameters, 2},
    {"_circumplex_group_parameters", (DL_FUNC) &_circumplex_group_parameters, 2},
    {"_circumplex_mean_scores", (DL_FUNC) &_circumplex_mean_scores, 3},
    {"_circumplex_corr_scores", (DL_FUNC) &_circumplex_corr_scores, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_circumplex(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
