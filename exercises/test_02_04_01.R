test <- function() {
    # Here we can either check objects created in the solution code, or the
    # string value of the solution, available as .solution. See the testTemplate
    # in the meta.json for details.
    if (! "mlr3" %in% .packages())
      stop("mlr3 is not loaded")

    success("Well done!")
}
