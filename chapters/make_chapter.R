#' @param section_file [character(1L)] Name of the "sectionxx.md" to update.
#' @param file_pre [character(1L)] Prefix for new files. This is meant for testing
#'   since the old files are overwritten if `file_pre = ""`.
#' @param write_sub [logical(1L)] Logical indicating whether the suchapter files
#'   should also be newly written (default = TRUE). This is just necessary if
#'   new subchapters where added and the next and prev yaml section changes.
updateChapter = function (section_file, file_pre = "", write_sub = TRUE) {

  lns = readLines(section_file)
  yaml_idx = grep("---", lns)
  lns = lns[seq_len(yaml_idx[2])]
  lns[yaml_idx[2] + 1] = ""

  all_files = list.files(full.names = TRUE)
  str_filter = strsplit(x = section_file, split = ".md")[[1]][1]
  all_files_md = all_files[grepl("chapter[0-9][0-9]-[0-9][0-9]", all_files)]

  # Create data frame with order info of chapter. Also remove the "." and ".md"
  # to prepare and add in prev and next of subchapter:
  nchar_subch = nchar(all_files_md)
  df_files = data.frame(
    subch = substring(substring(all_files_md, 2, nchar_subch), 1, nchar_subch - 4),
    ch = as.integer(stringr::str_extract(all_files_md, "[0-9]+"))
,
    sub = as.integer(stringr::str_extract(substring(all_files_md, 13, nchar_subch), "[0-9]+"))
  )
  df_files$order = order(df_files$ch, df_files$sub)

  sub_files = all_files[grepl(str_filter, all_files)]
  sub_files = sub_files[!grepl(section_file, sub_files)]

  for (fn in sub_files) {
    cat(" -- Processing sub file", fn, "\n")
    yaml_meta = rmarkdown::yaml_front_matter(fn)
    link = strsplit(x = fn, split = "[.]")[[1]][2]
    lns_sub = readLines(fn)

    # Write new prev and next:
    subch_idx = which(df_files$subch == link)
    subch_order = df_files$order[subch_idx]

    if (write_sub) {
      if (subch_order == max(df_files$order)) {
        yaml_meta$`next` = "null"
      } else {
        yaml_meta$`next` = df_files$subch[df_files$order == subch_order + 1]
      }

      if (subch_order == 1L) {
        yaml_meta$prev = "null"
      } else {
        yaml_meta$prev = df_files$subch[df_files$order == subch_order - 1]
      }

      lns_sub[grep("prev:", lns_sub)[1]] = paste0("prev: ", yaml_meta$prev)
      lns_sub[grep("next:", lns_sub)[1]] = paste0("next: ", yaml_meta$`next`)

      #browser()
      # Write sub file:
      fileConn = file(paste0(file_pre , substring(fn, 3, nchar(fn))))
      writeLines(text = lns_sub, con = fileConn)
      close(fileConn)
    }

    code_add = paste0("
<section class=\"c72e2d57\">
  <h2 class=\"_5e0ebe7a\">
  <a class=\"_46224d00 _7e2d93b5\" href=\"", link, "\">", yaml_meta$title, "</a>\n
  </h2>
  <p class=\"de526628\">
  <a class=\"_46224d00 _7e2d93b5\" href=\"", link, "\">", yaml_meta$description, "</a>
  </p>
</section>\n\n")

    lns = c(lns, code_add, "", "")
  }

  fileConn = file(paste0(file_pre , section_file))
  writeLines(text = lns, con = fileConn)
  close(fileConn)
}


files = list.files(full.names = TRUE)
chapter = paste0("chapter0", seq_len(8), ".md")

for (fn in chapter) {
  cat("Processing chapter", fn, "\n")
  txt = updateChapter(fn)
}


