export PATH="$findutils/bin:$coreutils/bin:$gnutar/bin:$gzip/bin:$gnused/bin"

source $unpack

mv $out/bin/pycharm.sh $out/bin/pycharm_inner.sh
cat $ideawrapper > $out/bin/pycharm.sh
chmod +x $out/bin/pycharm.sh

sed "s~JDK_PATH~$jdk~g" $out/bin/pycharm.sh | tee $out/bin/pycharm.sh 
sed "s~PYCHARM_PATH~$out~g" $out/bin/pycharm.sh | tee $out/bin/pycharm.sh
