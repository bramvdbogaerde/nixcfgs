

if [ ! -f $out/bin/idea.sh ]; then
   tar xf $binary
   export EXTRACTED=$(find . -maxdepth 1 -type d -name idea-IU-*)
   mkdir -p $out
   mv $EXTRACTED/* $out/
fi

echo "Done"
