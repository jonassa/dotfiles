field() {
    awk "{print \$$1}"
}
for n in {1..9}; alias f$n="field $n"

