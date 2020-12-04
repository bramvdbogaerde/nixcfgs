if [ ! -f $out/bin/idea.sh ]; then
   tar xf $binary
   mkdir -p $out
   mv idea-IU-203.5981.155/* $out/
fi

echo "Done"

