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
