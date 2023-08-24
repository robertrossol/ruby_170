greeting () {
  echo Hello $1
}

greeting 'Peter' # outputs 'Hello Peter'

greeting () {
  # names="$1 $2"
  names="$@"

  for name in $names
  do
    echo "Hello $name"
  done
}

greeting 'Peter' 'Paul' # outputs 'Hello Peter' 'Hello Paul' on separate lines
