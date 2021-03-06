new_instrument <- function(Scales, Anchors, Items, Norms, Details, ...) {
  new_s3_scalar(
    Scales = Scales,
    Anchors = Anchors,
    Items = Items,
    Norms = Norms,
    Details = Details,
    ...,
    class = "circumplex_instrument"
  )
}

is_instrument <- function(x) {
  typeof(x) == "list" & class(x) == "circumplex_instrument"
}

#' @export
print.circumplex_instrument <- function(x, ...) {
  cat(
    x$Details$Abbrev, ": ", x$Details$Name, "\n",
    x$Details$Items, " items, ", x$Details$Scales, " scales, ", 
    nrow(x$Norms[[2]]), " normative data sets", "\n",
    x$Details$Reference, "\n",
    "<", x$Details$URL, ">", "\n",
    sep = ""
  )
}

#' @export
summary.circumplex_instrument <- function(object, scales = TRUE, anchors = TRUE,
                               items = TRUE, norms = TRUE, ...) {
  x <- object
  print(x)
  if (scales == TRUE) {
    cat("\n")
    scales(x)
  }
  if (anchors == TRUE) {
    cat("\n")
    anchors(x)
  }
  if (items == TRUE) {
    cat("\n")
    items(x)
  }
  if (norms == TRUE) {
    cat("\n")
    norms(x)
  }
}

#' Display the scales of a circumplex instrument
#'
#' Display the scales of a circumplex instrument including the total number of
#' scales and each scale's abbreviation, hypothetical angle, and text label.
#'
#' @param x Required. An object of the instrument class.
#' @param items Optional. A logical determining whether the items for each scale
#'   should be displayed below its other information (default = FALSE).
#' @return The same input object. Prints text to console.
#' @family instrument functions
#' @export
#' @examples
#' instrument(csip)
#' scales(csip)
#' scales(csip, items = TRUE)
scales <- function(x, items = FALSE) {
  assert_that(is_instrument(x), is.flag(items))

  cat("The ", x$Details$Abbrev, " contains ", x$Details$Scales, 
      " circumplex scales.\n", sep = "")
  for (i in 1:nrow(x$Scales)) {
    xi <- x$Scales[i, ]
    cat(xi$Abbrev, ": ", xi$Label, " (", xi$Angle, " degrees)", "\n", sep = "")
    if (items == TRUE) {
      item_nums <- as.integer(strsplit(xi$Items, ",")[[1]])
      for (j in 1:length(item_nums)) {
        num_j <- item_nums[[j]]
        item_j <- x$Items[[num_j, "Text"]]
        cat("    ", num_j, ". ", item_j, "\n", sep = "")
      }
    }
  }

  invisible(x)
}

#' Display the items of a circumplex instrument
#'
#' Display the items of a circumplex instrument including the total number of
#' items and each item's number and text. The item ordering/numbering displayed
#' here is the same ordering/numbering assumed by the \code{score()} function.
#'
#' @param x Required. An object of the instrument class.
#' @return The same input object. Prints text to console.
#' @family instrument functions
#' @export
#' @examples
#' instrument(csip)
#' items(csip)
items <- function(x) {
  assert_that(is_instrument(x))

  cat("The ", x$Details$Abbrev, " contains ", x$Details$Items, " items (", 
    x$Details$Status, "):\n", sep = "")
  for (i in 1:nrow(x$Items)) {
    xi <- x$Items[i, ]
    if (!is.na(xi$Number)) {
      cat(xi$Number, ". ", sep = "")
    }
    cat(xi$Text, "\n", sep = "")
  }

  invisible(x)
}

#' Display the anchors of a circumplex instrument
#'
#' Display the anchors of a circumplex instrument including the total number of
#' anchors and each anchor's numerical value and text label. Anchors are the
#' response options that respondants select from (e.g., 0 = No, 1 = Yes).
#'
#' @param x Required. An object of the instrument class.
#' @return The same input object. Prints text to console.
#' @family instrument functions
#' @export
#' @examples
#' instrument(csip)
#' anchors(csip)
anchors <- function(x) {
  assert_that(is_instrument(x))

  cat(
    "The ", x$Details$Abbrev, " is rated using the following ",
    nrow(x$Anchors), "-point scale.", "\n", sep = ""
  )
  for (i in seq_along(x$Anchors$Value)) {
    cat(x$Anchors$Value[[i]], ". ", x$Anchors$Label[[i]], "\n",sep = "")
  }

  invisible(x)
}

