
updateFile = function (section_file) {

  lns = readLines(section_file)
  yaml_idx = grep("---", lns)
  lns = lns[seq_len(yaml_idx[2])]
  lns[yaml_idx[2] + 1] = ""

  all_files = list.files(full.names = TRUE)
  str_filter = strsplit(x = section_file, split = ".md")[[1]][1]
  sub_files = all_files[grepl(str_filter, all_files)]
  sub_files = sub_files[!grepl(section_file, sub_files)]

  for (fn in sub_files) {
    cat(" -- Processing sub file", fn, "\n")
    yaml_meta = rmarkdown::yaml_front_matter(fn)
    link = strsplit(x = fn, split = "[.]")[[1]][2]
    code_add = paste0("
<section class=\"c72e2d57\">
  <h2 class=\"_5e0ebe7a\">
  <a class=\"link-module-root-46224d00 link-module-hidden-7e2d93b5\" href=\"", link, "\">", yaml_meta$title, "</a>\n
  </h2>
  <p class=\"de526628\">
  <a class=\"_46224d00 _7e2d93b5\" href=\"", link, "\">", yaml_meta$description, "</a>
  </p>
</section>\n\n")

    lns = c(lns, code_add, "", "")
  }

  return (lns)
}


files = list.files(full.names = TRUE)
chapter = paste0("chapter0", seq_len(7), ".md")

for (fn in chapter) {
  cat("Processing file", fn, "\n")
  txt = updateFile(fn)

  #fileConn = file(paste0("tst_", fn))
  fileConn = file(fn)
  writeLines(text = txt, con = fileConn)
  close(fileConn)
}


