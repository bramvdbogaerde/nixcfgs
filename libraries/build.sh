echo $out
export PREFIX=$out/
tar xf $src
cd z3-z3-$z3Version
python3 ./scripts/mk_make.py --java --prefix=$out
cd build
make -j$(nproc)
make install