#' Display the norms for a circumplex instrument
#'
#' Display the norms for a circumplex instrument including the total number of
#' normative data sets available and each data set's number, sample size,
#' population, and source reference and hyperlink. If another normative data set
#' exists that is not yet included in the package, please let us know.
#'
#' @param x Required. An object of the instrument class.
#' @return The same input object. Prints text to console.
#' @family instrument functions
#' @export
#' @examples
#' instrument(csip)
#' norms(csip)
norms <- function(x) {
  assert_that(is_instrument(x))

  samples <- x$Norms[[2]]
  n_norms <- nrow(samples)

  if (n_norms == 0) {
    cat("The ", x$Details$Abbrev, " currently has no normative data sets.", 
        "\n", sep = "")
    return()
  }

  cat("The ", x$Details$Abbrev, " currently has ", n_norms, 
      " normative data set(s):", "\n", sep = "")

  for (i in 1:n_norms) {
    sample_i <- samples$Sample[[i]]
    size_i <- samples$Size[[i]]
    pop_i <- samples$Population[[i]]
    cat(
      sample_i, ". ", size_i, " ", pop_i, "\n",
      samples$Reference[[i]], "\n",
      "<", samples$URL[[i]], ">", "\n",
      sep = ""
    )
  }

  invisible(x)
}


#' List all available instruments
#'
#' The circumplex package includes information about numerous circumplex
#' instruments including instructions for scoring and standardizing items.
#' Individual instruments can be loaded using the \code{instrument} function.
#'
#' @family instrument functions
#' @export
#' @examples
#' instruments()
instruments <- function() {

  # TODO: Find a way to automate this - maybe data$results minus example data?

  cat(
    "The circumplex package currently includes 13 instruments:\n",
    "1. CSIE: Circumplex Scales of Interpersonal Efficacy (csie)\n",
    "2. CSIG: Circumplex Scales of Intergroup Goals (csig)\n",
    "3. CSIP: Circumplex Scales of Interpersonal Problems (csip)\n",
    "4. CSIV: Circumplex Scales of Interpersonal Values (csiv)\n",
    "5. IGI-CR: Interpersonal Goals Inventory for Children, Revised Version (igicr)\n",
    "6. IIP-32: Inventory of Interpersonal Problems, Brief Version (iip32)\n",
    "7. IIP-64: Inventory of Interpersonal Problems (iip64)\n",
    "8. IIP-SC: Inventory of Interpersonal Problems, Short Circumplex (iipsc)\n",
    "9. IIS-32: Inventory of Interpersonal Strengths, Brief Version (iis32)\n",
    "10. IIS-64: Inventory of Interpersonal Strengths (iis64)\n",
    "11. IIT-C: Inventory of Influence Tactics Circumplex (iitc)\n",
    "12. IPIP-IPC: IPIP Interpersonal Circumplex (ipipipc)\n",
    "13. ISC: Interpersonal Sensitivities Circumplex (isc)\n"
  )
}

#' Load a specific instrument object
#'
#' The circumplex package includes information about numerous circumplex
#' instruments including instructions for scoring and standardizing items to be
#' used in conjunction with the \code{score} and \code{standardize} functions.
#' This function loads the information for a specific instrument into memory.
#' See the \code{instruments} function to list all available instruments.
#'
#' @param code Required. A string (e.g., "iip32") or text in non-standard
#'   evaluation (e.g., iip32). The code of the instrument assigned by this
#'   package and displayed in parentheses by \code{instruments()}.
#' @return The instrument object for the requested circumplex instrument. If
#'   the function is called without a name assignment (LHS), then the object
#'   will be created in the global environment with the default name as above.
#'   Or, if a name is assigned (LHS), the object will have that name instead.
#' @family instrument functions
#' @export
#' @examples
#' instrument(iip32)
#' instrument("iip32")
#' x <- instrument(iip32)
instrument <- function(code) {
  code <- rlang::enquo(code)
  assert_that(is_provided(code))
  name_str <- rlang::quo_name(code)
  utils::data(list = name_str)
  invisible(get(name_str))
}
