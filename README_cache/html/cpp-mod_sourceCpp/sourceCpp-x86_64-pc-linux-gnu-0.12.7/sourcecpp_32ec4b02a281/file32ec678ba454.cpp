#include <Rcpp.h>

#include <algorithm>
#include <string>

using namespace Rcpp;

// [[Rcpp::export(rng = FALSE)]]
SEXP change_case(Symbol name, bool to_upper = false) {
  std::string name_string = name.c_str();
  std::transform(name_string.begin(), name_string.end(),
                 name_string.begin(), to_upper ? ::toupper : ::tolower);
  return CharacterVector(name_string);
}


#include <Rcpp.h>
// change_case
SEXP change_case(Symbol name, bool to_upper);
RcppExport SEXP sourceCpp_1_change_case(SEXP nameSEXP, SEXP to_upperSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::traits::input_parameter< Symbol >::type name(nameSEXP);
    Rcpp::traits::input_parameter< bool >::type to_upper(to_upperSEXP);
    rcpp_result_gen = Rcpp::wrap(change_case(name, to_upper));
    return rcpp_result_gen;
END_RCPP
}
