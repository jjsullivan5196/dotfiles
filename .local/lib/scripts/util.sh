# common functions for shell scripts

join_by() {
  SEP="$1"; shift
  printf "%s${SEP}" $@
}
