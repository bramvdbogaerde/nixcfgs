
echo $binary
if [ ! -f $out/bin/pycharm.sh ]; then
   tar xf $binary
   ls -rtl
   export EXTRACTED=$(find . -maxdepth 1 -type d -name pycharm-*)
   mkdir -p $out
   mv $EXTRACTED/* $out/
fi

echo "Done"
