test <- function() {

  sub_code = .solution
  sol_code = .check

  checkElements = function ()
  {
    sol_env = new.env()
    sub_env = new.env()

    capture.output({tmp = eval(parse(text = sol_code), envir = sol_env)})
    capture.output({tmp = eval(parse(text = sub_code), envir = sub_env)})

    sol_objects = names(sol_env)

    # First round: Check if all objects are available:
    for (robj in sol_objects) {
      if (! robj %in% names(sub_env)) {
        stop("Are you sure '", robj, "' is defined in your code?")
      }
    }

    # Second round: Check if objects are equal:
    for (robj in sol_objects) {
      tmp = all.equal(sol_env[[robj]], sub_env[[robj]])
      if (is.character(tmp[1])) {
        msg = paste(paste0("\n\t", seq_along(tmp), ".) ", tmp), collapse = "")
        stop("There is a problem with your object '", robj, "'! The 'all.equal' check gives:", msg)
      }
    }
    return(TRUE)
  }
  checkElements()
  #msg = paste(paste0("- ", ls(envir = .GlobalEnv, all.names = TRUE)), collapse = "\n\t")
  #success(.solBLA)
  success('Nice job!')
}
