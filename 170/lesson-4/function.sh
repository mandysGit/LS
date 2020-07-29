greeting () {
  echo Hello $1
}

greeting 'Peter'

new_greeting () {
  echo "Hello $1"
  echo "Hello $2"
}

new_greeting 'Peter' 'Paul'
