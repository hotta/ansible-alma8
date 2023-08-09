if [ "${PATH#{{ COMPOSER_BINDIR }}}" = "$PATH" ]; then
  PATH=$PATH:{{ COMPOSER_BINDIR }}
  export PATH
fi
